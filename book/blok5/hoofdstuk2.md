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

Hier worden de resultaten gefilterd met `WHERE` met daarachter een voorwaarde. Alle records die niet voldoen aan de voorwaarde komen zo niet terug.

### Nadoen (één verandering)

Zelfde query, maar nu alleen regio `NH`:

```sql
SELECT id, voornaam, achternaam, leeftijd_profiel, regio
FROM profielen
WHERE leeftijd_profiel <= 12
  AND regio = 'NH'
ORDER BY leeftijd_profiel, id;
```

Er worden dus twee voorwaarden gecombineerd met `AND`.

### Voordoen (nieuw concept: `OR`)

Vraag: "Welke profielen wonen in regio NH of ZH?"

```sql
SELECT id, voornaam, achternaam, regio
FROM profielen
WHERE regio = 'NH' OR regio = 'ZH'
ORDER BY regio, id;
```

Hier werkt `OR` als een "alles-of" operator: records die aan **minstens één** voorwaarde voldoen, komen terug. Dit geeft je veel meer rijen dan met `AND`.

### Voordoen (AND en OR combineren)

Vraag: "Welke profielen zijn in NH of ZH **en** jonger dan 13?"

```sql
SELECT id, voornaam, achternaam, regio, leeftijd_profiel
FROM profielen
WHERE (regio = 'NH' OR regio = 'ZH')
  AND leeftijd_profiel < 13
ORDER BY regio, leeftijd_profiel;
```

Let op: haakjes bepalen de **volgorde**. `AND` bindt sterker dan `OR`, dus de haakjes zijn hier essentieel:

- **Met haakjes** (goed): eerst alle NH en ZH, daarna filteren op leeftijd.
- **Zonder haakjes** (fout): SQL interpreteert het anders en geeft verkeerde resultaten.

### Voordoen (nieuw concept: `LIKE`)

Vraag: "Welke gebruikers hebben `harry` in hun e-mailadres?"

```sql
SELECT id, email, voornaam
FROM gebruikers
WHERE email LIKE '%harry%'
ORDER BY email;
```

`LIKE` zoekt op **patroon**, niet op exacte match:

- `%harry%` = "harry" ergens in de waarde (voor- en/of achter)
- `harry%` = begint met "harry"
- `%harry` = eindigt met "harry"
- `_` = precies één teken (bijv. `b_t` matcht "bat", "bit", "bot", etc.)

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

Schrijf zelf een query met:

- `FROM series`
- `WHERE kijkwijzer = '16'`
- alfabetische sortering op titel

Controlequery:

```sql
SELECT COUNT(*) AS aantal_series_16
FROM series
WHERE kijkwijzer = '16';
```

Hoe weet je dat dit klopt?

### Opdracht 2 - Basis (`OR`)

Vraag: "Welke profielen wonen in Gelderland of Zeeland?"

Schrijf zelf een query met `OR` voor deze regios.

**Vervolgvraag:** Schrijf nu een query die profielen uit Gelderland **en** Zeeland opeist, maar **niet** de anderen:
Hoeveel rijen verwacht je dat deze query oplevert? Probeer het en leg uit.

### Opdracht 3 - Verdieping

Vraag: "Welke profielen zijn in Friesland of Brabant **en** jonger dan 13?"

Schrijf zelf een query en denk aan de haakjes!

**Probeer:** Laat de haakjes weg en kijk wat er gebeurt. Welke resultaten verschillen?

### Opdracht 4 - Verdieping (`LIKE`)

Vraag a: "Bij welke gebruikers begint hun e-mail adres met de letter 'a'?"

Vraag b: "Bij welke gebruiker zit de naam 'ivo' in het e-mail adres?"

Vraag c: "Bij welke gebruikers eindigt hun e-mail adres voor het '@' teken met de letter 't'?"

Schrijf zelf queries met `LIKE`.

**Vervolgvraag:** Schrijf een query die e-mails vindt die eindigen op `@nimmastream.com`.

### Opdracht 5 - Verdieping (`IS NULL`)

Vraag: "Welke abonnementen zijn nog niet beëindigd?"

Schrijf zelf een query met `IS NULL` op `beëindigd_op`.

### Opdracht 6 - Debuggen 1 (aanhalingstekens)

Foute query:

```sql
SELECT id, titel
FROM series
WHERE kijkwijzer = 16;
```

1. Waarom is dit riskant in een tabel met enum-tekstwaarden?
2. Verbeter de query.

### Opdracht 7 - Debuggen 2 (ë in status)

Foute query:

```sql
SELECT COUNT(*) AS aantal
FROM abonnementen
WHERE status = 'beeindigd';
```

1. Waarom geeft de eerste query 0 rijen terug?
2. Herstel met de echte enum-waarde:

---

## Check je begrip

1. Wanneer gebruik je `IS NULL`?
2. Wat is het verschil tussen `AND` en `OR`?
3. Waarom zijn haakjes belangrijk bij combinaties van `AND` en `OR`?
4. Wanneer kies je `LIKE` in plaats van `=`?
5. Welke `LIKE`-patronen zijn dit?
   - `%@outlook.com` (wat zoek je?)
   - `2023-%` (wat zoek je?)
   - `_izz_` (welke woorden passen?)
6. Waarom moet je exact de waarde `'beëindigd'` typen i.p.v. `beeindigd`?

---

## Reflectie

Welke debug-opgave vond je het lastigst, en welke stap hielp om de fout te vinden?

---

## Samenvatting

- `WHERE` filtert rijen.
- `AND` en `OR` bepalen hoe voorwaarden samenwerken.
- `LIKE` zoekt patronen in tekst.
- `IS NULL` is nodig voor lege waarden.
