select * from pracownicy;
select * from pracownicy;

# zapytanie zwracające podstawowe dane dla podanego indeksy w podanym sklpie

select id_sklep,kod_index,towar_nazwa,zasoby_ilosc,zasoby_cena from zasoby natural join towary where id_sklep='s315';

# zapytanie zwracające ilośći towarów podanego indexu we poszczególnych sklepach
select kod_index,towar_nazwa,zasoby_cena from zasoby natural right join towary group by kod_index;

# zapytanie zwracające podstawowe dane dla podanego indeksy w podanym sklpie

# zapytanie zwracające liste regionów z przypisanymi sklepami
select id_region,region_imie,region_nazw,id_sklepy,sklep_miasto from regiony natural join sklepy;

# zapytanie zwracające liste sklepów wraz z godzinami otwarcia
select id_sklepy,sklep_miasto,sklep_adres,mon,tue,wed,thu,fri,sat,sun from sklepy natural left join godziny;

