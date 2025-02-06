When('User melakukan ubah produk') do
    @pusathalaman.dashboard.more_produk.click
    sleep 1
    @pusathalaman.dashboard.ubah_produk.click
    sleep 3

    base_name = 'Produk Automation'
    @nama_produk = base_name
    counter = 1
  
    @pusathalaman.dashboard.field_nama_produk.set @nama_produk
    @pusathalaman.dashboard.button_tambah_produk.click
    sleep 1
    
      loop do
      if page.has_content?('Nama produk sudah ada')
        counter += 1
        @nama_produk = "#{base_name} #{counter}"
        @pusathalaman.dashboard.field_nama_produk.set @nama_produk
        @pusathalaman.dashboard.button_tambah_produk.click
        else
        break
      end
    end
    sleep 5
  end
  
  Then('Produk berhasil di ubah') do
    notif_hijau = @pusathalaman.dashboard.notif_ubah_produk.text
    expect(notif_hijau).to eq('Produk berhasil diubah')
  end