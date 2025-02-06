require 'site_prism'

class LoginPage < SitePrism::Page
  #Login
  element :input_email, 'input[type="text"].form-control.email-type[name="email"][autocomplete="off"]'
  element :input_password, 'input[type="password"].form-control[name="password"][autocomplete="off"]'
  element :btn_login, 'button[type="submit"].btn.btn-custom.large.btn-block.fill-blue#do-login'
  element :txt_selamat_datang_kembali, 'div.heading.text-center h4', text: "Selamat Datang Kembali"

  # Register
  element :daftar_akun, 'body > div.col-sm-5.col-lg-4.form-side.white.animated.fadeInDown > div.info-regist > b > a'
  element :field_nama, '#reg-fullname'
  element :field_email, '#reg-email'
  element :field_no_hp, '#reg-phone'
  element :field_password, '#reg-password'
  element :setuju_Tnc, '#info-account > div.form-group.clearfix > div > div > div.col-xs-1.col-lg-1 > input'
  element :lanjutkan_register, '#do-regist-step1'
  element :nama_bisnis, '#reg-business-name'
  element :lihat_jenis_bisnis, '#reg-business-type'
  element :drop_jenis_bisnis, '#info-business > div.form-group.fl-tree-selection > ul > li:nth-child(1) > span'
  element :pilih_jenis_bisnis, '#info-business > div.form-group.fl-tree-selection > ul > li:nth-child(1) > ul > li:nth-child(1)'
  element :kota_bisnis, '#reg-business-city'
  element :pilih_kota_bisnis, '#info-business > div.form-group.fl-type-search > ul > li:nth-child(1) > span'
  element :lanjutkan_daftar_bisnis, '#do-regist-step2'
  element :verif_daftar, '#information > div:nth-child(2) > button'
  element :duplikat_email, 'body > div.top-left.notify.do-show'

  #Setelha Register 
  element :lanjutkan_produk, 'body > div.container > div > div > div.se-button'
  element :produk_akun_baru, '#name'
  element :kategori_akun_baru, '#kategori'
  element :harga_produk_baru, '#price'
  element :btn_tambah_produk_baru, 'body > div.container > div > div > div.se-button > a'
  element :btn_masuk_dashboard, 'body > div.container > div.col-md-12.col-xs-12.no-padding > div > div.col-md-12.col-xs-12.no-padding.se-button > a.action-done'


  #Lupa Password 
  element :lupa_password, '#loginForm > div.form-group.clearfix > div.oth-action.right > a'
  element :email_lupa_password, 'body > div:nth-child(2) > div > div.col-md-12 > div > form > div:nth-child(1) > input.form-control'
  element :btn_reset_password, '#submit'
  element :txt_berhasil_lupa_password, 'body > div.container > div.row > div > p:nth-child(2)'
end