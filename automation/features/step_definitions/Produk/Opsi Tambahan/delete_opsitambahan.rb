When('User Hapus Opsi Tambahan') do
    @pusathalaman.dashboard.more_opsitambahan.click
    sleep 1
    @pusathalaman.dashboard.hapus_opsitambahan.click
    sleep 1
    @pusathalaman.dashboard.delete_opsitambahan.click
    sleep 2
  end
  
  Then('Opsi Tambahan berhasil Dihapus') do
    notif_hijau = @pusathalaman.dashboard.notif_hijau.text
    expect(notif_hijau).to have_content('Opsi Tambahan berhasil dihapus')
    end