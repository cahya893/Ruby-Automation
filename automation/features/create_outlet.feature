Feature: Buat Outlet

  Scenario: Sukses Membuat Outlet
    Given User udah login pawoon
    When User masuk ke menu Outlet
    And User membuat outlet baru
    Then Outlet berhasil terbuat