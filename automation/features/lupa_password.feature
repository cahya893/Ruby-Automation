Feature: Lupa Password

  Scenario: Berhasil Request Email Lupa Password
    Given User berada di halaman login Pawoon
    When User Masuk ke halaman lupa Password
    And User Input email akun Pawoon
    Then Berhasil Request Email Lupa Password