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

Stap 1 (controle):

```sql
SELECT id, gebruiker_id, status
FROM abonnementen
WHERE id = 2;
```

Stap 2 (wijzigen):

```sql
UPDATE abonnementen
SET status = 'gepauzeerd'
WHERE id = 2;
```

Stap 3 (controle):

```sql
SELECT id, gebruiker_id, status
FROM abonnementen
WHERE id = 2;
```

Hoe weet je dat je alleen deze rij hebt aangepast?

### Opdracht 2 - Basis (`DELETE`)

Vraag: "Verwijder testabonnementen van de testdatum weer."

```sql
SELECT *
FROM abonnementen
WHERE gestart_op = '2099-01-01'
ORDER BY id;
```

```sql
DELETE FROM abonnementen
WHERE gestart_op = '2099-01-01';
```

```sql
SELECT *
FROM abonnementen
WHERE gestart_op = '2099-01-01';
```

### Opdracht 3 - Verdieping (subquery)

Vraag: "Welke gebruikers hebben géén abonnement?"

```sql
SELECT id, email
FROM gebruikers
WHERE id NOT IN (
  SELECT gebruiker_id
  FROM abonnementen
)
ORDER BY id;
```

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

1. Voeg een testgebruiker toe:

```sql
INSERT INTO gebruikers (id, email, wachtwoord, land)
VALUES (9001, 'test.wees@nimmastream.com', 'tijdelijk', 'NL');
```

2. Voeg een profiel toe dat bij deze gebruiker hoort:

```sql
INSERT INTO profielen (id, gebruiker_id, voornaam, tussenvoegsel, achternaam, leeftijd_profiel, regio)
VALUES (9001, 9001, 'Test', '', 'Wees', 30, 'NH');
```

3. Verwijder daarna de gebruiker:

```sql
DELETE FROM gebruikers
WHERE id = 9001;
```

4. Controleer of het profiel nog bestaat:

```sql
SELECT *
FROM profielen
WHERE id = 9001;
```

5. Leg uit waarom dit kan zonder foreign keys.

6. Ruim op:

```sql
DELETE FROM profielen
WHERE id = 9001;
```

### Opdracht 6 - Open casus 1 (uitdaging)

**Klantmelding:**  
"Ik ben Harry Styles en ik zie geen abonnementsgegevens in mijn account."

Werk in deze volgorde:

1. Wat weet ik al?
2. Wat moet ik uitzoeken?
3. In welke tabellen zit dat?
4. Schrijf de query's.
5. Controleer en leg uit.

Startqueries:

```sql
SELECT id, email
FROM gebruikers
WHERE email = 'harry.styles@nimmastream.com';

SELECT *
FROM abonnementen
WHERE gebruiker_id = 140;
```

Los op met een `INSERT` en controleer met een nieuwe `SELECT`.

### Opdracht 7 - Open casus 2 (uitdaging)

**Oudermelding:**  
"Mijn kindprofiel heeft series gekeken die niet bij de leeftijd passen."

Werk weer in 5 stappen.

Gebruik als kernquery:

```sql
SELECT p.id,
       p.voornaam,
       p.achternaam,
       p.leeftijd_profiel,
       s.titel,
       s.kijkwijzer
FROM kijkgeschiedenis AS k
JOIN profielen AS p ON p.id = k.profiel_id
JOIN afleveringen AS a ON a.id = k.aflevering_id
JOIN series AS s ON s.id = a.serie_id
WHERE s.kijkwijzer IN ('6', '9', '12', '16', '18')
  AND CAST(s.kijkwijzer AS UNSIGNED) > p.leeftijd_profiel
ORDER BY p.id, k.gekeken_op;
```

Controlequery:

```sql
SELECT COUNT(DISTINCT p.id) AS aantal_profielen
FROM kijkgeschiedenis AS k
JOIN profielen AS p ON p.id = k.profiel_id
JOIN afleveringen AS a ON a.id = k.aflevering_id
JOIN series AS s ON s.id = a.serie_id
WHERE s.kijkwijzer IN ('6', '9', '12', '16', '18')
  AND CAST(s.kijkwijzer AS UNSIGNED) > p.leeftijd_profiel;
```

### Opdracht 8 - Open casus 3 (uitdaging)

**Interne melding:**  
"Er is kijkgeschiedenis ná een beëindigd abonnement. Hoeveel profielen zijn dat?"

Werk in 5 stappen.

```sql
SELECT COUNT(DISTINCT p.id) AS aantal_profielen
FROM profielen AS p
JOIN abonnementen AS ab ON ab.gebruiker_id = p.gebruiker_id
JOIN kijkgeschiedenis AS k ON k.profiel_id = p.id
WHERE ab.status = 'beëindigd'
  AND ab.beëindigd_op IS NOT NULL
  AND DATE(k.gekeken_op) > ab.beëindigd_op;
```

Leg uit of dit een datakwaliteitsprobleem is of een businessregel-probleem.

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
