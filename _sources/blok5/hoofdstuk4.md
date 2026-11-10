# Hoofdstuk 4: Data aanpassen en onderzoekswerk

## Leerdoelen

In dit hoofdstuk leer je:

- veilig data toevoegen met `INSERT`;
- veilig wijzigen met `UPDATE`;
- gericht verwijderen met `DELETE`;
- subqueries gebruiken;
- onderzoeken wat er gebeurt zonder foreign keys.

Je werkt als klantenservice-medewerker die echte meldingen oplost.

---

## Veiligheidsroutine (verplicht)

Voor **elke** wijziging:

1. exporteer eerst je database;
2. schrijf eerst een `SELECT` met dezelfde `WHERE`;
3. voer dan pas `INSERT`/`UPDATE`/`DELETE` uit;
4. controleer direct met een tweede `SELECT`;
5. fout gemaakt? importeer je export opnieuw.

---

## Kader: wachtwoorden en AVG

In `gebruikers.wachtwoord` staan leesbare wachtwoorden. Dat is onveilig.

In echte systemen:

- sla je nooit platte wachtwoorden op;
- gebruik je hashing (bijv. bcrypt/Argon2);
- beperk je wie die data mag zien (AVG-principe: dataminimalisatie).

Voor deze les mag je `SELECT *` gebruiken om het probleem te zien, maar noteer altijd waarom dit in productie niet mag.

---

## Voordoen en nadoen

### Voordoen (nieuw concept: `INSERT`)

Vraag: "Hoe voeg ik veilig een testabonnement toe?"

Eerst controleren:

```sql
SELECT id, email
FROM gebruikers
WHERE id = 1;

SELECT *
FROM abonnementen
WHERE gebruiker_id = 1
ORDER BY id;
```

Daarna toevoegen:

```sql
INSERT INTO abonnementen (gebruiker_id, type, status, gestart_op, beëindigd_op)
VALUES (1, 'edu', 'gepauzeerd', '2099-01-01', NULL);
```

Controle:

```sql
SELECT *
FROM abonnementen
WHERE gebruiker_id = 1
  AND type = 'edu'
  AND gestart_op = '2099-01-01';
```

### Nadoen (één verandering)

Voeg nu een testabonnement toe voor gebruiker `2` met type `basis` en dezelfde testdatum `2099-01-01`.

Controleer vooraf en achteraf op dezelfde manier.

---

## Opdrachten

### Opdracht 1 - Basis (`UPDATE`)

Vraag: "Pauzeer abonnement 2."

Schrijf zelf:

1. een controle-`SELECT` op abonnement `id = 2`;
2. een `UPDATE` die alleen deze rij aanpast;
3. een tweede controle-`SELECT`.

Hoe weet je dat je alleen deze rij hebt aangepast?

### Opdracht 2 - Basis (`DELETE`)

Vraag: "Verwijder testabonnementen van de testdatum weer."

Schrijf zelf:

1. een `SELECT` om te controleren welke rijen worden geraakt;
2. een `DELETE` met precies dezelfde `WHERE`;
3. een controle-`SELECT` na afloop.

### Opdracht 3 - Verdieping (subquery)

Vraag: "Welke gebruikers hebben géén abonnement?"

Schrijf zelf een query met `NOT IN (subquery)` op:

- hoofdtabel: `gebruikers`
- subquery: `SELECT gebruiker_id FROM abonnementen`
- sortering op `id`.

Controlequery:

```sql
SELECT COUNT(*) AS aantal
FROM gebruikers
WHERE id NOT IN (
  SELECT gebruiker_id
  FROM abonnementen
);
```

### Opdracht 4 - Debuggen

Foute query:

```sql
DELETE FROM abonnementen;
```

1. Waarom is dit gevaarlijk?
2. Schrijf een veilige versie die alleen abonnement `id = 999999` zou verwijderen.
3. Leg uit waarom die veilige versie nu 0 rijen verandert.

### Opdracht 5 - Onderzoek zonder foreign keys (wees-records)

We maken bewust een wees-record.

