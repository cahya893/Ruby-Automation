Given('User sudah login pawoon untuk impor produk') do
    step 'User berada di halaman login Pawoon'
    step 'User login with valid credentials'
end
  
  When('User masuk ke menu produk untul impor produk') do
    step 'User masuk ke menu produk'
end

When('User masuk ke menu impor produk') do
  @pusathalaman.dashboard.impor_produk.click
  sleep 1
end
  
When('User input detail impor produk') do
  @pusathalaman.dashboard.dropdown_outlet.click
  sleep 1
  @pusathalaman.dashboard.pilih_outlet.click
  sleep 1
  @pusathalaman.dashboard.dropdown_outlet.click
  sleep 1
  @pusathalaman.dashboard.template_impor_produk.click
  sleep 1
    
  # Buka file Excel
  file_path = 'C:\Ruby34-x64\automation\doc\impor_produk_lama.xlsx'
  workbook = RubyXL::Parser.parse(file_path)

  # Akses worksheet pertama
  worksheet = workbook[0]

  if worksheet && worksheet[0]
    @nama_produk_impor = 'Ayam Goreng automation 6'
    worksheet[4][1].change_contents(@nama_produk_impor)
    worksheet[4][2].change_contents('Makanan')
    worksheet[4][3].change_contents('10000')
    worksheet[4][4].change_contents('Y')
  else
    raise "Worksheet or row does not exist"
  end

  # Simpan perubahan ke file yang sama atau file baru
  workbook.write('C:\Ruby34-x64\automation\doc\impor_produk_lama.xlsx')   

  # Path file XLSX dan lokasi tujuan XLS
  file_path_xlsx = 'C:\\Ruby34-x64\\automation\\doc\\impor_produk_lama.xlsx'
  file_path_xls = 'C:\\Ruby34-x64\\automation\\doc\\hasil_untuk_impor.xls'

  # Mulai aplikasi Excel
  excel = WIN32OLE.new('Excel.Application')

  # Tampilkan Excel agar proses terlihat (bisa dihilangkan jika tidak perlu)
  excel.Visible = false
  excel.DisplayAlerts = false

  # Buka file XLSX
  workbook = excel.Workbooks.Open(file_path_xlsx)

  # Simpan file dalam format XLS (Excel 97-2003)
  workbook.SaveAs(file_path_xls, 56) # 56 adalah kode format untuk Excel 97-2003 (XLS)

  # Tutup workbook dan Excel
  workbook.Close
  excel.Quit
end

When('User melakukan impor produk') do
  sleep 2
  @pusathalaman.dashboard.pilih_file_impor_produk.click
  sleep 3

  system('"C:\\Program Files (x86)\\AutoIt3\\autoIt3_x64.exe" "C:\\Ruby34-x64\\automation\\doc\\select_file.au3"')

  sleep 3

  @pusathalaman.dashboard.setuju_impor.click
  sleep 2
  @pusathalaman.dashboard.ya_impor.click
  sleep 3
end

Then('Produk berhasil terbuat melalui impor') do
    @pusathalaman.dashboard.lonceng.click
    sleep 2

    berhasil_impor = @pusathalaman.dashboard.berhasil_impor.text
    expect(berhasil_impor).to include("produk berhasil diimpor")

    @pusathalaman.dashboard.lihat_notif.click
    sleep 2

    nama_produk_impor = @pusathalaman.dashboard.nama_produk_impor.text
    expect(nama_produk_impor).to include(@nama_produk_impor)

    if nama_produk_impor.include?(@nama_produk_impor)
      puts 'Produk Berhasil Ter-Impor'
    end
end