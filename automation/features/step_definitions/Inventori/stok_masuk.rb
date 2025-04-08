When('User masuk ke menu stok masuk') do
    @pusathalaman.dashboard.dropdown_inventori.click
    sleep 1
    @pusathalaman.dashboard.menu_stok_masuk.click
    sleep 3
  end
  
  When('User membuat stok masuk') do
    @pusathalaman.dashboard.tambah_stok_masuk.click
    sleep 2
    @pusathalaman.dashboard.dropdown_outlet_stok_masuk.click
    sleep 1
    @pusathalaman.dashboard.pilih_outlet_stok_masuk.click
    sleep 1
    @pusathalaman.dashboard.tanggal_stok_masuk.click
    sleep 1
    @pusathalaman.dashboard.tanggal_stok_masuk.set(Time.now.strftime('%d-%m-%Y'))
    sleep 1
    @pusathalaman.dashboard.send_keys(:enter)
    @pusathalaman.dashboard.dropdown_produk_stok_masuk.click
    sleep 1
    @pusathalaman.dashboard.field_produk_stok_masuk.set('Produk Automation')
    sleep 1
    @pusathalaman.dashboard.send_keys(:enter)
    sleep 1
    @pusathalaman.dashboard.jumlah_stok_masuk.set('10')
    sleep 1
    @pusathalaman.dashboard.total_harga_beli.set('50000')
    sleep 1
    @pusathalaman.dashboard.simpan_stok_masuk.click
    sleep 3
  end
  
  Then('stok berhasil terbuat') do
    expect(@pusathalaman.dashboard.text_stok_masuk.visible?).to be true
  end