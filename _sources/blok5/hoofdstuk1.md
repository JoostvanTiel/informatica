# Hoofdstuk 1: Starten als Nimmastream-medewerker

## Leerdoelen

In dit hoofdstuk leer je:

- wat een database, tabel, rij en kolom is;
- veilig werken in phpMyAdmin;
- je eerste SQL-query's met `SELECT`, `ORDER BY` en `LIMIT`;
- voorspellen wat een query teruggeeft.

Aan het einde kun je eenvoudige data ophalen uit de Nimmastream-database en uitleggen waarom je resultaat klopt.

---

## Korte warming-up: SQL Island (15 minuten)

Ga naar https://sql-island.informatik.uni-kl.de/ en speel 15 minuten.

Noteer tijdens het spelen:

1. één opdracht die je makkelijk vond;
2. één opdracht die je lastig vond;
3. één SQL-woord dat je nog niet kende.

Daarna gaan we meteen naar de echte database.

---

## Werkomgeving

Werk in phpMyAdmin altijd in jouw eigen database:

`nimmastream_<gebruikersnaam>`

Voorbeeld: `nimmastream_leerling_007`

Je werkt als beginnende medewerker bij Nimmastream. Je taak: snel en betrouwbaar klantgegevens opzoeken.

---

## Veilig werken (altijd doen)

Voor je begint:

1. **Maak een export** van je database.
2. Bij `UPDATE` of `DELETE`: voer **eerst dezelfde `WHERE` uit met `SELECT`**.
3. Gaat er iets mis? **Importeer je export opnieuw**.

In hoofdstuk 1 doen we nog geen wijzigingen, maar deze routine geldt vanaf nu altijd.

---

## Voordoen en nadoen

### Voordoen (nieuw concept: `SELECT` + `ORDER BY` + `LIMIT`)

Vraag in gewone taal: "Laat de eerste 5 gebruikers zien."

```sql
SELECT id, email, land
FROM gebruikers
ORDER BY id
LIMIT 5;
```

Resultaatcontrole:

- je krijgt **5 rijen**;
- de ids lopen van **1 t/m 5**.

**Hoe weet je dat dit klopt?**  
Omdat je op `id` oplopend sorteert en met `LIMIT 5` precies 5 rijen vraagt.

### Nadoen (zelfde query, één verandering)

Nu jij: haal de eerste 5 profielen op.

```sql
SELECT id, gebruiker_id, voornaam, achternaam
FROM profielen
ORDER BY id
LIMIT 5;
```

**Voorspel eerst:** welke id's verwacht je?  
**Controlequery:** tel eerst alle profielen:

```sql
SELECT COUNT(*) AS aantal_profielen
FROM profielen;
```

**Hoe weet je dat dit klopt?**

---

## Opdrachten

Gebruik steeds deze vaste routine:

1. voorspel de uitkomst;
2. voer de query uit;
3. controleer met een extra query;
4. beantwoord: **Hoe weet je dat dit klopt?**

### Opdracht 1 - Basis

Vraag: "Hoe groot is elke hoofdtabel?"

```sql
SELECT COUNT(*) AS aantal_gebruikers FROM gebruikers;
SELECT COUNT(*) AS aantal_profielen FROM profielen;
SELECT COUNT(*) AS aantal_abonnementen FROM abonnementen;
```

Controle: vergelijk met je klasgenoot. Zijn jullie aantallen gelijk?

### Opdracht 2 - Basis

Vraag: "Welke 5 profielen zijn het oudst?"

```sql
SELECT id, voornaam, achternaam, leeftijd_profiel
FROM profielen
ORDER BY leeftijd_profiel DESC, id
LIMIT 5;
```

Controlequery:

```sql
SELECT MAX(leeftijd_profiel) AS oudste_leeftijd
FROM profielen;
```

### Opdracht 3 - Verdieping

Vraag: "Welke landen komen voor bij gebruikers?"

```sql
SELECT land
FROM gebruikers
ORDER BY land;
```

Controlequery:

```sql
SELECT COUNT(*) AS aantal_uk
FROM gebruikers
WHERE land = 'UK';
```

### Opdracht 4 - Debuggen

Iemand schreef:

```sql
SELECT id, email, land
gebruikers
ORDER BY id
LIMIT 5;
```

1. Wat gaat er fout?
2. Verbeter de query.
3. Hoe weet je dat je fix klopt?

### Opdracht 5 - Uitdaging (onderzoek)

Vraag: "Bestaat de klant `harry.styles@nimmastream.com`?"

```sql
SELECT id, email, land
FROM gebruikers
WHERE email = 'harry.styles@nimmastream.com';
```

Controlequery:

```sql
SELECT COUNT(*) AS aantal
FROM gebruikers
WHERE email = 'harry.styles@nimmastream.com';
```

---

## Check je begrip

1. Waarom is `ORDER BY` belangrijk als je `LIMIT` gebruikt?
2. Wat is het verschil tussen een rij en een kolom?
3. Waarom is voorspellen vóór uitvoeren nuttig?
4. Welke controlequery hielp jou vandaag het meest?

---

## Reflectie

Welke fout maakte je vandaag (of bijna), en hoe vond je die terug?

---

## Samenvatting

- Je werkt in je eigen `nimmastream_<gebruikersnaam>`-database.
- Je gebruikt `SELECT` om data op te vragen.
- Met `ORDER BY` en `LIMIT` maak je resultaatlijsten bruikbaar.
- Je controleert elke query met een onderbouwing.
