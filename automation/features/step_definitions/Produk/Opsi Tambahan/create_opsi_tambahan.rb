When('User masuk ke menu opsi tambahan') do
   sleep 3
   @pusathalaman.dashboard.btn_create_opsitambahan.click
   sleep 2
end

When('User membuat opsi tambahan') do
  base_name = 'Toping Automation'
  @nama_grup_opsitambahan = base_name
  counter = 1
  @nama_opsitambahan1 = 'Saus'
  @harga_opsitambahan1 = '2000'
  @nama_opsitambahan2 = 'Keju'
  @harga_opsitambahan2 = '3000'

  @pusathalaman.dashboard.btn_tambah_opsitambahan.click
  sleep 1
  @pusathalaman.dashboard.nama_grup_opsitambahan.set @nama_grup_opsitambahan
  @pusathalaman.dashboard.nama_opsitambahan1.set @nama_opsitambahan1
  @pusathalaman.dashboard.harga_opsitambahan1.set @harga_opsitambahan1
  @pusathalaman.dashboard.tambah_opsitambahan_lain.click
  sleep 1
  @pusathalaman.dashboard.delete_opsitambahan.click
  @pusathalaman.dashboard.togle_opsitambahan_bahanbaku.click
  sleep 1
  @pusathalaman.dashboard.simpan_opsitambahan.click
  sleep 1

  loop do
    if page.has_content?('Nama Group Modifier sudah ada')
      counter += 1
      @nama_grup_opsitambahan = "#{base_name} #{counter}"
      @pusathalaman.dashboard.nama_grup_opsitambahan.set @nama_grup_opsitambahan
      @pusathalaman.dashboard.simpan_opsitambahan.click
      else
      break
    end
  end
  sleep 3
 end

Then('Opsi tambahan berhasil terbuat') do 
  notif_opsitambahan_terbuat = @pusathalaman.dashboard.notif_opsitambahan_terbuat.text
  expect(notif_opsitambahan_terbuat).to include("Opsi Tambahan berhasil ditambah")
end