Gebruik deze vaste testwaarden: gebruiker-id `9001`, profiel-id `9001`.

Schrijf zelf 5 query’s:

1. `INSERT` testgebruiker;
2. `INSERT` testprofiel dat naar gebruiker 9001 verwijst;
3. `DELETE` van gebruiker 9001;
4. `SELECT` die laat zien dat profiel 9001 nog bestaat;
5. opruim-`DELETE` op profiel 9001.

Lever ook één uitlegzin: waarom kan dit zonder foreign keys?

### Opdracht 6 - Open casus 1 (uitdaging)

**Klantmelding:**  
"Ik ben Harry Styles en ik zie geen abonnementsgegevens in mijn account."

Werk in deze volgorde:

1. Wat weet ik al?
2. Wat moet ik uitzoeken?
3. In welke tabellen zit dat?
4. Schrijf de query's.
5. Controleer en leg uit.

Maak minimaal 3 query’s:

1. zoek de gebruiker op e-mailadres;
2. controleer of er een abonnement is;
3. voeg een passend abonnement toe met `INSERT` en controleer direct.

Verplicht in je eindantwoord:

- welke `gebruiker_id` je hebt gevonden;
- welke `id` van het nieuwe abonnement is aangemaakt;
- waarom jouw oplossing veilig was.

### Opdracht 7 - Open casus 2 (uitdaging)

**Oudermelding:**  
"Mijn kindprofiel heeft series gekeken die niet bij de leeftijd passen."

Werk weer in 5 stappen.

Schrijf zelf:

1. Query A (detail): toon minimaal `profiel_id`, naam, leeftijd, serietitel, kijkwijzer, kijkdatum.
2. Query B (controle): tel het aantal **verschillende** profielen met dit probleem.

Randvoorwaarden:

- koppel `kijkgeschiedenis` -> `profielen` -> `afleveringen` -> `series`;
- vergelijk alleen numerieke kijkwijzers (`6, 9, 12, 16, 18`) met profielleeftijd.

### Opdracht 8 - Open casus 3 (uitdaging)

**Interne melding:**  
"Er is kijkgeschiedenis ná een beëindigd abonnement. Hoeveel profielen zijn dat?"

Werk in 5 stappen.

Schrijf zelf:

1. Query A (detail): toon profiel-id, gebruiker-id, einddatum abonnement, kijkdatum.
2. Query B (controle): tel het aantal **verschillende** profielen.

Randvoorwaarden:

- gebruik alleen abonnementen met status `beëindigd`;
- vergelijk `DATE(gekeken_op)` met `beëindigd_op`.

Leg uit of dit een datakwaliteitsprobleem is of een businessregel-probleem.

### Opdracht 9 - Open casus 4 (uitdaging)

**Melding van collega-redactie:**  
"Sommige kijkmomenten lijken geregistreerd vóór de officiële uitzenddatum. Kun jij controleren hoeveel dat er zijn?"

Werk in 5 stappen.

Schrijf zelf:

1. Query A (detail): toon minimaal `kijkgeschiedenis.id`, `profiel_id`, `aflevering_id`, kijkdatum, uitzenddatum.
2. Query B (controle): tel het aantal probleemregels.

Randvoorwaarde:

- alleen regels waar kijkdatum **eerder** is dan uitzenddatum.

Leg uit: is dit waarschijnlijk invoerfout, timezone-issue, of testdata?

---

## Check je begrip

1. Waarom doe je vóór elke wijziging eerst een `SELECT`?
2. Wanneer is `INSERT` nodig in plaats van `UPDATE`?
3. Waarom zijn wees-records gevaarlijk?
4. Wat is het nut van subqueries in onderzoekswerk?

---

## Reflectie

Welke veiligheidsstap heeft jou deze les het meest geholpen om fouten te voorkomen?

---

## Samenvatting

- `INSERT` voegt data toe, `UPDATE` past aan, `DELETE` verwijdert.
- Veilig werken = eerst selecteren, dan pas wijzigen.
- Zonder foreign keys kun je wees-records maken.
- Met onderzoeksqueries kun je echte klantmeldingen onderbouwen.
