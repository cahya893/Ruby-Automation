When('User masuk ke menu transfer Stok') do
    @pusathalaman.dashboard.dropdown_inventori.click
    sleep 1
    @pusathalaman.dashboard.menu_transfer_stok.click
  end
  
  When('User membuat transfer stok') do
    @pusathalaman.dashboard.btn_tambah_transfer_stok.click
    sleep 2
    @pusathalaman.dashboard.dropdown_outlet_asal.click
    sleep 1
    @pusathalaman.dashboard.pilih_outlet_asal.click
    sleep 1
    @pusathalaman.dashboard.dropdown_outlet_tujuan.click
    sleep 1
    @pusathalaman.dashboard.pilih_outlet_tujuan.click
    sleep 1
    @pusathalaman.dashboard.tanggal_transfer_stok.click
    sleep 1
    @pusathalaman.dashboard.tanggal_transfer_stok.set(Time.now.strftime('%d-%m-%Y'))
    @pusathalaman.dashboard.send_keys(:enter)
    sleep 1
    @pusathalaman.dashboard.dropdown_produk_transfer_stok.click
    sleep 1
    @pusathalaman.dashboard.field_produk_transfer_stok.set('Produk Automation')
    sleep 1
    @pusathalaman.dashboard.send_keys(:enter)
    sleep 1
    @pusathalaman.dashboard.jumlah_transfer_stok.set('1') 
    sleep 1
    @pusathalaman.dashboard.btn_simpan_transfer_stok.click
    sleep 3
  end
  
  Then('transfer stok berhasil terbuat') do
    expect(@pusathalaman.dashboard.text_trasfer_stok.visible?).to be true
  end