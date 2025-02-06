When('User melakukan daftar akun pawoon') do
  @pusathalaman.loginpage.daftar_akun.click
end  

When('User Mengisi data akun') do
  @nama = "Cahya Automation"
  base_name = "cahya.pawoon+automation"
  @email_baru = "#{base_name}@gmail.com"
  counter = 1
  @no_hp = "08123456789"  
  @password_baru = '123456'
  @pusathalaman.loginpage.field_nama.click
  @pusathalaman.loginpage.field_nama.set @nama
  sleep 1
  @pusathalaman.loginpage.field_email.click
  @pusathalaman.loginpage.field_email.set @email_baru
  sleep 1
  @pusathalaman.loginpage.field_no_hp.click
  @pusathalaman.loginpage.field_no_hp.set @no_hp
  sleep 1
  @pusathalaman.loginpage.field_password.click
  @pusathalaman.loginpage.field_password.set @password_baru
  sleep 1
  @pusathalaman.loginpage.setuju_Tnc.click
  @pusathalaman.loginpage.lanjutkan_register.click
  loop do
    if page.has_content?('Email sudah digunakan')
      counter += 1
      @email_baru = "#{base_name}#{counter}@gmail.com"
      @pusathalaman.loginpage.field_email.set @email_baru
      @pusathalaman.loginpage.lanjutkan_register.click
      sleep 2
    else
      break
    end
  end
end

When('User Mengisi data bisnis') do
    @nama_bisnis = "Cahya Automation Bisnis 9"
    @kota_bisnis = "Jakarta"
    @pusathalaman.loginpage.nama_bisnis.click
    @pusathalaman.loginpage.nama_bisnis.set @nama_bisnis
    sleep 1
    @pusathalaman.loginpage.lihat_jenis_bisnis.click
    sleep 1
    @pusathalaman.loginpage.drop_jenis_bisnis.click
    sleep 1
    @pusathalaman.loginpage.pilih_jenis_bisnis.click
    sleep 1
    @pusathalaman.loginpage.kota_bisnis.click
    sleep 1
    @pusathalaman.loginpage.kota_bisnis.set @kota_bisnis
    sleep 1
    @pusathalaman.loginpage.pilih_kota_bisnis.click
    sleep 1
    @pusathalaman.loginpage.lanjutkan_daftar_bisnis.click
    sleep 1
end

When('User Melakukan daftar akun pawoon') do
    @pusathalaman.loginpage.verif_daftar.click
    sleep 3
end

When('User melakukan login akun baru') do
  @pusathalaman.loginpage.input_email.click
  @pusathalaman.loginpage.input_email.set @email_baru
  sleep 1
  @pusathalaman.loginpage.input_password.click
  @pusathalaman.loginpage.input_password.set @password_baru
  sleep 1
  @pusathalaman.loginpage.btn_login.click
  sleep 3
end

When('User melakukan login akun baru produk') do
    @pusathalaman.loginpage.lanjutkan_produk.click
    sleep 1
end

When('User melakukan login akun baru ok') do
    @nama_prd_baru = "Ayam Goreng"
    @kategori_prd_baru = "Makanan"
    @harga_prd_baru = "10000"
    @pusathalaman.loginpage.produk_akun_baru.click
    @pusathalaman.loginpage.produk_akun_baru.set @nama_prd_baru
    sleep 1
    @pusathalaman.loginpage.kategori_akun_baru.click
    @pusathalaman.loginpage.kategori_akun_baru.set @kategori_prd_baru
    sleep 1
    @pusathalaman.loginpage.harga_produk_baru.click
    @pusathalaman.loginpage.harga_produk_baru.set @harga_prd_baru
    sleep 1
    @pusathalaman.loginpage.btn_tambah_produk_baru.click
    sleep 1
end

When('User melakukan login akun baru konfirmasi') do
    @pusathalaman.loginpage.btn_masuk_dashboard.click
    sleep 3
end

Then('User verify login akun baru Sukses') do
    verisikasi_email_akun_baru = @pusathalaman.dashboard.verisikasi_email_akun_baru.text
    expect(verisikasi_email_akun_baru).to eq(@email_baru)
puts 'DATA AKUN BARU SUDAH SESUAI'
end