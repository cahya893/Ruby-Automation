When('User Ubah Kategori') do
    @pusathalaman.dashboard.more_kategori.click
    sleep 1
    @pusathalaman.dashboard.edit_kategori.click
    sleep 1 
    @nama_ketegori = 'Automation Kategori Diubah'
    @pusathalaman.dashboard.input_nama_kategori.set @nama_ketegori
    @pusathalaman.dashboard.simpan_kategori.click
    sleep 2
    end
  
  Then('Kategori berhasil DiUbah') do
    notif_kategori_terbuat = @pusathalaman.dashboard.notif_kategori_terbuat.text
    expect(notif_kategori_terbuat).to include("Kategori produk berhasil diubah")
  end