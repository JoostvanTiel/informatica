# Hoofdstuk 2: SELECT, WHERE en ORDER BY

## Leerdoelen

In dit hoofdstuk leer je de basis van SQL-query's schrijven.

Je leert:

- gegevens ophalen met `SELECT`;
- gericht filteren met `WHERE`;
- sorteren met `ORDER BY`;
- resultaten beperken met `LIMIT`.

Aan het einde van dit hoofdstuk kun je zelfstandig eenvoudige query's schrijven en controleren of je antwoord logisch is.

---

Werk in phpMyAdmin altijd in jouw database:

`nimmastream_<gebruikersnaam>`

---

## 1. SELECT: gegevens opvragen

Met `SELECT` vraag je data op uit een tabel. In SQL is dit het equivalent van: "Geef me de informatie die ik nodig heb".

Een tabel in een database kun je vergelijken met een spreadsheet: elke kolom heeft een naam, en elke rij is een record. Als je een query schrijft, vraag je eigenlijk: "Welke kolommen wil ik zien, uit welke tabel, en onder welke voorwaarden?"

```sql
SELECT *
FROM gebruikers;
```

Het sterretje `*` betekent: geef alle kolommen terug. Dat is handig als je snel een overzicht wilt zien, maar vaak is dat teveel. Je krijgt dan veel informatie die je misschien niet nodig hebt.

Meestal wil je juist alleen de kolommen die relevant zijn voor jouw vraag:

```sql
SELECT voornaam, achternaam
FROM gebruikers;
```

Deze query geeft alleen de namen terug. Dat maakt het resultaat overzichtelijker en werk je sneller met de data.

### Waarom is `SELECT` zo belangrijk?

`SELECT` bepaalt de output van je query. Als je de verkeerde kolommen kiest, heb je het antwoord misschien niet goed in beeld. Je kunt denken aan een data-onderzoeker die eerst beslist welke informatie hij nodig heeft, voordat hij gaat vergelijken of filteren.

### Praktische tip

Gebruik niet automatisch `SELECT *`.

- `SELECT *` is handig bij een eerste inspectie.
- `SELECT voornaam, achternaam` is beter als je alleen namen nodig hebt.
- `SELECT *` kan onoverzichtelijk worden als een tabel veel kolommen heeft.

---

## 2. WHERE: filteren op voorwaarden

Met `WHERE` kies je alleen de rijen die aan een bepaalde voorwaarde voldoen.

```sql
SELECT voornaam, leeftijd
FROM gebruikers
WHERE leeftijd > 18;
```

Deze query laat alleen gebruikers zien die ouder zijn dan 18. De `WHERE`-clausule werkt dus als een filter.

### Wat is een voorwaarde?

Een voorwaarde is een vergelijking. Bij SQL gebruik je vaak:

- `=` gelijk aan
- `>` groter dan
- `<` kleiner dan
- `>=` groter of gelijk aan
- `<=` kleiner of gelijk aan
- `<>` of `!=` ongelijk aan

Bijvoorbeeld:

```sql
SELECT voornaam, leeftijd, regio
FROM gebruikers
WHERE regio = 'NH' AND leeftijd < 20;
```

Deze regel betekent: toon gebruikers uit regio `NH` die jonger zijn dan 20. Je combineert meerdere voorwaarden met `AND`.

### Werken met meerdere voorwaarden

Je kunt meerdere filters combineren:

- `AND` = alle voorwaarden moeten waar zijn
- `OR` = ten minste één voorwaarde moet waar zijn

Voorbeeld:

```sql
SELECT voornaam
FROM gebruikers
WHERE regio = 'NH' OR regio = 'ZH';
```

Dit geeft gebruikers uit de regio's NH of ZH.

### Zoeken op patroon: `LIKE`

Soms wil je niet precies één waarde zoeken, maar tekst met een bepaald patroon. Daarvoor gebruik je `LIKE`.

