Given('User berada di halaman login Pawoon') do
  visit '/login'
  sleep 3
  expect(@pusathalaman.loginpage.has_txt_selamat_datang_kembali?).to be true
  if @pusathalaman.dashboard.has_php_debug_close?
    @pusathalaman.dashboard.php_debug_close.click
  end
end

When('User login with valid credentials') do
  @inputemail = "cahya.pawoon1@gmail.com"
  @inputpassword = "123456"
  @pusathalaman.loginpage.input_email.click
  @pusathalaman.loginpage.input_email.set @inputemail
  @pusathalaman.loginpage.input_password.click
  @pusathalaman.loginpage.input_password.set @inputpassword
  @pusathalaman.loginpage.btn_login.click
  sleep 3
end

Then('User verify login success') do
  if @pusathalaman.dashboard.has_close_pop_up?
    @pusathalaman.dashboard.close_pop_up.click
    sleep 1 until !@pusathalaman.dashboard.has_close_pop_up?
  end

  @pusathalaman.dashboard.button_profile.click
  @pusathalaman.dashboard.menu_profile.click
  sleep 2
  email_akun_text = @pusathalaman.dashboard.email_akun_text.text
  expect(email_akun_text).to eq(@inputemail)
end