--- Import data from database umat katolik (DUK) ---
DELETE from ref_keuskupan;
INSERT into
    ref_keuskupan(
    id,
    kode,
    no_urut,
    nama,
    nama_latin,
    alamat,
    kota,
    telepon,
    fax,
    website,
    email,
    nama_uskup_saat_ini
)
    (select
         uuid_generate_v4(),
         "KeuskupanID",
         "NoUrutKeuskupan",
         "NamaKeuskupan",
         "NamaKeuskupanLatin",
         "AlamatKeuskupan",
         "KotaKeuskupan",
         "TeleponKeuskupan",
         "FaxKeuskupan",
         "WebsiteKeuskupan",
         "EmailKeuskupan",
         "NamaUskupSaatIni"
        FROM master_keuskupan
    );

DELETE from ref_paroki;
INSERT INTO ref_paroki(
    id,
    keuskupan_id,
    kode,
    no_urut,
    nama,
    nama_gereja,
    alamat,
    kota,
    telepon,
    fax,
    website,
    email,
    pastor,
    wilayah_keuskupan
)
    (select
         uuid_generate_v4(),
         (select id from ref_keuskupan where kode=paroki."KeuskupanID") as keuskupan_id,
         "ParokiID",
         "NoParoki",
         "NamaParoki",
         "NamaGereja",
         "AlamatParoki",
         "KotaParoki",
         "TeleponParoki",
         "FaxParoki",
         "WebsiteParoki",
         "EmailParoki",
         "PastorParoki",
         "WilayahKeuskupan"
     from master_paroki paroki);

delete from ref_lingkungan;
INSERT INTO ref_lingkungan(
    id,
    paroki_id,
    wilayah_id,
    wilayah_bagian_id,
    kode,
    nama,
    no_urut,
    ketua,
    f5
)
    (select
             KodeWLID=
     from master_lingkungan lingkungan);
