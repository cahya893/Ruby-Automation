When('User masuk ke menu Kategori') do
   @pusathalaman.dashboard.menu_kategori.click
   sleep 2
  end
  
  When('User membuat Kategori') do
    @pusathalaman.dashboard.btn_tambah_kategori.click
    sleep 1
    base_name = 'Automation Kategori'
    @nama_ketegori = base_name
    counter = 1
  
      @pusathalaman.dashboard.input_nama_kategori.set @nama_ketegori
      @pusathalaman.dashboard.simpan_kategori.click
      loop do
      if page.has_content?('Nama kategori sudah ada')
        counter += 1
        @nama_ketegori = "#{base_name} #{counter}"
        @pusathalaman.dashboard.input_nama_kategori.set @nama_ketegori
        @pusathalaman.dashboard.simpan_kategori.click
        sleep 2
      else
        break
      end
    end
  end
  
  Then('Kategori berhasil terbuat') do
    notif_kategori_terbuat = @pusathalaman.dashboard.notif_kategori_terbuat.text
    expect(notif_kategori_terbuat).to include("Kategori produk berhasil ditambahkan")
  end