require 'site_prism'
require_relative '../page/halaman_login'

class PawoonPages
  def loginpage
    @loginpage ||= LoginPage.new
  end

  def resetpage
    @resetpage ||= ResetPage.new
  end
  
  def dashboard
    @dashboard ||= DashboardPage.new
  end

  def productpage
    @productpage ||= ProductPage.new
  end
end