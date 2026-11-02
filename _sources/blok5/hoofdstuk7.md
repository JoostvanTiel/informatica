# Hoofdstuk 7: Webshopproject - basisopzet en CRUD

## Leerdoelen

In dit hoofdstuk start je met het eindproject: een mini-webshop.

Je leert:

- eisen vertalen naar een databaseontwerp;
- tabellen en relaties opzetten;
- basis-CRUD bouwen voor producten;
- gestructureerd testen tijdens het bouwen.

Aan het einde van dit hoofdstuk heb je een eerste werkende versie van je webshop.

---

## 1. Projectcontext

Je bouwt een webshop waar gebruikers producten kunnen bekijken en beheren.

Minimale onderdelen:

- productoverzicht;
- product toevoegen;
- product aanpassen;
- product verwijderen.

### Waarom is een webshop een goed project?

Een webshop laat veel leerdoelen samenkomen: databases, query's, formulieren, HTML, PHP en veiligheid. Het is dus een ideaal eindproject omdat je alle onderdelen van dit blok in een praktisch voorbeeld kunt inzetten.

In plaats van losse SQL-opdrachten te maken, ga je nu een echte applicatie bouwen met een duidelijke gebruikersdoelstelling.

---

## 2. Datamodel

Werk minimaal met:

- `users`
- `artikelen`
- `bestellingen`

Denk vooraf na over:

- primaire sleutels (`id`);
- verplichte velden;
- relaties tussen tabellen.

### Waar moet je bij het datamodel aan denken?

Je bouwt niet zomaar tabellen, maar een logische structuur. Een product heeft een naam, prijs en voorraad. Een bestelling hoort bij een gebruiker en bevat meestal meerdere producten. Als je dit goed ontwerpt, wordt het bouwen van formulieren en query's veel eenvoudiger.

### Voorbeeld van logisch nadenken

- elk product heeft een unieke `id`;
- een bestelling verwijst naar een gebruiker via een `user_id`;
- een artikel hoort bij een product en een bestelling;
- een prijs en voorraad zijn belangrijke informatie die je niet wilt missen.

Een goed datamodel is het fundament van een goed project.

### Template: Basis webshop schema

Hier zie je een compleet voorbeeld om mee te starten:

```sql
-- Tabel 1: Gebruikers
CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  voornaam VARCHAR(50) NOT NULL,
  achternaam VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  wachtwoord VARCHAR(255) NOT NULL,
  registratiedatum DATETIME DEFAULT NOW()
);

-- Tabel 2: Producten/Artikelen
CREATE TABLE artikelen (
  id INT PRIMARY KEY AUTO_INCREMENT,
  naam VARCHAR(100) NOT NULL,
  beschrijving TEXT,
  prijs DECIMAL(10, 2) NOT NULL,
  voorraad INT NOT NULL DEFAULT 0,
  gecreerddatum DATETIME DEFAULT NOW()
);

-- Tabel 3: Bestellingen
CREATE TABLE bestellingen (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  orderdatum DATETIME DEFAULT NOW(),
  totaalprijs DECIMAL(10, 2),
  status VARCHAR(50) DEFAULT 'pending',
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Tabel 4: Orderitems (koppelingenstabel voor veel-op-veel relatie)
CREATE TABLE orderitems (
  id INT PRIMARY KEY AUTO_INCREMENT,
  bestelling_id INT NOT NULL,
  artikel_id INT NOT NULL,
  hoeveelheid INT NOT NULL,
  prijs_per_stuk DECIMAL(10, 2),
  FOREIGN KEY (bestelling_id) REFERENCES bestellingen(id),
  FOREIGN KEY (artikel_id) REFERENCES artikelen(id)
);
```

**Dit voorbeeld laat zien:**
- **users**: basisgegevens van klanten
- **artikelen**: producten in je winkel
- **bestellingen**: één bestelling per klant
- **orderitems**: relatie tussen bestelling en artikel (1 bestelling = veel artikelen)

---

## 3. Bouwstrategie

Werk in deze volgorde:

1. database opzetten;
2. `READ` bouwen (overzichtspagina);
3. `CREATE` toevoegen;
4. `UPDATE` toevoegen;
5. `DELETE` toevoegen.

Zo houd je overzicht en kun je tussendoor testen.

### Waarom deze volgorde?

Je wilt kleine successen bouwen. Eerst zorg je dat je data überhaupt kunt zien. Daarna voeg je een nieuwe product toe. Daarna kun je een product aanpassen. Pas als dat werkt, kun je het verwijderen. Zo voorkom je dat je later midden in een chaos van bugs zit zonder te weten waar het probleem zit.

### Goede ontwikkelhabits

- test na elke stap;
- controleer of de juiste data terugkomt;
- maak geen enorme wijzigingen zonder tussenstop;
- neem notities van problemen die je tegenkomt.

Een project werkt het best als je het stap voor stap ontwikkelt.

### Testplan: Maak dit METEEN!

Maak nu al een testlijst met verwachtingen. Je vult die stap voor stap in:

| Functie | Actie | Verwachte uitkomst | Werkelijke uitkomst | Status |
|---------|-------|-------------------|-------------------|--------|
| READ | Data ophalen | Alle producten zichtbaar | | |
| CREATE | Nieuw product toevoegen | Nieuw product in tabel | | |
| UPDATE | Product aanpassen | Aanpassing zichtbaar | | |
| DELETE | Product verwijderen | Product weg uit tabel | | |
| Validatie | Leeg veld versturen | Foutmelding | | |

Door dit vooruit in te vullen, weet je precies wat goed moet werken!

---

## Opdrachten

Voer alle opdrachten uit in jouw database: `nimmastream_<gebruikersnaam>`.

### Opdracht 1 - Ontwerp

Maak een kort schema van je tabellen met kolommen en datatypes.

### Opdracht 2 - Basisfunctionaliteit

Bouw een productoverzicht met minimaal:

1. productnaam;
2. prijs;
3. voorraad.

### Opdracht 3 - Product toevoegen

Maak een formulier waarmee je nieuwe producten invoegt.

### Opdracht 4 - Product wijzigen en verwijderen

Voeg knoppen of links toe voor:

1. product bewerken;
2. product verwijderen (met bevestiging).

### Opdracht 5 - Kwaliteitscontrole

Maak een checklist en vink af:

- werkt elke CRUD-functie;
- kloppen foutmeldingen;
- blijft de pagina bruikbaar bij foute invoer.

---

## Check je begrip

1. Waarom begin je bij een datamodel?
2. Waarom bouw je eerst `READ` en daarna pas bewerken/verwijderen?
3. Welke velden zijn essentieel voor een product?
4. Hoe merk je dat je projectcode te rommelig wordt, en wat doe je dan?

---

## Samenvatting

- Een goed project begint met ontwerp.
- CRUD bouw je het best stapsgewijs.
- Door tussentijds te testen voorkom je veel fouten aan het einde.

## Huiswerk

Lever een eerste werkende versie op met:

- productoverzicht;
- toevoegen;
- wijzigen;
- verwijderen;
- korte notitie van wat nog ontbreekt.
