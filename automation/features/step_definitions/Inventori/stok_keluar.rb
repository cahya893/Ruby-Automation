When('User masuk ke menu stok keluar') do
    @pusathalaman.dashboard.dropdown_inventori.click
    sleep 1
    @pusathalaman.dashboard.menu_stok_keluar.click
    sleep 3
  end
  
  When('User membuat stok Keluar') do
    @pusathalaman.dashboard.btn_tambah_stok_keluar.click
    sleep 2
    @pusathalaman.dashboard.dropdown_outlet_stok_keluar.click
    sleep 1
    @pusathalaman.dashboard.pilih_outlet_stok_keluar.click
    sleep 1 
    @pusathalaman.dashboard.tanggal_stok_keluar.click
    sleep 1
    @pusathalaman.dashboard.tanggal_stok_keluar.set(Time.now.strftime('%d-%m-%Y'))
    sleep 1
    @pusathalaman.dashboard.send_keys(:enter)
    @pusathalaman.dashboard.dropdown_produk_stok_keluar.click
    sleep 1
    @pusathalaman.dashboard.field_produk_stok_keluar.set('Produk Automation')
    sleep 1
    @pusathalaman.dashboard.send_keys(:enter)
    sleep 1
    @pusathalaman.dashboard.jumlah_stok_keluar.set('1')
    sleep 1
    @pusathalaman.dashboard.simpan_stok_keluar.click
    sleep 3
  end
  
  Then('stok keluar berhasil terbuat') do
    notif_hijau = @pusathalaman.dashboard.notif_hijau.text
    expect(notif_hijau).to include("Stok keluar berhasil ditambahkan")
  end