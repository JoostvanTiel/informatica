# Docentenblad SQL-blok (Nimmastream)

## 1. Schema-overzicht (nieuwe database)

## Tabellen en kolommen

1. `gebruikers`
   - `id` (PK)
   - `email`
   - `wachtwoord`
   - `aangemaakt_op`
   - `land`

2. `profielen`
   - `id` (PK)
   - `gebruiker_id` (index, impliciete relatie naar `gebruikers.id`)
   - `voornaam`
   - `tussenvoegsel`
   - `achternaam`
   - `leeftijd_profiel`
   - `regio`

3. `abonnementen`
   - `id` (PK, AUTO_INCREMENT)
   - `gebruiker_id` (index, impliciete relatie naar `gebruikers.id`)
   - `type` enum(`basis`,`standaard`,`premium`,`edu`)
   - `status` enum(`actief`,`gepauzeerd`,`beëindigd`)
   - `gestart_op`
   - `beëindigd_op`

4. `genres`
   - `id` (PK)
   - `naam` (UNIQUE)

5. `series`
   - `id` (PK)
   - `titel` (UNIQUE)
   - `genre_id` (index, impliciete relatie naar `genres.id`)
   - `kijkwijzer` enum(`AL`,`6`,`9`,`12`,`16`,`18`)

6. `afleveringen`
   - `id` (PK)
   - `serie_id` (index, impliciete relatie naar `series.id`)
   - `seizoen`
   - `aflevering_nummer`
   - `titel`
   - `duur_minuten`
   - `uitzend_datum`
   - UNIQUE(`serie_id`,`seizoen`,`aflevering_nummer`)

7. `kijkgeschiedenis`
   - `id` (PK, AUTO_INCREMENT)
   - `profiel_id` (index, impliciete relatie naar `profielen.id`)
   - `aflevering_id` (index, impliciete relatie naar `afleveringen.id`)
   - `gekeken_op`
   - `voltooid`

8. `beoordelingen`
   - `id` (PK, AUTO_INCREMENT)
   - `profiel_id` (index, impliciete relatie naar `profielen.id`)
   - `aflevering_id` (index, impliciete relatie naar `afleveringen.id`)
   - `beoordeling`
   - `opmerking`
   - `datum`
   - UNIQUE(`profiel_id`,`aflevering_id`)

## Impliciete relaties (geen foreign keys in schema)

- `profielen.gebruiker_id` -> `gebruikers.id`
- `abonnementen.gebruiker_id` -> `gebruikers.id`
- `series.genre_id` -> `genres.id`
- `afleveringen.serie_id` -> `series.id`
- `kijkgeschiedenis.profiel_id` -> `profielen.id`
- `kijkgeschiedenis.aflevering_id` -> `afleveringen.id`
- `beoordelingen.profiel_id` -> `profielen.id`
- `beoordelingen.aflevering_id` -> `afleveringen.id`

## Basis-aantallen (controle)

- gebruikers: **500**
- profielen: **1100**
- abonnementen: **499**
- genres: **10**
- series: **25**
- afleveringen: **1770**
- kijkgeschiedenis: **12923**
- beoordelingen: **434**

---

## 2. Gevonden anomalieën

## Bevestigd uit opdrachtomschrijving

1. `gebruikers` heeft geen `voornaam`, `leeftijd`, `regio`; die info staat in `profielen`.
2. `profielnaam` bestaat niet.
3. Genre `actie` bestaat niet.
4. `status='beëindigd'` bevat een trema (ë).
5. Regiocodes/landcodes inconsistent (`profielen.regio` gebruikt `VK`, `gebruikers.land` gebruikt `UK`).
6. Gebruiker 140 (`harry.styles@nimmastream.com`) heeft geen abonnement.
7. Abonnement 58 start en eindigt op dezelfde dag (`2025-10-23`).
8. **15** abonnementen eindigen op `2025-10-23`.
9. Serie 4 (The Witcher), seizoen 4: alle 8 afleveringen hebben titel `TBA`.
10. Profiel 971 heeft regio `BR`.
11. Alleen `abonnementen`, `beoordelingen`, `kijkgeschiedenis` hebben AUTO_INCREMENT.

