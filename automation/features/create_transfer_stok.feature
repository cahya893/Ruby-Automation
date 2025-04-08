Feature: Buat Transfer Stok

  Scenario: Sukses Membuat Transfer Stok
    Given User udah login pawoon
    When User masuk ke menu transfer Stok
    And User membuat transfer stok
    Then transfer stok berhasil terbuat