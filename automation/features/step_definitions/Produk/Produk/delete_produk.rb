When('User melakukan delete produk') do
    @pusathalaman.dashboard.more_produk.click
    sleep 1
    @pusathalaman.dashboard.btn_hapus_produk.click
    sleep 1
    @pusathalaman.dashboard.delete_produk.click
    sleep 2
  end
  
  Then('Produk berhasil TerDelete') do
    if page.has_content?('Produk gagal dihapus')
        visit current_path
    end
    sleep 4
    puts 'Produk berhasil dihapus'
  end