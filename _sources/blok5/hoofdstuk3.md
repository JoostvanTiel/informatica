# Hoofdstuk 3: Tabellen koppelen met JOIN

## Leerdoelen

In dit hoofdstuk leer je:

- tabellen koppelen met `JOIN`;
- aliassen gebruiken (`u`, `p`, `a`, `k`);
- werken met `LEFT JOIN`;
- samenvatten met `GROUP BY`, `COUNT(DISTINCT ...)` en `HAVING`.

Aan het einde kun je klantvragen beantwoorden waarvoor je meerdere tabellen nodig hebt.

---

Werk in:

`nimmastream_<gebruikersnaam>`

---

## Voordoen en nadoen

### Voordoen (nieuw concept: `JOIN` + aliassen)

Vraag: "Welke profielen horen bij welke gebruiker?"

```sql
SELECT p.id AS profiel_id,
       p.voornaam,
       p.achternaam,
       u.id AS gebruiker_id,
       u.email
FROM profielen AS p
JOIN gebruikers AS u ON u.id = p.gebruiker_id
ORDER BY p.id
LIMIT 10;
```

Controlequery:

```sql
SELECT COUNT(*) AS aantal_koppelingen
FROM profielen AS p
JOIN gebruikers AS u ON u.id = p.gebruiker_id;
```

Voorspel eerst: verwacht je evenveel rijen als in `profielen`? Waarom?

### Nadoen (één verandering)

Koppel nu `series` met `genres`:

```sql
SELECT s.id, s.titel, g.naam AS genre, s.kijkwijzer
FROM series AS s
JOIN genres AS g ON g.id = s.genre_id
ORDER BY s.id;
```

Controlequery:

```sql
SELECT COUNT(*) AS aantal_series_met_genre
FROM series AS s
JOIN genres AS g ON g.id = s.genre_id;
```

---

## Nieuwe stap: `LEFT JOIN`

Met `JOIN` krijg je alleen matches.  
Met `LEFT JOIN` krijg je ook rijen zonder match.

Voorbeeldvraag: "Welke gebruikers hebben geen abonnement?"

```sql
SELECT u.id, u.email
FROM gebruikers AS u
LEFT JOIN abonnementen AS a ON a.gebruiker_id = u.id
WHERE a.id IS NULL;
```

---

## Nieuwe stap: groeperen en filteren op groepen

### `COUNT(DISTINCT ...)`

```sql
SELECT COUNT(DISTINCT profiel_id) AS unieke_profielen_met_beoordeling
FROM beoordelingen;
```

### `GROUP BY` + `HAVING`

Vraag: "Welke gebruikers hebben 3 profielen?"

```sql
SELECT p.gebruiker_id, COUNT(*) AS aantal_profielen
FROM profielen AS p
GROUP BY p.gebruiker_id
HAVING COUNT(*) = 3
ORDER BY p.gebruiker_id;
```

---

## Opdrachten

### Opdracht 1 - Basis (`JOIN`)

Vraag: "Toon kijkgeschiedenis met profielnaam."

Schrijf zelf een `JOIN`-query met:

- tabel `kijkgeschiedenis` als hoofdtabel;
- koppeling met `profielen` via profiel-id;
- kolommen: kijkgeschiedenis-id, voornaam, achternaam, aflevering-id, gekeken-op;
- `LIMIT 20`.

Controlequery:

```sql
SELECT COUNT(*) AS aantal_rijen
FROM kijkgeschiedenis AS k
JOIN profielen AS p ON p.id = k.profiel_id;
```

### Opdracht 2 - Basis (`LEFT JOIN`)

Vraag: "Welke gebruikers hebben géén abonnement?"

Schrijf zelf een `LEFT JOIN`-query met `IS NULL` om gebruikers zonder abonnement te vinden.

Controlequery:

```sql
SELECT COUNT(*) AS aantal_zonder_abonnement
FROM gebruikers AS u
LEFT JOIN abonnementen AS a ON a.gebruiker_id = u.id
WHERE a.id IS NULL;
```

### Opdracht 3 - Verdieping (`COUNT(DISTINCT ...)`)

Vraag: "Hoeveel verschillende profielen hebben minimaal één beoordeling gegeven?"

Schrijf zelf een query met `COUNT(DISTINCT ...)` op `profiel_id` in `beoordelingen`.

Controlevraag: waarom is dit getal lager dan het totaal aantal profielen?

### Opdracht 4 - Verdieping (`HAVING`)

Vraag: "Welke gebruikers hebben precies 3 profielen?"

Schrijf zelf een query met:

- `GROUP BY gebruiker_id`
- `HAVING COUNT(*) = 3`
- sortering op `gebruiker_id`.

Controlequery:

```sql
SELECT COUNT(*) AS aantal_gebruikers_met_3_profielen
FROM (
  SELECT p.gebruiker_id
  FROM profielen AS p
  GROUP BY p.gebruiker_id
  HAVING COUNT(*) = 3
) AS t;
```

### Opdracht 5 - Debuggen

Foute query:

```sql
SELECT u.email, p.voornaam
FROM gebruikers u
JOIN profielen p
WHERE u.id = p.gebruiker_id;
```

1. Waarom is dit fout?
2. Zet de `ON` op de juiste plaats.
3. Controleer met een `COUNT(*)`.

### Opdracht 6 - Open casus (uitdaging)

**Melding van collega:**  
"Ik vermoed dat sommige beoordelingen niet te koppelen zijn aan een kijkmoment. Kun jij dat uitzoeken?"

Werk in deze volgorde en lever precies dit in:

1. **Wat weet ik al?**  
   - Eén beoordeling hoort inhoudelijk bij een gekeken aflevering.
2. **Wat moet ik uitzoeken?**  
   - Welke beoordelingen géén match hebben in `kijkgeschiedenis`.
3. **Tabellen + koppeling**  
   - `beoordelingen` en `kijkgeschiedenis`, koppeling op `profiel_id` én `aflevering_id`.
4. **Schrijf 2 query’s**  
   - Query A: lijst met probleemregels (`beoordeling_id`, `profiel_id`, `aflevering_id`, `beoordeling`).  
   - Query B: alleen het totaal aantal probleemregels.
5. **Controle en conclusie**  
   - Leg in 2-3 zinnen uit waarom dit een datakwaliteitsprobleem is.

---

## Check je begrip

1. Wanneer kies je `LEFT JOIN` in plaats van `JOIN`?
2. Waarom is `COUNT(DISTINCT ...)` soms beter dan `COUNT(*)`?
3. Wat doet `HAVING` dat `WHERE` niet kan?
4. Hoe controleer je of je koppeling logisch is?

---

## Reflectie

Bij welke JOIN-vraag moest je het langst nadenken over de `ON`-voorwaarde?

---

## Samenvatting

- Met `JOIN` combineer je tabellen via sleutelkolommen.
- Met `LEFT JOIN` kun je ook "zonder match" vinden.
- Met `GROUP BY` en `HAVING` analyseer je groepen.
- Met `COUNT(DISTINCT ...)` voorkom je dubbeltellingen.
