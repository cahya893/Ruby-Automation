# frozen_string_literal: true

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'uri'

module Appium
  # The struct for 'location'
  Location = Struct.new(:latitude, :longitude, :altitude)

  module Core
    module Android
      autoload :Uiautomator1, 'appium_lib_core/android'
      autoload :Uiautomator2, 'appium_lib_core/android_uiautomator2'
      autoload :Espresso, 'appium_lib_core/android_espresso'
    end

    module Ios
      autoload :Xcuitest, 'appium_lib_core/ios_xcuitest'
    end

    autoload :Mac2, 'appium_lib_core/mac2'

    autoload :Windows, 'appium_lib_core/windows'

    # This options affects only client side as <code>:appium_lib</code> key.<br>
    # Read {::Appium::Core::Driver} about each attribute
    class Options
      attr_reader :custom_url, :default_wait,
                  :port, :wait_timeout, :wait_interval, :listener,
                  :direct_connect, :enable_idempotency_header

      def initialize(appium_lib_opts)
        @custom_url = appium_lib_opts.fetch :server_url, nil
        @default_wait = appium_lib_opts.fetch :wait, nil
        @enable_idempotency_header = appium_lib_opts.fetch :enable_idempotency_header, true

        @direct_connect = appium_lib_opts.fetch :direct_connect, true

        @port = appium_lib_opts.fetch :port, Driver::DEFAULT_APPIUM_PORT

        # timeout and interval used in ::Appium::Commn.wait/wait_true
        @wait_timeout  = appium_lib_opts.fetch :wait_timeout, ::Appium::Core::Wait::DEFAULT_TIMEOUT
        @wait_interval = appium_lib_opts.fetch :wait_interval, ::Appium::Core::Wait::DEFAULT_INTERVAL

        # to pass it in Selenium.new.
        # 'listener = opts.delete(:listener)' is called in Selenium::Driver.new
        @listener = appium_lib_opts.fetch :listener, nil
      end

      private

      def default_tmp_appium_lib_session
        ::Appium::Core::Base.platform.windows? ? 'C:\\\\Windows\\Temp\\appium_lib_session' : '/tmp/appium_lib_session'
      end
    end

    # DirectConnections has capabilities of directConnect
    class DirectConnections
      KEYS = {
        protocol: 'directConnectProtocol',
        host: 'directConnectHost',
        port: 'directConnectPort',
        path: 'directConnectPath'
      }.freeze

      W3C_KEYS = {
        protocol: 'appium:directConnectProtocol',
        host: 'appium:directConnectHost',
        port: 'appium:directConnectPort',
        path: 'appium:directConnectPath'
      }.freeze

      # @return [string] Returns a protocol such as http/https
      attr_reader :protocol

      # @return [string] Returns a host name such as io.appium
      attr_reader :host

      # @return [integer] Returns a port number such as 443
      attr_reader :port

      # @return [string] Returns a path for webdriver such as <code>/hub/wd</code>
      attr_reader :path

      def initialize(capabilities)
        @protocol = capabilities[W3C_KEYS[:protocol]] || capabilities[KEYS[:protocol]]
        @host = capabilities[W3C_KEYS[:host]] || capabilities[KEYS[:host]]
        @port = capabilities[W3C_KEYS[:port]] || capabilities[KEYS[:port]]
        @path = capabilities[W3C_KEYS[:path]] || capabilities[KEYS[:path]]
      end
    end

    class Driver
      include Waitable

      # Selenium webdriver capabilities, but the value is provided capabilities basis.
      # @return [Core::Base::Capabilities]
      attr_reader :caps

      # Return http client called in start_driver()
      # @return [Appium::Core::Base::Http::Default] the http client
      attr_reader :http_client

      # Return if adding 'x-idempotency-key' header is enabled for each new session request.
      # Following commands should not have the key.
      # The key is unique for each http client instance. Defaults to <code>true</code>
      # https://github.com/appium/appium-base-driver/pull/400
      # @return [Bool]
      attr_reader :enable_idempotency_header

      # Device type to request from the appium server
      # @return [Symbol] :android and :ios, for example
      attr_reader :device

      # Automation name sent to appium server or received by server.<br>
      # If automation_name is <code>nil</code>, it is not set both client side and server side.
      # @return [Symbol]
      attr_reader :automation_name

      # Custom URL for the selenium server. If set this attribute, ruby_lib_core try to handshake to the custom url.<br>
      # Defaults to false. Then try to connect to <code>http://127.0.0.1:#{port}/wd/hub</code>.
      # @return [String]
      attr_reader :custom_url

      # Default wait time for elements to appear in Appium server side.
      # Provide <code>{ appium_lib: { wait: 30 } }</code> to {::Appium::Core.for}
      # @return [Integer]
      attr_reader :default_wait

      # Appium's server port. 4723 is by default. Defaults to {::Appium::Core::Driver::DEFAULT_APPIUM_PORT}.<br>
      # Provide <code>{ appium_lib: { port: 8080 } }</code> to {::Appium::Core.for}.
      # <code>:custom_url</code> is prior than <code>:port</code> if <code>:custom_url</code> is set.
      # @return [Integer]
      attr_reader :port
      DEFAULT_APPIUM_PORT = 4723

      # Return a time wait timeout. 30 seconds is by default {::Appium::Core::Wait::DEFAULT_TIMEOUT}.<br>
      # Wait time for {::Appium::Core::Base::Wait}, wait and wait_true.<br>
      # Provide <code>{ appium_lib: { wait_timeout: 20 } }</code> to {::Appium::Core.for}.
      # @return [Integer]
      attr_reader :wait_timeout

      # Return a time to wait interval. 0.5 seconds is by default {::Appium::Core::Wait::DEFAULT_INTERVAL}.<br>
      # Wait interval time for {::Appium::Core::Base::Wait}, wait and wait_true.<br>
      # Provide <code>{ appium_lib: { wait_interval: 0.1 } }</code> to {::Appium::Core.for}.
      # @return [Integer]
      attr_reader :wait_interval

      # instance of AbstractEventListener for logging support
      # Nil by default
      attr_reader :listener

      # @return [Appium::Core::Base::Driver]
      attr_reader :driver

      # <b>[Experimental feature]</b><br>
      # Enable an experimental feature updating Http client endpoint following below keys by Appium/Selenium server.<br>
      # This works with {Appium::Core::Base::Http::Default}.
      #
      # If your Selenium/Appium server decorates the new session capabilities response with the following keys:<br>
      # - <code>directConnectProtocol</code>
      # - <code>directConnectHost</code>
      # - <code>directConnectPort</code>
      # - <code>directConnectPath</code>
      #
      # ignore them if this parameter is <code>false</code>. Defaults to true.
      # These keys can have <code>appium:</code> prefix.
      #
      # @return [Bool]
      attr_reader :direct_connect

      # Creates a new driver and extend particular methods
      # @param [Hash] opts A options include capabilities for the Appium Server and for the client.
      # @option opts [Hash] :caps Appium capabilities.
      # @option opts [Hash] :capabilities The same as :caps.
      #                                   This param is for compatibility with Selenium WebDriver format
      # @option opts [Appium::Core::Options] :appium_lib Capabilities affect only ruby client
      # @option opts [String] :url The same as :custom_url in :appium_lib.
      #                            This param is for compatibility with Selenium WebDriver format
      #
      # @return [Driver]
      #
      # @example
      #
      #     # format 1
      #     @core = Appium::Core.for caps: {...}, appium_lib: {...}
      #     # format 2. 'capabilities:' is also available instead of 'caps:'.
      #     @core = Appium::Core.for url: "http://127.0.0.1:8080/wd/hub", capabilities: {...}, appium_lib: {...}
      #
      #
      #     require 'rubygems'
      #     require 'appium_lib_core'
      #
      #     # Start iOS driver
      #     opts = {
      #              caps: {
      #                platformName: :ios,
      #                platformVersion: '11.0',
      #                deviceName: 'iPhone Simulator',
      #                automationName: 'XCUITest',
      #                app: '/path/to/MyiOS.app'
      #              },
      #              appium_lib: {
      #                port: 8080,
      #                wait: 0,
      #                wait_timeout: 20,
      #                wait_interval: 0.3,
      #                listener: nil,
      #              }
      #            }
      #     @core = Appium::Core.for(opts) # create a core driver with 'opts' and extend methods into 'self'
      #     @core.start_driver # Connect to 'http://127.0.0.1:8080/wd/hub' because of 'port: 8080'
      #
      #     # Start iOS driver with .zip file over HTTP
      #     # 'capabilities:' is also available instead of 'caps:'. Either is fine.
      #     opts = {
      #              capabilities: {
      #                platformName: :ios,
      #                platformVersion: '11.0',
      #                deviceName: 'iPhone Simulator',
      #                automationName: 'XCUITest',
      #                app: 'http://example.com/path/to/MyiOS.app.zip'
      #              },
      #              appium_lib: {
      #                server_url: 'http://custom-host:8080/wd/hub.com',
      #                wait: 0,
      #                wait_timeout: 20,
      #                wait_interval: 0.3,
      #                listener: nil,
      #              }
      #            }
      #     @core = Appium::Core.for(opts)
      #     @core.start_driver # Connect to 'http://custom-host:8080/wd/hub.com'
      #
      #     # Start iOS driver as another format. 'url' is available like below
      #     opts = {
      #              url: "http://custom-host:8080/wd/hub.com",
      #              capabilities: {
      #                platformName: :ios,
      #                platformVersion: '11.0',
      #                deviceName: 'iPhone Simulator',
      #                automationName: 'XCUITest',
      #                app: '/path/to/MyiOS.app'
      #              },
      #              appium_lib: {
      #                wait: 0,
      #                wait_timeout: 20,
      #                wait_interval: 0.3,
      #                listener: nil,
      #              }
      #            }
      #     @core = Appium::Core.for(opts) # create a core driver with 'opts' and extend methods into 'self'
      #     @core.start_driver # start driver with 'url'. Connect to 'http://custom-host:8080/wd/hub.com'
      #
      #     # With a custom listener
      #     class CustomListener < ::Selenium::WebDriver::Support::AbstractEventListener
      #       // something
      #     end
      #     capabilities: {
      #       platformName: :ios,
      #       platformVersion: '11.0',
      #       deviceName: 'iPhone Simulator',
      #       automationName: 'XCUITest',
      #       app: '/path/to/MyiOS.app'
      #     },
      #     appium_lib: {
      #       listener: CustomListener.new,
      #     }
      #     @core = Appium::Core.for capabilities: capabilities, appium_lib: appium_lib
      #     @core.start_driver
      #
      def self.for(opts = {})
        new.setup_for_new_session(opts)
      end

      # Attach to an existing session. The main usage of this method is to attach to
      # an existing session for debugging. The generated driver instance has the capabilities which
      # has the given automationName and platformName only since the W3C WebDriver spec does not provide
      # an endpoint to get running session's capabilities.
      #
      #
      # @param [String] The session id to attach to.
      # @param [String] url The WebDriver URL to attach to with the session_id.
      # @param [String] automation_name The platform name to keep in the dummy capabilities
      # @param [String] platform_name The automation name to keep in the dummy capabilities
      # @return [Selenium::WebDriver] A new driver instance with the given session id.
      #
      # @example
      #
      #   new_driver = ::Appium::Core::Driver.attach_to(
      #     driver.session_id,  # The 'driver' has an existing session id
      #     url: 'http://127.0.0.1:4723/wd/hub', automation_name: 'UiAutomator2', platform_name: 'Android'
      #   )
      #   new_driver.page_source # for example
      #
      def self.attach_to(
        session_id, url: nil, automation_name: nil, platform_name: nil,
        http_client_ops: { http_client: nil, open_timeout: 999_999, read_timeout: 999_999 }
      )
        new.attach_to(
          session_id,
          automation_name: automation_name,
          platform_name: platform_name,
          url: url,
          http_client_ops: http_client_ops
        )
      end

      private

      # @private
      # For testing purpose of delegate_from_appium_driver
      def delegated_target_for_test
        @delegate_target
      end

      # @private
      def initialize
        @delegate_target = self # for testing purpose
        @automation_name = nil # initialise before 'set_automation_name'
      end

      public

      # @private
      # Set up for a new session
      def setup_for_new_session(opts = {})
        @custom_url = opts.delete :url # to set the custom url as :url

        @caps = get_caps(opts)

        set_appium_lib_specific_values(get_appium_lib_opts(opts))
        set_app_path
        set_appium_device
        set_automation_name

        extend_for(device: @device, automation_name: @automation_name)
        self
      end

      # Creates a new global driver and quits the old one if it exists.
      # You can customise http_client as the following
      #
      # @param [String] server_url Custom server url to send to requests. Default is "http://127.0.0.1:4723/wd/hub".
      # @param http_client_ops [Hash] Options for http client
      # @option http_client_ops [Hash] :http_client Custom HTTP Client
      # @option http_client_ops [Hash] :open_timeout Custom open timeout for http client.
      # @option http_client_ops [Hash] :read_timeout Custom read timeout for http client.
      # @return [Selenium::WebDriver] A new driver instance
      #
      # @example
      #
      #     require 'rubygems'
      #     require 'appium_lib_core'
      #
      #     # platformName takes a string or a symbol.
      #
      #     # Start iOS driver
      #     opts = {
      #              capabilities: {
      #                platformName: :ios,
      #                platformVersion: '11.0',
      #                deviceName: 'iPhone Simulator',
      #                automationName: 'XCUITest',
      #                app: '/path/to/MyiOS.app'
      #              },
      #              appium_lib: {
      #                wait: 20,
      #                wait_timeout: 20,
      #                wait_interval: 0.3,
      #              }
      #            }
      #
      #     @core = Appium::Core.for(opts) # create a core driver with 'opts' and extend methods into 'self'
      #     @driver = @core.start_driver server_url: "http://127.0.0.1:8000/wd/hub"
      #
      #     # Attach custom HTTP client
      #     @driver = @core.start_driver server_url: "http://127.0.0.1:8000/wd/hub",
      #                                  http_client_ops: { http_client: Your:Http:Client.new,
      #                                                     open_timeout: 1_000,
      #                                                     read_timeout: 1_000 }
      #

      def start_driver(server_url: nil,
                       http_client_ops: { http_client: nil, open_timeout: 999_999, read_timeout: 999_999 })
        @custom_url ||= "http://127.0.0.1:#{@port}/wd/hub"
        @custom_url = server_url unless server_url.nil?

        @http_client = get_http_client http_client: http_client_ops.delete(:http_client),
                                       open_timeout: http_client_ops.delete(:open_timeout),
                                       read_timeout: http_client_ops.delete(:read_timeout)

        if @enable_idempotency_header
          if @http_client.instance_variable_defined? :@additional_headers
            @http_client.set_additional_header Appium::Core::Base::Http::RequestHeaders::KEYS[:idempotency], SecureRandom.uuid
          else
            ::Appium::Logger.warn 'No additional_headers attribute in this http client instance'
          end
        end

        begin
          @driver = ::Appium::Core::Base::Driver.new(listener: @listener,
                                                     http_client: @http_client,
                                                     capabilities: @caps, # ::Appium::Core::Base::Capabilities
                                                     url: @custom_url,
                                                     wait_timeout: @wait_timeout,
                                                     wait_interval: @wait_interval)

          if @direct_connect
            d_c = DirectConnections.new(@driver.capabilities)
            @driver.update_sending_request_to(protocol: d_c.protocol, host: d_c.host, port: d_c.port, path: d_c.path)
          end
        rescue Errno::ECONNREFUSED
          raise "ERROR: Unable to connect to Appium. Is the server running on #{@custom_url}?"
        end

        if @http_client.instance_variable_defined? :@additional_headers
          # We only need the key for a new session request. Should remove it for other following commands.
          @http_client.delete_additional_header Appium::Core::Base::Http::RequestHeaders::KEYS[:idempotency]
        end

        set_implicit_wait_by_default(@default_wait)

        @driver
      end

      # @private
      # Attach to an existing session
      def attach_to(session_id, url: nil, automation_name: nil, platform_name: nil,
                    http_client_ops: { http_client: nil, open_timeout: 999_999, read_timeout: 999_999 })
        raise ::Appium::Core::Error::ArgumentError, 'The :url must not be nil' if url.nil?
        raise ::Appium::Core::Error::ArgumentError, 'The :automation_name must not be nil' if automation_name.nil?
        raise ::Appium::Core::Error::ArgumentError, 'The :platform_name must not be nil' if platform_name.nil?

        @custom_url = url

        # use lowercase internally
        @automation_name = convert_downcase(automation_name)
        @device = convert_downcase(platform_name)

        extend_for(device: @device, automation_name: @automation_name)

        @http_client = get_http_client http_client: http_client_ops.delete(:http_client),
                                       open_timeout: http_client_ops.delete(:open_timeout),
                                       read_timeout: http_client_ops.delete(:read_timeout)

        # Note that 'enable_idempotency_header' works only a new session reqeust. The attach_to method skips
        # the new session request, this it does not needed.

        begin
          # included https://github.com/SeleniumHQ/selenium/blob/43f8b3f66e7e01124eff6a5805269ee441f65707/rb/lib/selenium/webdriver/remote/driver.rb#L29
          @driver = ::Appium::Core::Base::Driver.new(http_client: @http_client,
                                                     url: @custom_url,
                                                     listener: @listener,
                                                     existing_session_id: session_id,
                                                     automation_name: automation_name,
                                                     platform_name: platform_name)
        rescue Errno::ECONNREFUSED
          raise ::Appium::Core::Error::SessionNotCreatedError,
                "ERROR: Unable to connect to Appium. Is the server running on #{@custom_url}?"
        end

        @driver
      end

      def get_http_client(http_client: nil, open_timeout: nil, read_timeout: nil)
        http_client || Appium::Core::Base::Http::Default.new(open_timeout: open_timeout, read_timeout: read_timeout)
      end

      # Ignore setting default wait if the target driver has no implementation
      def set_implicit_wait_by_default(wait)
        return if @default_wait.nil?

        @driver.manage.timeouts.implicit_wait = wait
      rescue ::Selenium::WebDriver::Error::UnknownError => e
        unless e.message.include?('The operation requested is not yet implemented')
          raise ::Appium::Core::Error::ServerError, e.message
        end

        ::Appium::Logger.debug(e.message)
        {}
      end

      # Returns the server's version info. This method calls +driver.remote_status+ internally
      #
      # @return [Hash]
      #
      # @example
      #
      #   @core.appium_server_version
      #     {
      #         "build" => {
      #             "version" => "1.9.2",
      #             "git-sha" => "fd7c7fd19d3896719616cd970229d73e63b5271a",
      #             "built" => "2018-11-08 12:24:02 +0900"
      #         }
      #     }
      #
      # Returns blank hash in a case +driver.remote_status+ got an error
      # such as Selenium Grid. It returns 500 error against 'remote_status'.
      #
      # @example
      #
      #   @core.appium_server_version #=> {}
      #
      def appium_server_version
        return {} if @driver.nil?

        @driver.remote_status
      rescue StandardError
        # Ignore error case in a case the target appium server
        # does not support `/status` API.
        {}
      end

      private

      def convert_to_symbol(value)
        if value.nil?
          value
        else
          value.to_sym
        end
      end

      # @private
      def extend_for(device:, automation_name:) # rubocop:disable Metrics/CyclomaticComplexity
        extend Appium::Core
        extend Appium::Core::Device

        sym_automation_name = convert_to_symbol(automation_name)

        case convert_to_symbol(device)
        when :android
          case sym_automation_name
          when :espresso
            ::Appium::Core::Android::Espresso::Bridge.for self
          when :uiautomator2
            ::Appium::Core::Android::Uiautomator2::Bridge.for self
          when :gecko
            ::Appium::Logger.debug('Gecko Driver for Android')
          else # default and UiAutomator
            ::Appium::Core::Android::Uiautomator1::Bridge.for self
          end
        when :ios, :tvos
          case sym_automation_name
          when :safari
            ::Appium::Logger.debug('SafariDriver for iOS')
          else # XCUITest
            ::Appium::Core::Ios::Xcuitest::Bridge.for self
          end
        when :mac
          case sym_automation_name
          when :safari
            ::Appium::Logger.debug('SafariDriver for macOS')
          when :gecko
            ::Appium::Logger.debug('Gecko Driver for macOS')
          when :mac2
            ::Appium::Core::Mac2::Bridge.for self
          else
            # no Mac specific extentions
            ::Appium::Logger.debug('macOS Native')
          end
        when :windows
          case sym_automation_name
          when :gecko
            ::Appium::Logger.debug('Gecko Driver for Windows')
          else
            ::Appium::Core::Windows::Bridge.for self
          end
        when :tizen
          # https://github.com/Samsung/appium-tizen-driver
          ::Appium::Logger.debug('tizen')
        else
          case sym_automation_name
          when :youiengine
            # https://github.com/YOU-i-Labs/appium-youiengine-driver
            ::Appium::Logger.debug('YouiEngine')
          when :mac
            # In this case also can be mac
            ::Appium::Logger.debug('mac')
          when :gecko # other general platform
            ::Appium::Logger.debug('Gecko Driver')
          else
            ::Appium::Logger.warn("No matched driver by platformName: #{device} and automationName: #{automation_name}")
          end
        end

        self
      end

      # @private
      def get_caps(opts)
        Core::Base::Capabilities.new(opts[:caps] || opts[:capabilities] || {})
      end

      # @private
      def get_appium_lib_opts(opts)
        opts[:appium_lib] || {}
      end

      # @private
      def get_app
        get_cap 'app'
      end

      # @private
      # Path to the .apk, .app or .app.zip.
      # The path can be local, HTTP/S, Windows Share and other path like 'sauce-storage:'.
      # Use @caps[:app] without modifications if the path isn't HTTP/S or local path.
      def set_app_path
        # FIXME: maybe `:app` should check `app` as well.
        return unless @caps && get_app && !get_app.empty?

        uri_regex = defined?(URI::RFC2396_PARSER) ? URI::RFC2396_PARSER : URI::DEFAULT_PARSER
        return if get_app =~ uri_regex.make_regexp

        app_path = File.expand_path(get_app)
        @caps['app'] = if File.exist? app_path
                         app_path
                       else
                         ::Appium::Logger.warn("Use #{get_app} directly since #{app_path} does not exist.")
                         get_app
                       end
      end

      # @private
      # Below capabilities are set only for client side.
      def set_appium_lib_specific_values(appium_lib_opts)
        opts = Options.new appium_lib_opts

        @custom_url ||= opts.custom_url # Keep existence capability if it's already provided
        @enable_idempotency_header = opts.enable_idempotency_header

        @default_wait = opts.default_wait

        @port = opts.port

        @wait_timeout  = opts.wait_timeout
        @wait_interval = opts.wait_interval

        @listener = opts.listener

        @direct_connect = opts.direct_connect
      end

      # @private
      def set_appium_device
        # https://code.google.com/p/selenium/source/browse/spec-draft.md?repo=mobile
        @device = get_cap 'platformName'
        return @device unless @device

        @device = convert_to_symbol(convert_downcase(@device))
      end

      # @private
      def set_automation_name
        candidate = get_cap 'automationName'
        @automation_name = candidate if candidate
        @automation_name = convert_to_symbol(convert_downcase(@automation_name)) if @automation_name
      end

      # @private
      def convert_downcase(value)
        value.is_a?(Symbol) ? value.downcase : value.downcase.strip.intern
      end

      def get_cap(name)
        name_with_prefix = "#{::Appium::Core::Base::Bridge::APPIUM_PREFIX}#{name}"
        @caps[convert_to_symbol name] ||
          @caps[name] ||
          @caps[convert_to_symbol name_with_prefix] ||
          @caps[name_with_prefix]
      end
    end # class Driver
  end # module Core
end # module Appium