```sql
SELECT voornaam
FROM gebruikers
WHERE voornaam LIKE 'A%';
```

`A%` betekent: tekst die begint met `A`. De `%` is een jokerteken.

Andere voorbeelden:

```sql
SELECT voornaam
FROM gebruikers
WHERE voornaam LIKE '%a';
```

Dit geeft namen die eindigen op `a`.

```sql
SELECT voornaam
FROM gebruikers
WHERE voornaam LIKE '%in%';
```

Dit geeft namen waarin `in` voorkomt.

### Belangrijk verschil

- `WHERE` filtert rijen
- `SELECT` bepaalt welke kolommen je ziet

Dus: eerst kies je welke records relevant zijn, daarna kies je welke informatie je daarvan wilt tonen.

---

## 3. ORDER BY: sorteren

Na het filteren wil je je resultaten vaak in een logische volgorde zetten. Dat doe je met `ORDER BY`.

```sql
SELECT titel
FROM series
ORDER BY titel ASC;
```

- `ASC` = oplopend (A-Z, laag-hoog)
- `DESC` = aflopend (Z-A, hoog-laag)

Bijvoorbeeld:

```sql
SELECT titel, kijkwijzer
FROM series
ORDER BY kijkwijzer DESC;
```

Dit geeft eerst de series met de hoogste kijkwijzer weer.

### Sorteren op meerdere kolommen

```sql
SELECT voornaam, leeftijd
FROM gebruikers
ORDER BY leeftijd DESC, voornaam ASC;
```

Eerst sorteer je op leeftijd van oud naar jong. Als twee gebruikers dezelfde leeftijd hebben, wordt er daarna alfabetisch op voornaam gesorteerd.

### Top 5 oudste gebruikers

```sql
SELECT voornaam, leeftijd
FROM gebruikers
ORDER BY leeftijd DESC
LIMIT 5;
```

`ORDER BY` bepaalt de volgorde, `LIMIT` beperkt het aantal resultaten. Deze combinatie is heel handig bij het vinden van de top 5, top 10 of de oudste/jongste personen.

---

## 4. LIMIT: resultaten beperken

`LIMIT` zegt: geef maar een bepaald aantal rijen terug.

```sql
SELECT voornaam, leeftijd
FROM gebruikers
ORDER BY leeftijd DESC
LIMIT 5;
```

Het resultaat bevat dan alleen de eerste 5 gebruikers uit de gesorteerde lijst.

Waarom is dat nuttig?

- je krijgt niet te veel data in één keer;
- je kunt snel een overzicht krijgen;
- je kunt de beste of meest relevante resultaten tonen.

Bijvoorbeeld:

```sql
SELECT titel
FROM series
ORDER BY titel ASC
LIMIT 10;
```

Je krijgt dan de eerste 10 titels in alfabetische volgorde.

---

## 5. Denk als een data-onderzoeker

Bij elke query stel je jezelf drie vragen:

1. **Wat wil ik weten?**  
   (bijv. "Welke gebruikers zijn ouder dan 18?")
2. **Waar staat die data?**  
   (welke tabel, welke kolom)
3. **Hoe controleer ik of het logisch is?**  
   (kloppen aantallen, volgorde en waarden)

### Een goede manier om te denken

Als je een vraag hebt, probeer die eerst om te zetten in een SQL-idee:

- Welke tabel moet ik openen?
- Welke kolommen zijn relevant?
- Welke rijen wil ik zien?
- Moet ik sorteren?
- Wil ik alleen een aantal resultaten zien?

### Voorbeeld

Vraag: "Welke 5 oudste gebruikers staan in de database?"

Je denkt:

- tabel: `gebruikers`
- kolom: `leeftijd`
- sorteren: `ORDER BY leeftijd DESC`
- limiteren: `LIMIT 5`

Query:

```sql
SELECT voornaam, leeftijd
FROM gebruikers
ORDER BY leeftijd DESC
LIMIT 5;
```

