--- Import data from database umat katolik (DUK) ---
DELETE from tr_keuskupan;
INSERT into
    tr_keuskupan(
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

DELETE from tr_paroki;
INSERT INTO tr_paroki(
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
         (select id from tr_keuskupan where kode=paroki."KeuskupanID") as keuskupan_id,
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


INSERT INTO tr_jenis_wilayah values (1, 'Pusat Paroki');
INSERT INTO tr_jenis_wilayah values (2, 'Stasi');

DELETE from tr_lingkungan;
INSERT INTO
    tr_lingkungan(
    id,
    no_urut,
    kode_lingkungan,
    nama,
    ketua
)
    (select
         uuid_generate_v4(),
         "NoLingkungan",
         "KodeWLID",
         "LingkunganID",
         "NamaKetuaLingkungan"
     FROM master_lingkungan
    )
;
UPDATE tr_lingkungan SET kode=CONCAT('027.018.',kode_lingkungan);
UPDATE tr_lingkungan SET paroki_id = (SELECT id from tr_paroki where tr_paroki.kode='027.018');
UPDATE tr_lingkungan SET jenis_wilayah_id=1 where kode_lingkungan like '01%';
UPDATE tr_lingkungan SET jenis_wilayah_id=2 where kode_lingkungan like '02%';

UPDATE sc_user SET paroki_id=(SELECT id from tr_paroki where kode='027.018');
