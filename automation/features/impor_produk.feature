Feature: Impor Produk

  Scenario: Sukses Impor Produk
    Given User udah login pawoon
    When User masuk ke menu produk
    And User masuk ke menu impor produk
    And User input detail impor produk
    And User melakukan impor produk
    Then Produk berhasil terbuat melalui impor