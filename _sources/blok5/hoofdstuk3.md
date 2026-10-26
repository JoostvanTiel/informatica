# Hoofdstuk 3: Relaties en JOINs

## Leerdoelen

In dit hoofdstuk leer je hoe je gegevens uit meerdere tabellen combineert.

Je leert:

- waarom databases gegevens spreiden over meerdere tabellen;
- wat een primary key en foreign key is;
- wanneer je `INNER JOIN` gebruikt;
- wanneer je `LEFT JOIN` gebruikt;
- hoe je JOIN-query's logisch controleert.

Aan het einde van dit hoofdstuk kun je queries schrijven die informatie uit meerdere tabellen koppelen.

---

## Lesopbouw (45-60 minuten)

1. **Uitleg relaties + schema (10-15 min)**
2. **JOIN-demo in stappen (10-15 min)**
3. **Oefenen in tweetallen (20 min)**
4. **Nabespreking (10 min)**

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

## 3. INNER JOIN

Gebruik `INNER JOIN` als je alleen records wilt zien die in beide tabellen bestaan.

```sql
SELECT u.voornaam, p.profielnaam
FROM gebruikers u
INNER JOIN profielen p ON u.id = p.gebruiker_id;
```

---

## 4. LEFT JOIN

Gebruik `LEFT JOIN` als je alle records uit de linker tabel wilt tonen, ook zonder match.

```sql
SELECT u.voornaam, a.type
FROM gebruikers u
LEFT JOIN abonnementen a ON u.id = a.gebruiker_id;
```

Als er geen match is, krijg je `NULL` in kolommen van de rechter tabel.

---

## 5. Veelgemaakte fouten

1. Join-voorwaarde vergeten (`ON ...`).
2. Verkeerde kolommen aan elkaar koppelen.
3. Verwachten dat `INNER JOIN` ook niet-gematchte rijen toont.
4. Niet controleren op dubbele rijen door 1-op-veel-relaties.

---

## Opdrachten

### Opdracht 1 - Basis JOINs

1. Toon profielnaam met voornaam van de gebruiker.
2. Toon gebruikersnaam met abonnementstype.
3. Toon afleveringtitel met serietitel.

### Opdracht 2 - INNER of LEFT?

Maak per vraag eerst een voorspelling: gebruik je `INNER JOIN` of `LEFT JOIN`?

1. Alle gebruikers met eventueel abonnement.
2. Alleen gebruikers die een profiel hebben.
3. Alle genres met eventueel series.

### Opdracht 3 - Drie tabellen koppelen

1. Toon serietitel, genre en kijkwijzer.
2. Toon profielnaam, gebruiker en aantal kijkmomenten.

### Opdracht 4 - Redeneren over resultaat

Bij elke query noteer je:

1. verwachte aantal rijen;
2. waarom die query logisch is;
3. welke kolommen je gebruikt om te koppelen.

### Opdracht 5 - Challenge

Schrijf een query die profielen toont zonder beoordelingen (tip: `LEFT JOIN` + `IS NULL`).

---

## Check je begrip

1. Wat is het verschil tussen `INNER JOIN` en `LEFT JOIN`?
2. Waarom zijn foreign keys belangrijk?
3. Wanneer kan een JOIN dubbele rijen geven?
4. Hoe controleer je of een JOIN-resultaat klopt?

---

## Samenvatting

- Relaties maken het mogelijk om data netjes te verdelen.
- Met JOINs combineer je die data weer tot bruikbare informatie.
- `INNER JOIN` geeft alleen matches, `LEFT JOIN` behoudt alle rijen links.

## Huiswerk

Maak 5 JOIN-query's:

- 2x `INNER JOIN`;
- 2x `LEFT JOIN`;
- 1x met minimaal 3 tabellen.

Schrijf per query in één zin wat je ermee wilt aantonen.
