# Hoofdstuk 5: PHP + MySQL - gegevens tonen

## Leerdoelen

In dit hoofdstuk maak je de stap van SQL in phpMyAdmin naar SQL in een webpagina.

Je leert:

- een databaseverbinding maken in PHP;
- `SELECT`-resultaten tonen in HTML;
- invoer van een formulier verwerken;
- eenvoudige fouten herkennen en oplossen.

Aan het einde van dit hoofdstuk kun je een werkende uitleespagina bouwen die data uit de database toont.

---

## 1. Verbinding maken met de database

```php
<?php
$database = "nimmastream_<gebruikersnaam>";
$conn = new mysqli("localhost", "root", "", $database);
if ($conn->connect_error) {
    die("Verbinding mislukt: " . $conn->connect_error);
}
?>
```

Vervang `<gebruikersnaam>` door je eigen gebruikersnaam.

Zonder verbinding kun je geen query's uitvoeren. In PHP is dit het beginpunt van bijna elke database-applicatie: eerst maak je verbinding, daarna voert je SQL uit, en daarna toon je de resultaten op de pagina.

### Waarom is een verbinding nodig?

PHP draait als een server-side taal. Het kan dus niet zomaar met de database praten zonder een connectie. De `mysqli`-verbinding is als een brug tussen je webpagina en de database. Je kunt zonder deze verbinding geen data ophalen of aanpassen.

---

## 2. Resultaten tonen in HTML

```php
<?php
$result = $conn->query("SELECT voornaam, leeftijd FROM gebruikers");
while ($row = $result->fetch_assoc()) {
    echo "<p>" . $row["voornaam"] . " (" . $row["leeftijd"] . ")</p>";
}
?>
```

Een nettere variant is data tonen in een tabel (`<table>`).

### Wat gebeurt hier?

1. `query()` voert de SQL-opdracht uit.
2. `fetch_assoc()` haalt per rij een associatief array op.
3. `echo` zet de waarden om in HTML.

Je kunt dit vergelijken met: "haal de data op, zet elk record om in een begrijpelijk stukje HTML en laat het aan de gebruiker zien".

### Belangrijk verschil

- SQL bepaalt welke gegevens je ophaalt;
- PHP verwerkt die gegevens;
- HTML bepaalt hoe deze gegevens worden getoond.

Dat is een kernidee in webapplicaties: de data is niet zichtbaar zonder een opmaaklaag.

---

## 3. Formulier gebruiken als filter

Gebruik bijvoorbeeld een regiofilter via `GET`.

Stappen:

1. formulier maken;
2. waarde uitlezen uit `$_GET`;
3. query uitvoeren;
4. resultaat tonen.

### Voorbeeld van de logica

Je krijgt een vragenlijst van een gebruiker:

- "Welke regio wil je bekijken?"
- De browser stuurt die waarde door naar PHP.
- PHP gebruikt die waarde in een SQL-`WHERE`.
- De database geeft alleen de passende rijen terug.

Dat maakt een webpagina dynamisch: je kunt niet alleen static data tonen, maar ook op basis van een keuze van de gebruiker nieuwe resultaten ophalen.

---

## 4. Kwaliteitscheck voor je pagina

Controleer:

- krijg je geen witte pagina;
- zie je duidelijke foutmelding bij problemen;
- werkt je filter meerdere keren achter elkaar;
- blijft je HTML leesbaar en netjes.

### Wat is een witte pagina?

Een witte pagina betekent meestal dat er iets misgaat in de PHP-code, bijvoorbeeld een fout in de query of een probleem met de verbinding. In beeld is dat vervelend, omdat je dan niet weet waar het misgaat. Daarom is testen essentieel.

### Goede praktijk

- controleer eerst of de databaseverbinding werkt;
- test één eenvoudige query voordat je filters toevoegt;
- gebruik duidelijke variabelenamen;
- print alleen wat je echt wilt laten zien.

Dit voorkomt dat je pagina langzaam, onduidelijk of onbetrouwbaar wordt.

---

## Opdrachten

Voer alle opdrachten uit in jouw database: `nimmastream_<gebruikersnaam>`.

### Opdracht 1 - Basispagina

Maak een pagina met:

1. verbinding met jouw database (`nimmastream_<gebruikersnaam>`);
2. lijst van alle gebruikers;
3. nette titel en tussenkop.

### Opdracht 2 - Tabelweergave

Toon minimaal 3 kolommen in een HTML-tabel, bijvoorbeeld:

- voornaam;
- leeftijd;
- regio.

### Opdracht 3 - Filterformulier

Maak een formulier waarmee je op regio filtert.

### Opdracht 4 - Uitbreiding

Voeg een tweede filter toe, bijvoorbeeld op minimale leeftijd.

### Opdracht 5 - Reflectie

Leg in 5-8 zinnen uit:

1. wat doet PHP in deze opdracht;
2. wat doet SQL in deze opdracht;
3. hoe werken die samen.

---

## Check je begrip

1. Waarom moet je eerst verbinden voordat je query's kunt doen?
2. Wat is het verschil tussen SQL-resultaat en HTML-weergave?
3. Wat doet `fetch_assoc()`?
4. Waarom is testen belangrijk bij formulieren?

---

## Samenvatting

- PHP kan data ophalen uit MySQL.
- SQL bepaalt welke data je ophaalt.
- HTML bepaalt hoe je data toont aan de gebruiker.

## Huiswerk

Werk je pagina af tot een nette "gebruikersoverzicht"-pagina met:

- tabelweergave;
- minimaal één werkend filter;
- korte uitleg bovenaan de pagina.
