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

## Lesopbouw (45-60 minuten)

1. **Projectuitleg en eisen (10 min)**
2. **Ontwerpen (10-15 min)**
3. **Bouwen (20-25 min)**
4. **Testen en bijsturen (10 min)**

---

## 1. Projectcontext

Je bouwt een webshop waar gebruikers producten kunnen bekijken en beheren.

Minimale onderdelen:

- productoverzicht;
- product toevoegen;
- product aanpassen;
- product verwijderen.

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

---

## 3. Bouwstrategie

Werk in deze volgorde:

1. database opzetten;
2. `READ` bouwen (overzichtspagina);
3. `CREATE` toevoegen;
4. `UPDATE` toevoegen;
5. `DELETE` toevoegen.

Zo houd je overzicht en kun je tussendoor testen.

---

## Opdrachten

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
