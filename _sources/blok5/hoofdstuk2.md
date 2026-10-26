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

## 1. SELECT: gegevens opvragen

Met `SELECT` vraag je data op uit een tabel.

```sql
SELECT * FROM gebruikers;
```

Het sterretje `*` betekent: alle kolommen.

Meestal wil je alleen de kolommen die je echt nodig hebt:

```sql
SELECT voornaam, achternaam
FROM gebruikers;
```

Dat maakt je resultaat overzichtelijker.

---

## 2. WHERE: filteren op voorwaarden

Met `WHERE` bepaal je welke rijen je wilt zien.

```sql
SELECT voornaam, leeftijd
FROM gebruikers
WHERE leeftijd > 18;
```

Je kunt voorwaarden combineren:

```sql
SELECT voornaam, leeftijd, regio
FROM gebruikers
WHERE regio = 'NH' AND leeftijd < 20;
```

Zoeken op patroon:

```sql
SELECT voornaam
FROM gebruikers
WHERE voornaam LIKE 'A%';
```

`A%` betekent: tekst die begint met A.

---

## 3. ORDER BY: sorteren

```sql
SELECT titel
FROM series
ORDER BY titel ASC;
```

- `ASC` = oplopend (A-Z, laag-hoog)
- `DESC` = aflopend (Z-A, hoog-laag)

Top 5 oudste gebruikers:

```sql
SELECT voornaam, leeftijd
FROM gebruikers
ORDER BY leeftijd DESC
LIMIT 5;
```

---

## 4. Denk als een data-onderzoeker

Bij elke query stel je jezelf drie vragen:

1. **Wat wil ik weten?**  
   (bijv. jongste gebruikers)
2. **Waar staat die data?**  
   (welke tabel, welke kolom)
3. **Hoe controleer ik of het logisch is?**  
   (kloppen aantallen, volgorde en waarden)

---

## Opdrachten

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
