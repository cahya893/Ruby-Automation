Feature: Set Opsi Tambahan ke produk

  Scenario: Sukses Menambahkan Opsi tambahan ke produk
    Given User udah login pawoon
    When User masuk ke menu produk
    And User masuk ke menu opsi tambahan
    And User melakukan setup opsi tambahan ke produk
    Then Opsi tambahan berhasil di tambahan ke produk