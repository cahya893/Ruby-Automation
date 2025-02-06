When('User melakukan expor data produk') do
  sleep 3
  @pusathalaman.dashboard.btn_expor_produk.click
  sleep 1
  @pusathalaman.dashboard.dropdown_pilih_outlet_expor_produk.click
  sleep 1
  @pusathalaman.dashboard.pilih_outlet_expor_produk.click
  sleep 1
  @pusathalaman.dashboard.btn_simpan_expor_produk.click
  sleep 10
end

Then('Produk berhasil terexpor') do
  @pusathalaman.dashboard.lonceng.click
  sleep 2

  text_berhasil_expor = @pusathalaman.dashboard.text_berhasil_expor.text
  expect(text_berhasil_expor).to include("Data siap diunduh")

  @pusathalaman.dashboard.lihat_notif.click
  sleep 2
end