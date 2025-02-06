Feature: Buat Stok Masuk

  Scenario: Sukses Membuat Stok Masuk
    Given User udah login pawoon
    When User masuk ke menu stok masuk
    And User membuat stok masuk
    Then stok berhasil terbuat