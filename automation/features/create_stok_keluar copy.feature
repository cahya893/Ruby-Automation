Feature: Buat Stok Keluar

  Scenario: Sukses Membuat Stok Keluar
    Given User udah login pawoon
    When User masuk ke menu stok keluar
    And User membuat stok Keluar
    Then stok keluar berhasil terbuat