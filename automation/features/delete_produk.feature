Feature: Delete Produk

  Scenario: Sukses Delete Produk
    Given User udah login pawoon
    When User masuk ke menu produk
    And User melakukan delete produk
    Then Produk berhasil TerDelete