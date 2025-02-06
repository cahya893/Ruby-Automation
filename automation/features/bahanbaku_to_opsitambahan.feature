Feature: Kelola bahan baku opsi tambahan

  Scenario: Sukses menambahkan bahan baku ke opsi tambahan
    Given User udah login pawoon
    When User masuk ke menu produk
    And User masuk ke menu opsi tambahan
    And User kelola bahan baku opsi tambahan
    Then bahan baku berhasil di tambahkan