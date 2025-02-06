Feature: Register

  Scenario: Successful Register
    Given User berada di halaman login Pawoon
    When User melakukan daftar akun pawoon
    And User Mengisi data akun
    And User Mengisi data bisnis
    And User Melakukan daftar akun pawoon
    And User melakukan login akun baru
    And User melakukan login akun baru produk
    And User melakukan login akun baru ok
    And User melakukan login akun baru konfirmasi
    Then User verify login akun baru Sukses