## Extra gevonden (bruikbaar als casus)

1. **125** profielen hebben kijkgeschiedenis na einddatum van een beëindigd abonnement (1550 kijkregels).
2. **202** profielen keken content boven hun leeftijd (`kijkwijzer` > `leeftijd_profiel`).
3. **53** beoordelingen horen bij een profiel+aflevering-combinatie zonder kijkgeschiedenis.
4. **24** kijkmomenten liggen vóór de uitzenddatum van de aflevering.
5. `gebruikers.wachtwoord` bevat leesbare wachtwoorden; veel zwakke patronen.

## Niet gevonden

- Geen wees-records in de huidige dump (ondanks ontbreken van FK-constraints).

---

## 3. Modeluitwerkingen per hoofdstuk

> Let op: aantallen hieronder horen bij de startsituatie van de dump.  
> Na leerling-wijzigingen kunnen aantallen afwijken.

## Hoofdstuk 1

### Opdracht 1 - Basis

- `SELECT COUNT(*) FROM gebruikers;` -> **500**
- `SELECT COUNT(*) FROM profielen;` -> **1100**
- `SELECT COUNT(*) FROM abonnementen;` -> **499**
- Veelgemaakte fout: verkeerde database geselecteerd.

### Opdracht 2 - Basis

Query:

```sql
SELECT id, voornaam, achternaam, leeftijd_profiel
FROM profielen
ORDER BY leeftijd_profiel DESC, id
LIMIT 5;
```

Verwachte top 5:

1. (978, Hugo Bakker, 66)
2. (1073, Esmee Houtman, 66)
3. (51, Fatima Mulder, 65)
4. (83, Julia Kker, 65)
5. (435, Jasper Kramer, 65)

Controle: `MAX(leeftijd_profiel)` = **66**.

### Opdracht 3 - Verdieping

- `SELECT DISTINCT land FROM gebruikers ORDER BY land;` -> `BE, DE, FR, NL, UK`
- `COUNT(*) WHERE land='UK'` -> **50**

### Opdracht 4 - Debuggen

Fout: `FROM` ontbreekt.  
Herstel:

```sql
SELECT id, email, land
FROM gebruikers
ORDER BY id
LIMIT 5;
```

### Opdracht 5 - Uitdaging

- `WHERE email='harry.styles@nimmastream.com'` -> **1 rij** (id 140)
- Veelgemaakte fout: `LIKE 'harry'` zonder `%`.

---

## Hoofdstuk 2

### Opdracht 1 - Basis

- `WHERE kijkwijzer='16'` -> **9 series**
- Veelgemaakte fout: aanhalingstekens vergeten.

### Opdracht 2 - Basis

- `regio='NH' OR regio='ZH'` -> **119 profielen**
- Bij `AND` op dezelfde regio's -> **0** (logisch onmogelijk).

### Opdracht 3 - Verdieping

- `email LIKE '%harry%'` -> **1 gebruiker**

### Opdracht 4 - Verdieping

- `WHERE beëindigd_op IS NULL` -> **428 abonnementen**
- Veelgemaakte fout: `= NULL` gebruiken.

### Opdracht 5 - Debuggen 1

- Risico-uitleg: enum/tekstwaarden altijd als tekst behandelen.
- Goed:

```sql
WHERE kijkwijzer = '16'
```

### Opdracht 6 - Debuggen 2

- `status='beeindigd'` -> **0**
- `status='beëindigd'` -> **71**
- Didactische kern: exacte spelling met trema.

### Opdracht 7 - Uitdaging

- `gebruikers.land='UK'` -> **50**
- `profielen.regio='VK'` -> **103**
- Conclusie: codering is inconsistent.

---

## Hoofdstuk 3

### Opdracht 1 - Basis

