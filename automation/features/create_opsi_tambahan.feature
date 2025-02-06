Feature: Buat Opsi tambahan

  Scenario: Sukses Membuat Opsi tambahan
    Given User udah login pawoon
    When User masuk ke menu produk
    And User masuk ke menu opsi tambahan
    And User membuat opsi tambahan
    Then Opsi tambahan berhasil terbuat