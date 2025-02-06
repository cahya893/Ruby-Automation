Given('User udah login pawoon') do
  step 'User berada di halaman login Pawoon'
  step 'User login with valid credentials'
end

When('User masuk ke menu produk') do
  @pusathalaman.dashboard.menu_produk.click
end

When('User masuk ke menu tambah produk') do
  @pusathalaman.dashboard.tambah_produk.click
end

When('User melakukan tambah produk') do
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
      sleep 5
      else
      break
    end
  end
end

Then('Produk berhasil terbuat') do
  validasi_produk_terbuat = @pusathalaman.dashboard.validasi_produk_terbuat.text
  expect(validasi_produk_terbuat).to include("berhasil disimpan")
end

