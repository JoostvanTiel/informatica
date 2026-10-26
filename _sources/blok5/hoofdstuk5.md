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
$conn = new mysqli("localhost", "root", "", "nimmastream_2627");
if ($conn->connect_error) {
    die("Verbinding mislukt: " . $conn->connect_error);
}
?>
```

Zonder verbinding kun je geen query's uitvoeren.

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

---

## 3. Formulier gebruiken als filter

Gebruik bijvoorbeeld een regiofilter via `GET`.

Stappen:

1. formulier maken;
2. waarde uitlezen uit `$_GET`;
3. query uitvoeren;
4. resultaat tonen.

---

## 4. Kwaliteitscheck voor je pagina

Controleer:

- krijg je geen witte pagina;
- zie je duidelijke foutmelding bij problemen;
- werkt je filter meerdere keren achter elkaar;
- blijft je HTML leesbaar en netjes.

---

## Opdrachten

### Opdracht 1 - Basispagina

Maak een pagina met:

1. verbinding met database;
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
