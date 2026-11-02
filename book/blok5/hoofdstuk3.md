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

In een goede database staat niet alles in één grote tabel. Dat is onoverzichtelijk en vaak onnodig dupliceren van gegevens. In een relationele database splitst men informatie logisch op in verschillende tabellen.

Voorbeeld:

- gebruikersgegevens in `gebruikers`
- profielgegevens in `profielen`
- abonnementen in `abonnementen`

Zo voorkom je dubbele data en houd je de structuur overzichtelijk. Als een gebruiker bijvoorbeeld meerdere profielen kan hebben, dan hoort dat niet in één grote tabel te staan. Het is veel beter om elke groep informatie op een logische plek te bewaren.

### Waarom is dat slim?

- je hoeft gegevens niet meerdere keren op te slaan;
- je kunt dezelfde informatie op verschillende manieren gebruiken;
- je kunt grote datasets beter beheren;
- je kunt tabellen aan elkaar koppelen met relaties.

De kern van relationele databases is: gegevens opsplitsen, maar later weer samenbrengen wanneer je er iets mee wilt doen.

---

## 2. Sleutels (keys)

Een sleutel is een veld of combinatie van velden die een tabel uniek maakt of laat koppelen.

- **Primary key**: unieke sleutel van een tabel (bijv. `gebruikers.id`).
- **Foreign key**: verwijzing naar een sleutel in een andere tabel (bijv. `profielen.gebruiker_id`).

Hierdoor weet de database welke records bij elkaar horen.

### Voorbeeld

`gebruikers.id` is bijvoorbeeld `12`. In `profielen` staat dan vaak `gebruiker_id = 12`. Dat betekent: "Dit profiel hoort bij gebruiker 12". Zonder deze koppeling weet de database niet welke gegevens bij elkaar horen.

### Waarom zijn sleutels zo belangrijk?

Zonder primaire en vreemde sleutels kun je geen betrouwbare relaties opbouwen. Dan ontstaat snel chaos: je ziet wel data, maar je weet niet welke regels erbij horen.

---

## 3. JOIN

Met een `JOIN` combineer je gegevens uit meerdere tabellen. Je koppelt de tabellen aan elkaar op basis van een gemeenschappelijk veld.

```sql
SELECT u.voornaam, p.profielnaam
FROM gebruikers u
JOIN profielen p ON u.id = p.gebruiker_id;
```

### Wat gebeurt hier?

- `gebruikers u` = tabel gebruikers, met alias `u`
- `profielen p` = tabel profielen, met alias `p`
- `ON u.id = p.gebruiker_id` = koppeling tussen gebruiker en profiel

Het resultaat is een lijst met de voornaam van de gebruiker en de naam van zijn profiel.

### Waarom is `ON` zo belangrijk?

De `ON`-voorwaarde vertelt SQL precies welke rijen met elkaar moeten worden gekoppeld. Als je die mist, weet SQL niet hoe de tabellen samenhangen.

---

## 4. JOIN met meerdere tabellen

```sql
SELECT a.titel AS aflevering, s.titel AS serie, g.naam AS genre
FROM afleveringen a
JOIN series s ON a.serie_id = s.id
JOIN genres g ON s.genre_id = g.id;
```

Met extra `JOIN`-regels kun je stap voor stap meer tabellen koppelen. Je kunt dit zien als een keten: aflevering hoort bij serie, en serie hoort bij genre.

### Denk in stappen

1. Koppel aflevering aan serie.
2. Koppel serie aan genre.
3. Toon de relevante informatie uit alle drie de tabellen.

Dat is precies hoe een relationele database werkt: informatie wordt in kleine stukjes opgeslagen, maar bij een vraag weer samengevoegd.

---

## 5. Veelgemaakte fouten

1. Join-voorwaarde vergeten (`ON ...`).
2. Verkeerde kolommen aan elkaar koppelen.
3. Niet controleren op dubbele rijen door 1-op-veel-relaties.
4. Kolomnamen niet verduidelijken met aliassen (`u`, `p`, `a`).

### Extra aandachtspunt: dubbele rijen

Bij een `JOIN` kunnen dubbele resultaten ontstaan als een tabel meerdere passende records heeft. Bijvoorbeeld: één gebruiker kan meerdere profielen hebben. Als je dan niet goed nadenkt over je koppeling, kun je dezelfde gebruiker meerdere keren zien.

### Praktische vuistregel

Controleer altijd of je op de juiste sleutel koppelt. Het antwoord moet logisch zijn: "Is dit echt dezelfde record die ik bedoel?"

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

### Opdracht 4 - Controleren of je JOIN klopt

Dit is de meest lastige opdrachttype. Volg deze aanpak:

**Stap 1: Schrijf de query**

```sql
SELECT u.voornaam, p.profielnaam
FROM gebruikers u
JOIN profielen p ON u.id = p.gebruiker_id;
```

**Stap 2: Voordat je de query uitvoert, denk vooruit:**

"Hoeveel rijen verwacht ik?"

Kijk in je hoofd na welke gebruiker hoeveel profielen hebben:

- Gebruiker 1 (Jan) → 2 profielen
- Gebruiker 2 (Peter) → 1 profiel
- Gebruiker 3 (Roos) → 3 profielen
- → Totaal verwacht: 2+1+3 = **6 rijen**

**Stap 3: Voer de query uit**

Resultaat:

```
voornaam | profielnaam
---------|------------
Jan      | Kinderprofiel
Jan      | Volwassenen
Peter    | Favorieten
Roos     | Profiel1
Roos     | Profiel2
Roos     | Profiel3
```

**Stap 4: Controleer kritisch**

- ✅ Aantal rijen klopt (6 verwacht, 6 gekregen)
- ✅ Dezelfde voornaam verschijnt meermaals (logisch: 1 gebruiker met meerdere profielen)
- ✅ Koppeling klopt (Jan's profielen zijn werkelijk van Jan)

**Mogelijke problemen die je zo opspoort:**

- ❌ Aantal rijen veel hoger (10+)? Misschien fout in ON-voorwaarde
- ❌ Lege tabel? Misschien geen data in ene tabel, of ON-voorwaarde kan niets matchen
- ❌ Rij van Jan en Peter gemixed? ON-voorwaarde waarschijnlijk fout

Voer deze controlestappen uit bij elk van deze queries en noteer je verwachting versus werkelijke uitkomst.

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
