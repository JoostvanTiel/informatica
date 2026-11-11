# Hoofdstuk 1: Starten als Nimmastream-medewerker

## Leerdoelen

In dit hoofdstuk leer je:

- wat een database, tabel, rij en kolom is;
- veilig werken in phpMyAdmin;
- je eerste SQL-query's met `SELECT`, `ORDER BY`, `LIMIT` en `DISTINCT`;
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

Voorbeeld: `nimmastream_taylors`

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

### DISTINCT: unieke waarden opvragen

Soms wil je niet alle waarden zien, maar alleen de **verschillende** waarden eenmaal.

**Voorbeeld:** "Welke genres komen voor in de series?"

Zonder `DISTINCT`:

```sql
SELECT genre
FROM series;
```

Dit geeft alle genres terug, ook als er meerdere series hetzelfde genre hebben. Veel dubbelen dus.

Met `DISTINCT`:

```sql
SELECT DISTINCT land
FROM gebruikers;
```

Dit geeft elk genre maar **één keer**. Veel beter bruikbaar!

**Waarom is dit handig?**

- Je ziet **welke genres voorkomen** zonder herhalingen.
- Je kunt snel checken: "Hoeveel verschillende genres?"
- Je vermijdt ruis in je resultaat.

---

## Opdrachten

Gebruik steeds deze vaste routine:

1. voorspel de uitkomst;
2. voer de query uit;
3. controleer met een extra query;
4. beantwoord: **Hoe weet je dat dit klopt?**

### Opdracht 1 - Basis

Vraag: "Welke 5 profielen zijn het oudst?"

Schrijf zelf een query met:

- `SELECT` op `id, voornaam, achternaam, leeftijd_profiel`
- `FROM profielen`
- `ORDER BY` op leeftijd aflopend
- `LIMIT 5`

Controleer je antwoord door de volgende query uit te voeren:

```sql
SELECT MAX(leeftijd_profiel) AS oudste_leeftijd
FROM profielen;
```

### Opdracht 2 - Verdieping

Vraag: "Welke landen komen voor bij gebruikers?"

Schrijf zelf een query met `DISTINCT` die alle verschillende waarden uit `land` laat zien in alfabetische volgorde.

### Opdracht 3 - Debuggen

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

### Opdracht 4 - Uitdaging (onderzoek)

Vraag: "Bestaat de klant `nina.bos@nimmastream.com`?"

Schrijf zelf een query die de gegevens van deze klant opzoekt.

---

## Check je begrip

1. Waarom is `ORDER BY` belangrijk als je `LIMIT` gebruikt?
2. Wat is het verschil tussen een rij en een kolom?
3. Waarom is voorspellen vóór uitvoeren nuttig?
4. Welke controlequery hielp jou vandaag het meest?
5. Wat is het verschil tussen `SELECT land` en `SELECT DISTINCT land`?
6. Wanneer zou je `COUNT(DISTINCT kolom)` gebruiken?

---

## Reflectie

Welke fout maakte je vandaag (of bijna), en hoe vond je die terug?

---

## Samenvatting

- Je werkt in je eigen `nimmastream_<gebruikersnaam>`-database.
- Je gebruikt `SELECT` om data op te vragen.
- Met `ORDER BY` en `LIMIT` maak je resultaatlijsten bruikbaar.
- Met `DISTINCT` zie je alleen unieke waarden (geen dubbelen).
- Je controleert elke query met een onderbouwing.
