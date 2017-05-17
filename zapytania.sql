select * from pracownicy;
select * from pracownicy;

# zapytanie zwracające podstawowe dane pracowników dla podanego sklepu

select * from pracownicy where id_sklep='s315';

# zapytanie zwracające podstawowe dane pracowników dla podanego sklepu

select id_pracownika,pr_imie,pr_nazwisko,role_nazwa,id_sklep from pracownicy natural left join role where role.id_roli=3;

# zapytanie zwracające podstawowe dane dla podanego indeksy w podanym sklpie

SELECT 
    id_sklep,branza,grupa, kod_index, towar_nazwa, zasoby_ilosc, zasoby_cena
FROM
    zasoby
        NATURAL JOIN
    towary
WHERE
    id_sklep = 's315';

# zapytanie zwracające podstawowe dane dla podanego indeksy w podanym sklpie dla branzy IT
SELECT 
    id_sklep,
    branza,
    kod_index,
    towar_nazwa,
    zasoby_ilosc,
    zasoby_cena
FROM
    zasoby
        NATURAL JOIN
    towary
WHERE
    id_sklep = 's315' AND branza = 'it';

# zapytanie zwracające podstawowe dane towaru w podanym sklpie dla gpodanej grupy towarowej

SELECT 
    id_sklep,
    grupa,
    kod_index,
    towar_nazwa,
    zasoby_ilosc,
    zasoby_cena
FROM
    zasoby
        NATURAL JOIN
    towary
WHERE
    id_sklep = 's315'
        AND grupa = 'notebooki'
ORDER BY zasoby_cena;


# zapytanie zwracające podstawowe dane dla podanego indeksy w podanym sklpie dla grupy notebooki oraz priorytet większy od  2

SELECT 
    id_sklep,
    grupa,
    kod_index,
    towar_nazwa,
    zasoby_ilosc,
    zasoby_cena,
    towar_priorytet
FROM
    zasoby
        NATURAL JOIN
    towary
WHERE
    id_sklep = 's315'
        AND grupa = 'notebooki'
        AND towar_priorytet > 2
ORDER BY towar_priorytet DESC , zasoby_cena DESC;


# zapytanie zwracające ilośći towarów podanego indexu we poszczególnych sklepach
SELECT 
    kod_index, towar_nazwa,zasoby_ilosc, zasoby_cena
FROM
    zasoby
        NATURAL RIGHT JOIN
    towary
GROUP BY kod_index;

# zapytanie zwracające podstawowe dane dla podanego indeksy w podanym sklpie

# zapytanie zwracające liste regionów z przypisanymi sklepami
SELECT 
    id_region, region_imie, region_nazw, id_sklepy, sklep_miasto
FROM
    regiony
        NATURAL JOIN
    sklepy;

# zapytanie zwracające liste sklepów wraz z godzinami otwarcia
SELECT 
    id_sklepy,
    sklep_miasto,
    sklep_adres,
    mon,
    tue,
    wed,
    thu,
    fri,
    sat,
    sun
FROM
    sklepy
        NATURAL LEFT JOIN
    godziny;

# zapytanie zwracające dane towaru dla podanego sklepu oraz wczytanego kodu ean
SELECT 
    id_sklep, kod_index, towar_nazwa, zasoby_ilosc, zasoby_cena,towar_priorytet
FROM
    zasoby
        NATURAL JOIN
    towary
WHERE
    id_sklep = 's315'
        AND kod_index = (SELECT 
            kod_index
        FROM
            bazaean
        WHERE
            kod_ean = '2880008606293');



