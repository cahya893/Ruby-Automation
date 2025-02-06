Feature: Ubah Produk

  Scenario: Sukses Delete Produk
    Given User udah login pawoon
    When User masuk ke menu produk
    And User melakukan ubah produk
    Then Produk berhasil di ubah