### Controleer altijd het resultaat

Na elke query vraag je jezelf af:

- klopt het aantal resultaten?
- staan de juiste waarden in de tabel?
- is de volgorde logisch?
- zijn er misschien te veel of te weinig records?

Een query is niet automatisch goed omdat hij "werkt". Je moet altijd controleren of het antwoord past bij de vraag.

### Oefenmetaforen

Je kunt SQL vergelijken met het zoeken in een grote archiefkast:

- `FROM` = welke doos open je?
- `WHERE` = welke dossiers neem je eruit?
- `SELECT` = welke informatie schrijf je op?
- `ORDER BY` = in welke volgorde leg je ze neer?
- `LIMIT` = hoeveel documenten geef je mee?

Deze metafoor helpt leerlingen om de logica van SQL beter te begrijpen.

---

## 6. Typische fouten en aandachtspunten

Veel beginners maken dezelfde fouten:

### 1. Je vergeet de tabelnaam

```sql
SELECT voornaam
FROM gebruikers;
```

Zonder `FROM` weet SQL niet uit welke tabel je data wilt halen.

### 2. Je gebruikt een tekstwaarde zonder aanhalingstekens

```sql
WHERE regio = 'NH';
```

Teksten moeten tussen enkele aanhalingstekens staan. Getallen niet.

### 3. Je gebruikt `SELECT *` zonder reden

Dat werkt wel, maar het is vaak onoverzichtelijk en minder efficiënt.

### 4. Je filtert niet goed

```sql
WHERE leeftijd > 18
```

is iets heel anders dan

```sql
WHERE leeftijd >= 18
```

Het verschil is klein, maar belangrijk.

### 5. Je controleert het resultaat niet

Als je een query uitvoert, kijk dan altijd of het antwoord logisch is. Bijvoorbeeld: als je verwacht 10 resultaten en je krijgt er 100, dan is er iets mis met de filter of de volgorde.

---
---

## Opdrachten

Voer alle opdrachten uit in jouw database: `nimmastream_<gebruikersnaam>`.

### Opdracht 1 - Basis (instap)

Schrijf query's voor:

1. alle gebruikers;
2. alleen voornaam en regio;
3. gebruiker met `id = 1`.

### Opdracht 2 - Filteren

Schrijf query's voor:

1. gebruikers ouder dan 18;
2. gebruikers uit regio `ZH`;
3. series met kijkwijzer `16`;
4. voornamen die beginnen met `E`.

### Opdracht 3 - Sorteren

Schrijf query's voor:

1. alle series alfabetisch;
2. 10 jongste gebruikers;
3. actieve abonnementen op `gebruiker_id`.

### Opdracht 4 - Combineren

Los op met één query per vraag:

1. Toon de 5 oudste gebruikers uit regio `NH`.
2. Toon alle series met kijkwijzer `12`, alfabetisch.
3. Toon gebruikers tussen 15 en 20 jaar, gesorteerd op leeftijd.

### Opdracht 5 - Challenge

Bedenk 2 eigen vragen en schrijf de query's erbij.

---

## Check je begrip

1. Wanneer gebruik je `SELECT *` wel en wanneer niet?
2. Wat is het verschil tussen `WHERE` en `ORDER BY`?
3. Wat doet `LIMIT` precies?
4. Waarom is het slim om een query-resultaat altijd te controleren?

---

## Samenvatting

- `SELECT` haalt data op.
- `WHERE` filtert data.
- `ORDER BY` sorteert data.
- `LIMIT` beperkt het aantal resultaten.

Dit is de basis waarop alle latere SQL-onderdelen in dit blok verder bouwen.

## Huiswerk

Maak 6 eigen query's:

- minimaal 2 met `WHERE`;
- minimaal 2 met `ORDER BY`;
- minimaal 1 met `LIMIT`;
- minimaal 1 combinatiequery.
