When('User Hapus Kategori') do
    @pusathalaman.dashboard.more_kategori.click
    sleep 1
    @pusathalaman.dashboard.delete_kategori.click
    sleep 1
    @pusathalaman.dashboard.btn_hapus_kategori.click
    sleep 1
  end
  
  Then('Kategori berhasil Dihapus') do
    notif_kategori_terhapus = @pusathalaman.dashboard.notif_kategori_terhapus.text
    expect(notif_kategori_terhapus).to include('Kategori produk berhasil dihapus')
  end