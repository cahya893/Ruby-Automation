Feature: Hapus Opsi Tambahan

  Scenario: Sukses Hapus Opsi Tambahan
    Given User udah login pawoon
    When User masuk ke menu produk
    And User masuk ke menu opsi tambahan
    And User Hapus Opsi Tambahan
    Then Opsi Tambahan berhasil Dihapus