When('User Ubah opsi tambahan') do
    sleep 2
    @pusathalaman.dashboard.more_opsitambahan.click
    sleep 1
    @pusathalaman.dashboard.ubah_opsitambahan.click
    sleep 3

    base_name = 'Toping Automation'
    @nama_grup_opsitambahan = base_name
    counter = 1

    @pusathalaman.dashboard.nama_grup_opsitambahan.set @nama_grup_opsitambahan
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
  
  Then('Opsi tambahan berhasil DiUbah') do
    notif_hijau = @pusathalaman.dashboard.notif_hijau.text
    expect(notif_hijau).to include('Opsi Tambahan berhasil diupdate')
  end