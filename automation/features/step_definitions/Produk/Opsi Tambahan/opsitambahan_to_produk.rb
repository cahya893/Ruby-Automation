When('User melakukan setup opsi tambahan ke produk') do
    sleep 1
    @pusathalaman.dashboard.more_opsitambahan.click
    sleep 2
    @pusathalaman.dashboard.set_to_produk.click
    sleep 3
    @pusathalaman.dashboard.checkbox_opsitambahan1.click
    sleep 1
    @pusathalaman.dashboard.simpan_set_opsitambahan.click
    sleep 2
  end
  
  Then('Opsi tambahan berhasil di tambahan ke produk') do
    notif_hijau = @pusathalaman.dashboard.notif_hijau.text
    expect(notif_hijau).to include('Opsi Tambahan berhasil diupdate ke produk')
  end