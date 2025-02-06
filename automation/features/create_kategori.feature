Feature: Buat Kategori

  Scenario: Sukses Membuat Kategori
    Given User udah login pawoon
    When User masuk ke menu produk
    And User masuk ke menu Kategori
    And User membuat Kategori
    Then Kategori berhasil terbuat