- `kijkgeschiedenis JOIN profielen` -> **12923 rijen**
- Veelgemaakte fout: `ON` vergeten.

### Opdracht 2 - Basis

- `LEFT JOIN ... WHERE a.id IS NULL` -> **1 gebruiker** (id 140)

### Opdracht 3 - Verdieping

- `COUNT(DISTINCT profiel_id) FROM beoordelingen` -> **252**
- Uitleg: 252 van de 1100 profielen heeft minimaal één beoordeling.

### Opdracht 4 - Verdieping

- Gebruikers met exact 3 profielen -> **120**

### Opdracht 5 - Debuggen

Fout: `ON` ontbreekt direct na `JOIN`.  
Correct:

```sql
SELECT u.email, p.voornaam
FROM gebruikers u
JOIN profielen p ON u.id = p.gebruiker_id;
```

### Opdracht 6 - Open casus

- Beoordelingen zonder kijkmoment -> **53**
- Nakijkhulp: controleer of leerling echt op **profiel_id + aflevering_id** koppelt.

---

## Hoofdstuk 4

### Opdracht 1 - Basis

Patroon goed als leerling:

1. eerst `SELECT` op id;
2. dan `UPDATE ... WHERE id = ...`;
3. daarna controle-`SELECT`.

### Opdracht 2 - Basis

Testdata verwijderen op:

```sql
WHERE gestart_op = '2099-01-01'
```

Nakijkhulp: alleen testdata weg, geen reguliere data.

### Opdracht 3 - Verdieping (subquery)

- Gebruikers zonder abonnement (`NOT IN`) -> **1**

### Opdracht 4 - Debuggen

Kernantwoord: `DELETE FROM abonnementen;` wist alles.  
Veilig alternatief met onmogelijke id toont 0 wijzigingen.

### Opdracht 5 - Wees-records

Verwacht resultaat:

- na verwijderen gebruiker 9001 blijft profiel 9001 bestaan;
- leerling kan uitleggen: geen FK => geen referentiële bescherming.

### Opdracht 6 - Open casus 1

Start:

- `gebruiker_id=140` in abonnementen -> **0**

Na correcte `INSERT`:

- minimaal 1 rij voor gebruiker 140 zichtbaar.

### Opdracht 7 - Open casus 2

- Profielen die boven leeftijdsgrens keken -> **202**

### Opdracht 8 - Open casus 3

- Profielen met kijkgeschiedenis na einddatum beëindigd abonnement -> **125**

---

## 4. Aanbevolen database-aanpassingen (optioneel)

1. **Foreign keys toevoegen**
   - voorkomt wees-records;
   - maakt datakwaliteit beter afdwingbaar.

2. **Unieke constraint op `abonnementen.gebruiker_id`** (als businessregel 1 abonnement per gebruiker is)
   - voorkomt dubbele abonnementen per gebruiker.

3. **Normaliseer land/regio-codes**
   - kies één standaard (`UK`/`VK`).

4. **Wachtwoorden hashen**
   - vervang platte opslag door bcrypt/Argon2;
   - essentieel voor AVG en security.

5. **CHECK-constraints op logische datums**
   - bijv. `beëindigd_op >= gestart_op`;
   - helpt tegen onlogische records.

6. **CHECK op leeftijd/kijkwijzer-regels** (of validatie in applicatielaag)
   - voorkomt dat te jonge profielen te hoge kijkwijzer-content krijgen.

7. **Auditkolommen voor wijzigingen**
   - bijv. `gewijzigd_op`, `gewijzigd_door`;
   - nuttig voor onderwijs én beheer.

---

## 5. Technische noot bij deze herziening

Deze herziening is inhoudelijk gevalideerd op een lokale SQLite-kopie van de dump (geen MySQL-client beschikbaar in deze omgeving).  
Waar MySQL-specifieke syntax relevant is, is in de hoofdstukken MySQL 8-syntax aangehouden (`CURDATE()`, enum-waarden, `CAST(... AS UNSIGNED)`).
