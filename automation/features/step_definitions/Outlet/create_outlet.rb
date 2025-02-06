When('User masuk ke menu Outlet') do
    sleep 3
    @pusathalaman.dashboard.menu_outlet.click
    sleep 1
    @pusathalaman.dashboard.btn_tambah_outlet.click
    sleep 2
  end
  
  When('User membuat outlet baru') do
    base_name = 'Outlet Automation'
    @nama_outlet_baru = base_name
    counter = 1

    @pusathalaman.dashboard.input_nama_outlet.set @nama_outlet_baru
    sleep 1
    @pusathalaman.dashboard.dropdown_outlet_baru.click
    sleep 2
    @pusathalaman.dashboard.pilih_alamat_outlet_baru.click
    sleep 1
    @pusathalaman.dashboard.simpan_outlet_baru.click
    sleep 1 
    loop do
        if page.has_content?('Nama outlet sudah ada')
            counter += 1
            @nama_outlet_baru = "#{base_name} #{counter}"
            @pusathalaman.dashboard.input_nama_outlet.set @nama_outlet_baru
            @pusathalaman.dashboard.simpan_outlet_baru.click
        else
            break
        end
        end
        sleep 3
        @pusathalaman.dashboard.ok_informasi_outlet_baru.click
        sleep 1
  end
  
  Then('Outlet berhasil terbuat') do
    @pusathalaman.dashboard.lonceng.click
    sleep 2
    notif_outlet_terbuat = @pusathalaman.dashboard.notif_outlet_terbuat.text
    expect(notif_outlet_terbuat).to include("Outlet berhasil dibuat")
  end