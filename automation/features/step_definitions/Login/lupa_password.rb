When('User Masuk ke halaman lupa Password') do
    @pusathalaman.loginpage.lupa_password.click
    sleep 1
end

When('User Input email akun Pawoon') do
    @email_lupa_password = "cahya.pawoon1@gmail.com"
    @pusathalaman.loginpage.email_lupa_password.set @email_lupa_password
    @pusathalaman.loginpage.btn_reset_password.click
    sleep 3
end

Then('Berhasil Request Email Lupa Password') do
    txt_berhasil_lupa_password = @pusathalaman.loginpage.txt_berhasil_lupa_password.text
  expect(txt_berhasil_lupa_password).to eq(txt_berhasil_lupa_password)
end