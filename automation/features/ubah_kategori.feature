Feature: Ubah Kategori

  Scenario: Sukses Hapus Kategori
    Given User udah login pawoon
    When User masuk ke menu produk
    And User masuk ke menu Kategori
    And User Ubah Kategori
    Then Kategori berhasil DiUbah