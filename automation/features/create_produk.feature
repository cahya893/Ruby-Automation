Feature: Buat Produk

  Scenario: Sukses Membuat Produk
    Given User udah login pawoon
    When User masuk ke menu produk
    And User masuk ke menu tambah produk
    And User melakukan tambah produk
    Then Produk berhasil terbuat