When('User kelola bahan baku opsi tambahan') do
    @pusathalaman.dashboard.more_opsitambahan.click
    sleep 1
    @pusathalaman.dashboard.kelola_bahan_opsitambahan.click
    sleep 2
    @pusathalaman.dashboard.dropdown_bahan_opsi.click
    sleep 2
    @pusathalaman.dashboard.field_bahan_opsi.set 'A'
    sleep 2
    @pusathalaman.dashboard.field_bahan_opsi.send_keys(:enter)
    sleep 1
    @pusathalaman.dashboard.jmlh_bahan_opsi.set '1'
    @pusathalaman.dashboard.simpan_bahan_opsi.click
    sleep 2
  end

Then('bahan baku berhasil di tambahkan') do
    notif_hijau = @pusathalaman.dashboard.notif_hijau.text
    expect(notif_hijau).to include("Bahan Baku berhasil disimpan")
  end
  