# Hoofdstuk 2: Filteren met WHERE

## Leerdoelen

In dit hoofdstuk leer je:

- filteren met `WHERE`;
- voorwaarden combineren met `AND` en `OR`;
- zoeken op tekst met `LIKE`;
- lege waarden herkennen met `IS NULL`.

Je blijft werken als Nimmastream-medewerker: klantenvragen vertalen naar precieze query's.

---

Werk in phpMyAdmin altijd in:

`nimmastream_<gebruikersnaam>`

---

## Voordoen en nadoen

### Voordoen (nieuw concept: `WHERE`)

Vraag: "Welke profielen zijn 12 jaar of jonger?"

```sql
SELECT id, voornaam, achternaam, leeftijd_profiel
FROM profielen
WHERE leeftijd_profiel <= 12
ORDER BY leeftijd_profiel, id;
```

Controlequery:

```sql
SELECT COUNT(*) AS aantal_kindprofielen
FROM profielen
WHERE leeftijd_profiel <= 12;
```

**Voorspel eerst** hoeveel rijen je ongeveer verwacht.  
**Hoe weet je dat dit klopt?**

### Nadoen (één verandering)

Zelfde query, maar nu alleen regio `NH`:

```sql
SELECT id, voornaam, achternaam, leeftijd_profiel, regio
FROM profielen
WHERE leeftijd_profiel <= 12
  AND regio = 'NH'
ORDER BY leeftijd_profiel, id;
```

Controlequery:

```sql
SELECT COUNT(*) AS aantal_kindprofielen_nh
FROM profielen
WHERE leeftijd_profiel <= 12
  AND regio = 'NH';
```

---

## Nieuwe stap: `IS NULL`

Soms staat er geen einddatum bij een abonnement. Dan is de waarde `NULL`.

```sql
SELECT id, gebruiker_id, status
FROM abonnementen
WHERE beëindigd_op IS NULL
ORDER BY id
LIMIT 10;
```

Belangrijk:

- `= NULL` is fout;
- gebruik altijd `IS NULL` of `IS NOT NULL`.

---

## Opdrachten

Steeds eerst voorspellen, dan uitvoeren, dan controleren.

### Opdracht 1 - Basis (`WHERE`)

Vraag: "Welke series hebben kijkwijzer 16?"

```sql
SELECT id, titel, kijkwijzer
FROM series
WHERE kijkwijzer = '16'
ORDER BY titel;
```

Controlequery:

```sql
SELECT COUNT(*) AS aantal_series_16
FROM series
WHERE kijkwijzer = '16';
```

Hoe weet je dat dit klopt?

### Opdracht 2 - Basis (`AND`/`OR`)

Vraag: "Welke profielen wonen in NH of ZH?"

```sql
SELECT id, voornaam, achternaam, regio
FROM profielen
WHERE regio = 'NH' OR regio = 'ZH'
ORDER BY regio, id;
```

Controlequery:

```sql
SELECT COUNT(*) AS aantal_nh_of_zh
FROM profielen
WHERE regio = 'NH' OR regio = 'ZH';
```

Schrijf daarna ook een versie met `AND` en leg uit waarom die veel minder rijen geeft.

### Opdracht 3 - Verdieping (`LIKE`)

Vraag: "Welke gebruikers hebben 'harry' in hun e-mail?"

```sql
SELECT id, email
FROM gebruikers
WHERE email LIKE '%harry%';
```

Controlequery:

```sql
SELECT COUNT(*) AS aantal_harry
FROM gebruikers
WHERE email LIKE '%harry%';
```

### Opdracht 4 - Verdieping (`IS NULL`)

Vraag: "Welke abonnementen zijn nog niet beëindigd?"

```sql
SELECT id, gebruiker_id, type, status, beëindigd_op
FROM abonnementen
WHERE beëindigd_op IS NULL
ORDER BY id;
```

Controlequery:

```sql
SELECT COUNT(*) AS aantal_lopend
FROM abonnementen
WHERE beëindigd_op IS NULL;
```

### Opdracht 5 - Debuggen 1 (aanhalingstekens)

Foute query:

```sql
SELECT id, titel
FROM series
WHERE kijkwijzer = 16;
```

1. Waarom is dit riskant in een tabel met enum-tekstwaarden?
2. Herstel de query.
3. Controleer met een `COUNT(*)`.

### Opdracht 6 - Debuggen 2 (ë in status)

Foute query:

```sql
SELECT COUNT(*) AS aantal
FROM abonnementen
WHERE status = 'beeindigd';
```

Herstel met de echte enum-waarde:

```sql
SELECT COUNT(*) AS aantal
FROM abonnementen
WHERE status = 'beëindigd';
```

Waarom geeft de eerste query 0 rijen terug?

### Opdracht 7 - Uitdaging (onderzoek)

Vraag in gewone taal:  
"In profielen staat regio `VK`, maar in gebruikers staat land `UK`. Hoe vaak komt dat voor?"

Maak zelf twee queries:

1. tel gebruikers met `land = 'UK'`;
2. tel profielen met `regio = 'VK'`.

Sluit af met: is de codering consistent of niet?

---

## Check je begrip

1. Wanneer gebruik je `IS NULL`?
2. Wat is het verschil tussen `AND` en `OR`?
3. Wanneer kies je `LIKE` in plaats van `=`?
4. Waarom moet je exact de waarde `'beëindigd'` typen?

---

## Reflectie

Welke debug-opgave vond je het lastigst, en welke stap hielp om de fout te vinden?

---

## Samenvatting

- `WHERE` filtert rijen.
- `AND` en `OR` bepalen hoe voorwaarden samenwerken.
- `LIKE` zoekt patronen in tekst.
- `IS NULL` is nodig voor lege waarden.
