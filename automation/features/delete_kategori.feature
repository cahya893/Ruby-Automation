Feature: Hapus Kategori

  Scenario: Sukses Hapus Kategori
    Given User udah login pawoon
    When User masuk ke menu produk
    And User masuk ke menu Kategori
    And User Hapus Kategori
    Then Kategori berhasil Dihapus