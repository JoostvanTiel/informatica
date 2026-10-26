# Hoofdstuk 3: Relaties en JOINs

## Leerdoelen

In dit hoofdstuk leer je hoe je gegevens uit meerdere tabellen combineert.

Je leert:

- waarom databases gegevens spreiden over meerdere tabellen;
- wat een primary key en foreign key is;
- hoe je `JOIN` gebruikt om tabellen te koppelen;
- hoe je JOIN-query's logisch controleert.

Aan het einde van dit hoofdstuk kun je queries schrijven die informatie uit meerdere tabellen koppelen.

---

Gebruik in alle opdrachten jouw database:

`nimmastream_<gebruikersnaam>`

---

## 1. Waarom meerdere tabellen?

In een goede database staat niet alles in één grote tabel.

Voorbeeld:

- gebruikersgegevens in `gebruikers`
- profielgegevens in `profielen`
- abonnementen in `abonnementen`

Zo voorkom je dubbele data en houd je de structuur overzichtelijk.

---

## 2. Sleutels (keys)

- **Primary key**: unieke sleutel van een tabel (bijv. `gebruikers.id`).
- **Foreign key**: verwijzing naar een sleutel in een andere tabel (bijv. `profielen.gebruiker_id`).

Hierdoor weet de database welke records bij elkaar horen.

---

## 3. JOIN

```sql
SELECT u.voornaam, p.profielnaam
FROM gebruikers u
JOIN profielen p ON u.id = p.gebruiker_id;
```

---

## 4. JOIN met meerdere tabellen

```sql
SELECT a.titel AS aflevering, s.titel AS serie, g.naam AS genre
FROM afleveringen a
JOIN series s ON a.serie_id = s.id
JOIN genres g ON s.genre_id = g.id;
```

Met extra `JOIN`-regels kun je stap voor stap meer tabellen koppelen.

---

## 5. Veelgemaakte fouten

1. Join-voorwaarde vergeten (`ON ...`).
2. Verkeerde kolommen aan elkaar koppelen.
3. Niet controleren op dubbele rijen door 1-op-veel-relaties.
4. Kolomnamen niet verduidelijken met aliassen (`u`, `p`, `a`).

---

## Opdrachten

Voer alle opdrachten uit in jouw database: `nimmastream_<gebruikersnaam>`.

### Opdracht 1 - Basis JOINs

1. Toon profielnaam met voornaam van de gebruiker.
2. Toon gebruikersnaam met abonnementstype.
3. Toon afleveringtitel met serietitel.

### Opdracht 2 - Gericht koppelen met JOIN

Schrijf een query met `JOIN` voor:

1. gebruikers en hun profielen;
2. series en hun genres;
3. afleveringen en hun serie.

### Opdracht 3 - Drie tabellen koppelen

1. Toon serietitel, genre en kijkwijzer.
2. Toon profielnaam, gebruiker en aantal kijkmomenten.

### Opdracht 4 - Redeneren over resultaat

Bij elke query noteer je:

1. verwachte aantal rijen;
2. waarom die query logisch is;
3. welke kolommen je gebruikt om te koppelen.

### Opdracht 5 - Challenge

Schrijf een query met `JOIN` die laat zien:

1. profielnaam;
2. afleveringstitel;
3. gegeven beoordeling.

---

## Check je begrip

1. Waarom heb je bij een `JOIN` altijd een `ON`-voorwaarde nodig?
2. Waarom zijn foreign keys belangrijk?
3. Wanneer kan een JOIN dubbele rijen geven?
4. Hoe controleer je of een JOIN-resultaat klopt?

---

## Samenvatting

- Relaties maken het mogelijk om data netjes te verdelen.
- Met JOINs combineer je die data weer tot bruikbare informatie.
- Met meerdere `JOIN`-stappen kun je rijke informatie uit verschillende tabellen opbouwen.

## Huiswerk

Maak 5 JOIN-query's:

- 4x met `JOIN` tussen 2 tabellen;
- 1x met minimaal 3 tabellen.

Schrijf per query in één zin wat je ermee wilt aantonen.
