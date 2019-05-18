Feature: Baptis CRUD

  Scenario: Successfully add new data
    Given I don't have baptis data with kode "999.999.I.1.1.A"
    And I have logged in as an administrator for paroki test
    And I send a JSON POST request to '/baptis' with body:
    """
    {
      "buku": "I",
      "nomor": 1,
      "halaman": 1,
      "lanjutan": "A",
      "nama": "Foo Bar",
      "tempatLahir": "Barong Tongkok",
      "tanggalLahir": "1980-07-21",
      "tanggalBaptis": "1980-07-21",
      "waliBaptis1": "Hello World 1",
      "waliBaptis2": "Hello World 2",
      "jenisKelamin": 1
    }
    """
    Then the response status code should be 201
    And the JSON should be a superset of:
    """
    {
      "kodeBaptis": "999.999.I.1.1.A"
    }
    """
