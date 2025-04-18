require 'site_prism'

class DashboardPage < SitePrism::Page
    element:pop_up, '#modal-dynamic-popup > div > div'
    element:close_pop_up, '#closeModal'
    element:button_profile, '#user-menu-dropdown > img'
    element:menu_profile, '#notification > li > span:nth-child(2) > ul > li:nth-child(1) > a'
    element:email_akun_text, '#account-content > ul > li:nth-child(3) > span'  
    element :verisikasi_email_akun_baru, '#user-email'

    #Produk
    element :menu_produk, '#navbarBackdrop > nav > div.scroll-panel > ul > li:nth-child(4) > a'
    element :tambah_produk, '#add-new-product > span'
    element :field_nama_produk, '#name'
    element :button_tambah_produk, '#page-wrapper > div:nth-child(2) > div > div.col-md-4.col-xs-12.center-less.text-right > button'
    element :validasi_produk_terbuat, '#page-wrapper > div:nth-child(1) > div.top-notification > div > div'
    element :produk_duplikat, '#form_product > div:nth-child(2) > div.box-wrapper.col-md-12.col-xs-12 > div:nth-child(1) > div.form-group.col-md-12.col-xs-12.has-error > div > label > div'
    element :more_produk, '#table-product > tbody > tr:nth-child(1) > td:nth-child(4) > div > span'
    element :btn_hapus_produk, '#table-product > tbody > tr:nth-child(1) > td:nth-child(4) > div > div > ul > li.action-delete'
    element :produk_yang_delete, '#form-delete-product > p > b'
    element :delete_produk, '#form-delete-product > div > div > div > button.btn.btn-sm.btn-custom.submit-action-delete.fill-red'
    element :gagal_delete, '<div class="text-center" bis_skin_checked="1"><span class="icon-warning-alert"></span>Produk gagal dihapus.</div>'
    element :produk_1, '#table-product > tbody > tr:nth-child(1) > td:nth-child(1)'
    element :ubah_produk, '#table-product > tbody > tr:nth-child(1) > td:nth-child(4) > div > div > ul > li.action-edit'

    #import produk
    element :impor_produk, '#impor-product'
    element :dropdown_outlet, '#form-product-import > div:nth-child(2) > span > div > button'
    element :pilih_outlet, '#form-product-import > div:nth-child(2) > span > div > ul > li:nth-child(3) > a > label > input[type=checkbox]'
    element :template_impor_produk, '#form-product-import > div.block-info.col-sm-12 > div:nth-child(2) > a'
    element :pilih_file_impor_produk, '#form-product-import > div:nth-child(4) > div'
    element :setuju_impor, '#modal-impor-product > div > div > div.row > div > div.action-button.col-sm-4.col-xs-12 > button.btn.btn-sm.btn-custom.fill-blue.action-import'
    element :ya_impor, '#modal-info-notification > div > div > div.modal-body > div > div > div > button'
    element :lonceng, '#notification-bell > span.notification.icon-bell'
    element :berhasil_impor, '#notification > li > span:nth-child(1) > ul > div > li.col-sm-12.col-xs-12.unread > div.content.col-sm-7.col-xs-7 > p'
    element :lihat_notif, '#notification > li > span:nth-child(1) > ul > div > li:nth-child(1) > div.content.col-sm-3.col-xs-3 > a'
    element :nama_produk_impor, '#table-product > tbody > tr:nth-child(1)'

    #Expor Produk
    element :btn_expor_produk, '#export-product > span'
    element :dropdown_pilih_outlet_expor_produk, '#form-product-export > div > div > div > button > span.filter-option.pull-left'
    element :pilih_outlet_expor_produk, '#form-product-export > div > div > div > div > ul > li:nth-child(1)'
    element :btn_simpan_expor_produk, '#modal-export-product > div > div > div.row > div > button.btn.btn-sm.btn-custom.fill-blue.action-export'
    element :text_berhasil_expor, '#notification > li > span:nth-child(1) > ul > div > li.col-sm-12.col-xs-12.unread > div.content.col-sm-7.col-xs-7'

    #Opsi Tambahan
    element :notif_opsitambahan_terbuat, '#page-wrapper > div:nth-child(1) > div.top-notification'
    element :btn_create_opsitambahan, '#tab-opsi-tambahan > a'
    element :btn_tambah_opsitambahan, '#create-modifier > span'
    element :nama_grup_opsitambahan, '#group_name'
    element :nama_opsitambahan1, '#appendOpsi > div.optionWrapper.col-xs-12.no-padding > div.col-sm-7.col-xs-5.no-padding.form-group > input'
    element :harga_opsitambahan1, '#appendOpsi > div.optionWrapper.col-xs-12.no-padding > div.col-sm-3.col-xs-4.col-xs-offset-1.col-sm-offset-1.no-padding.form-group > input'
    element :tambah_opsitambahan_lain, '#tambahOpsi'
    element :nama_opsitambahan2, '#appendOpsi > div:nth-child(3) > div.col-sm-7.col-xs-5.no-padding.form-group > input'
    element :harga_opsitambahan2, '#appendOpsi > div:nth-child(3) > div.col-sm-3.col-xs-4.col-xs-offset-1.col-sm-offset-1.no-padding.form-group > input'
    element :togle_opsitambahan_bahanbaku, '#bahanBaku'
    element :simpan_opsitambahan, '#page-wrapper > div.col-md-12.col-xs-12.no-padding > div:nth-child(1) > div > div.col-md-4.col-xs-12.center-less.text-right > button'
    element :delete_opsitambahan, '#appendOpsi > div:nth-child(3) > div.col-sm-1.col-xs-2.form-group > a > span'
    element :more_opsitambahan, '#table-modifiers > tbody > tr:nth-child(1) > td.text-right > div > span'
    element :set_to_produk, '#table-modifiers > tbody > tr:nth-child(1) > td.text-right > div > div > ul > li:nth-child(1) > a'
    element :kelola_bahan_opsitambahan, '#table-modifiers > tbody > tr:nth-child(1) > td.text-right > div > div > ul > li:nth-child(2) > a'
    element :ubah_opsitambahan, '#table-modifiers > tbody > tr:nth-child(1) > td.text-right > div > div > ul > li:nth-child(4) > a'
    element :hapus_opsitambahan, '#table-modifiers > tbody > tr:nth-child(1) > td.text-right > div > div > ul > li.action-delete'
    element :checkbox_opsitambahan1, '#kelola-modifiers > tbody > tr:nth-child(1) > td:nth-child(1) > input'
    element :simpan_set_opsitambahan, '#page-wrapper > div.col-md-12.col-xs-12.no-padding > div.row > div > div.col-md-5.col-xs-12.center-less.text-right > a.btn.btn-sm.btn-custom.fill-blue.action-submit'
    text_set_opsitambahan = 'Opsi Tambahan berhasil diupdate ke produk'
    element :duplikat_opsitambahan, '#formCreateModifier > div > div > div.row.col-md-7.col-xs-12 > div.form-group.col-md-12.col-xs-12.no-padding.has-error > div > label'
    element :delete_opsitambahan, '#form-delete-product-modifier > div > div > div > button.btn.btn-sm.btn-custom.fill-red.submit-action-delete'
    element :dropdown_bahan_opsi, '#kompositWrapper_1914_1 > div.form-group.col-sm-10.col-xs-10.selectpicker-n-s.selectpicker-tooltip > span > span.selection > span'
    element :field_bahan_opsi, 'body > span > span > span.select2-search.select2-search--dropdown > input'
    element :produk_bahan_opsi, '#select2-wy3m-results > li:nth-child(1) > div > div'
    element :jmlh_bahan_opsi, '#jumlah_1914_1 > input'
    element :simpan_bahan_opsi, '#page-wrapper > div:nth-child(2) > div > div.col-md-4.col-xs-12.center-less.text-right > a.btn.btn-sm.btn-custom.fill-blue.action-submit'


    #Kategori
    element :menu_kategori, '#tab-kategori'
    element :btn_tambah_kategori, '#page-wrapper > div:nth-child(2) > div > div.col-md-6.col-xs-12.center-less.text-right > a'
    element :input_nama_kategori, '#modal-form-category > div > div > div.modal-scroll-panel > div > form > div:nth-child(1) > div > input'
    element :simpan_kategori, '#modal-form-category > div > div > div.row > div > div.action-button.col-sm-6.col-xs-6 > button.btn.btn-sm.btn-custom.fill-blue.action-submit'
    element :notif_kategori_terbuat, '#page-wrapper > div:nth-child(1) > div.top-notification > div > div'
    element :more_kategori, '#table-product-category > tbody > tr:nth-child(1) > td:nth-child(3) > div > span'
    element :edit_kategori, '#table-product-category > tbody > tr:nth-child(1) > td:nth-child(3) > div > div > ul > li.action-edit'
    element :delete_kategori, '#table-product-category > tbody > tr:nth-child(1) > td:nth-child(3) > div > div > ul > li.action-delete'
    element :btn_hapus_kategori, '#form-delete-product-category > div > div > div > button.btn.btn-sm.btn-custom.fill-red.submit-action-delete'
    element :notif_kategori_terhapus, '#page-wrapper > div:nth-child(1) > div.top-notification > div > div'
    text_berhasil_delete = 'Kategori produk berhasil dihapus'
    text_berhasil_ubah = 'Kategori produk berhasil diubah'
    element :duplikat_nama_kategori, '#modal-form-category > div > div > div.modal-scroll-panel > div > form > div:nth-child(1) > div > label'

    #Outlet
    element :menu_outlet, "div[id='navbarBackdrop'] li:nth-child(8) a:nth-child(1)"
    element :btn_tambah_outlet, '#create-outlet > span'
    element :input_nama_outlet, '#modal-form-outlet > div > div > div.modal-scroll-panel > div.modal-body > form > div:nth-child(2) > div > input'
    element :dropdown_outlet_baru, '#modal-form-outlet > div > div > div.modal-scroll-panel > div.modal-body > form > div:nth-child(3) > div > span > span.selection > span'
    element :pilih_alamat_outlet_baru, '#select2-city-sq-result-70u0-1101'
    element :simpan_outlet_baru, '#modal-form-outlet > div > div > div.row > div > div.action-button.col-sm-6.col-xs-6 > button.btn.btn-sm.btn-custom.fill-blue.action-submit'
    element :ok_informasi_outlet_baru, '#modal-info-notification > div > div > div.modal-body.text-center > div > div > div > button'
    element :notif_outlet_terbuat, '#notification > li > span:nth-child(1) > ul > div > li.col-sm-12.col-xs-12.unread > div.content.col-sm-7.col-xs-7 > p'
    
    #inventori
    element :dropdown_inventori, '#navbarBackdrop > nav > div.scroll-panel > ul > li:nth-child(5)'
    element :menu_stok_masuk, '#navbarBackdrop > nav > div.scroll-panel > ul > li.dropdown.active > ul > li:nth-child(2) > a'
    element :text_stok_masuk, '#page-wrapper > div:nth-child(2) > div > div.col-md-6.col-xs-12.breadcrumb-wrapper > ol > li:nth-child(2)'
    element :tambah_stok_masuk, '#page-wrapper > div:nth-child(2) > div > div.col-md-6.col-xs-12.center-less.text-right > a.btn.btn-sm.btn-custom.fill-blue.open-input'
    element :dropdown_outlet_stok_masuk, '#form-stockin > div.modal-scroll-panel > div > div:nth-child(1) > div > div > button'
    element :pilih_outlet_stok_masuk, '#form-stockin > div.modal-scroll-panel > div > div:nth-child(1) > div > div > div > ul > li:nth-child(1) > a'
    element :tanggal_stok_masuk, '#form-stockin > div.modal-scroll-panel > div > div:nth-child(2) > div.col-sm-6 > div > input'
    element :dropdown_produk_stok_masuk, "span[title='-Pilih Produk-']"
    element :field_produk_stok_masuk, 'body > span > span > span.select2-search.select2-search--dropdown > input'
    element :pilih_produk_stok_masuk, '#select2-product_id-79-results > li'
    element :jumlah_stok_masuk, '#detail-product-item > tr > td:nth-child(2) > div > input'
    element :total_harga_beli, '#detail-product-item > tr > td:nth-child(5) > div > input'
    element :simpan_stok_masuk, '#btn-submit-stockin'
    element :stok_masuk_berhasil, '#stockin-data > tr:nth-child(1)'

    #Stok Keluar
    element :menu_stok_keluar, '#navbarBackdrop > nav > div.scroll-panel > ul > li:nth-child(5) > ul > li:nth-child(3) > a'
    element :btn_tambah_stok_keluar, ".btn.btn-sm.btn-custom.fill-blue.open-input"
    element :dropdown_outlet_stok_keluar, '#test > div > div > button > span.filter-option.pull-left'
    element :pilih_outlet_stok_keluar, '#test > div > div > div > ul > li:nth-child(1) > a'
    element :tanggal_stok_keluar, '#form-stockout > div.modal-scroll-panel > div > div:nth-child(2) > div > div > input'
    element :dropdown_produk_stok_keluar, "span[title='-Pilih Produk-']"
    element :field_produk_stok_keluar, 'body > span > span > span.select2-search.select2-search--dropdown > input'
    element :jumlah_stok_keluar, '#detail-product-item > tr > td:nth-child(2) > div > input'
    element :simpan_stok_keluar, '#btn-submit-stockout'
    text_berhasil_stok_keluar = 'Stok keluar berhasil ditambahkan'

    #transfer stok
    element :menu_transfer_stok, '#navbarBackdrop > nav > div.scroll-panel > ul > li.dropdown.active > ul > li:nth-child(4) > a'
    element :btn_tambah_transfer_stok, ".btn.btn-sm.btn-custom.fill-blue.open-input"
    element :dropdown_outlet_asal, "button[title='-Pilih Outlet Asal-'] span[class='filter-option pull-left']"
    element :pilih_outlet_asal, "div[class='btn-group bootstrap-select form-control open'] li:nth-child(1) a:nth-child(1)"
    element :dropdown_outlet_tujuan, '#form-transfer > div.modal-scroll-panel > div > div:nth-child(3) > div > div > button > span.filter-option.pull-left'
    element :pilih_outlet_tujuan, "div[class='btn-group bootstrap-select form-control open'] li:nth-child(2) a:nth-child(1) span:nth-child(1)"
    element :tanggal_transfer_stok, "input[name='date']"
    element :dropdown_produk_transfer_stok, "span[title='-Pilih Produk-']"
    element :field_produk_transfer_stok, 'body > span > span > span.select2-search.select2-search--dropdown > input'
    element :jumlah_transfer_stok, "input[value='0']"
    element :btn_simpan_transfer_stok, "#btn-submit-transfer"
    element :text_trasfer_stok, '#page-wrapper > div:nth-child(2) > div > div.col-md-6.col-xs-12.breadcrumb-wrapper > ol > li:nth-child(2)'
    
    #bantuan
    element :php_debug_close, 'body > div.phpdebugbar > div.phpdebugbar-header > div.phpdebugbar-header-right > a.phpdebugbar-close-btn'
    element :notif_hijau, '#page-wrapper > div:nth-child(1) > div.top-notification > div > div'
end
