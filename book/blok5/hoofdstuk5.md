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
$conn = new mysqli("localhost", "<gebruikersnaam>", "<wachtwoord>", $database);
if ($conn->connect_error) {
    die("Verbinding mislukt: " . $conn->connect_error);
}
?>
```

Vervang `<gebruikersnaam>` door je eigen gebruikersnaam en `<wachtwoord>` door je eigen wachtwoord. **In de rest van dit blok gaan we ervan uit dat je dit verbindingsblok bovenaan je script hebt staan!**

### Wat doet dit script stap voor stap?

1. We zetten de databasenaam in $database.
2. We maken een verbinding met MySQL en bewaren die in $conn.
3. We controleren of verbinden is gelukt.
4. Bij een fout stopt het script met die(...) en tonen we de foutmelding.

### Waarom is $conn belangrijk?

`$conn` is je verbinding-object.
Vanaf nu gebruik je dat object om met de database te praten, bijvoorbeeld met:

`$conn->query(...)` om SQL uit te voeren.

In PHP gebruik je -> om iets van een object te gebruiken:

- een eigenschap (property), zoals `$conn->connect_error`
- een methode (functie van een object), zoals `$conn->query(...)`

Zonder verbinding kun je geen query’s uitvoeren.
Bijna elke PHP-databasepagina werkt in deze volgorde: verbinden → query uitvoeren → resultaat tonen.

### Waarom is een verbinding nodig?

PHP is een taal die uitgevoerd wordt op de server (het is een server-side taal). Het kan dus niet zomaar met de database praten zonder een connectie. De `mysqli`-verbinding is als een brug tussen je webpagina en de database. Je kunt zonder deze verbinding geen data ophalen of aanpassen.

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

Hier zie je twee nieuwe methoden: `query()` en `fetch_assoc()`.

### Wat doet dit script stap voor stap?

1. `query()` voert de SQL-opdracht uit.
2. De uitkomst van de query bewaren we in `$result`.
3. Met `fetch_assoc()` halen we steeds één rij op.
4. Met `echo` tonen we die rij als HTML.

### Wat is `$result`?

`$result` is het resultaat-object van de query.  
Je kunt dit zien als een stapel rijen die uit de database komt.

### Wat doet `fetch_assoc()` precies?

`fetch_assoc()` haalt één rij op en geeft die terug als een associatieve array.  
Dat betekent: waarden met namen als sleutel, bijvoorbeeld:

```php
["voornaam" => "Joost", "leeftijd" => 36]
```

Daarom kun je schrijven:

- `$row["voornaam"]`
- `$row["leeftijd"]`

### Waarom een `while`-lus?

De `while`-lus blijft doorgaan zolang er nog een volgende rij is.  
Zo verwerk je automatisch alle rijen uit je query, niet alleen de eerste.

---

## 3. Formulier gebruiken als filter

Gebruik bijvoorbeeld een regiofilter via `POST`.

Stappen:

1. formulier maken;
2. waarde uitlezen uit `$_POST_`;
3. query uitvoeren;
4. resultaat tonen.

### Voorbeeld van de logica

Je krijgt een vragenlijst van een gebruiker:

- "Welke regio wil je bekijken?"
- De browser stuurt die waarde door naar PHP.
- PHP gebruikt die waarde in een SQL-`WHERE`.
- De database geeft alleen de passende rijen terug.

Dat maakt een webpagina dynamisch: je kunt niet alleen static data tonen, maar ook op basis van een keuze van de gebruiker nieuwe resultaten ophalen.

### **WAARSCHUWING: Invoer is onveilig zonder voorzorgen!**

Dit voorbeeld is **ONVEILIG**:

```php
$regio = $_POST['regio'];
$result = $conn->query("SELECT * FROM gebruikers WHERE regio = '$regio'");
```

Als een gebruiker intypt: `' OR '1'='1`, dan wordt je query:

```sql
SELECT * FROM gebruikers WHERE regio = '' OR '1'='1'
```

Dit toont **ALLE gebruikers**, zelfs degenen uit andere regio's! Dit heet **SQL-injectie**.

### Oplossing: Prepared statements

In het volgende hoofdstuk leer je "prepared statements" om dit veilig te maken. Die scheiden de SQL-code van gebruikersinvoer, zodat invoer niet als code wordt uitgevoerd.

**Voor nu**: Maak geen complexe formulieren met invoer in WHERE! Dit hoofdstuk is puur om SELECT te leren.

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

1. Bedenk een query die het volgende toont: alle serietitels, seizoennummer, afleveringnummer en afleveringtitel
2. Zoek op internet hoe je een tabel maakt in HTML. Schrijf dan een php script dat het resultaat van de query van opdracht 1 in een HTML-tabel toont.

### Opdracht 3 - Filterformulier

1. Maak een formulier waarin een gebruiker de regio kan invullen.
2. Schrijf een query die alle gebruikers uit een bepaalde regio ophaalt.
3. Schrijf een php script dat de input van de gebruiker gebruikt om alle gebruikers uit de ingevoerde regio op het scherm te tonen.

### Opdracht 4 - Uitbreiding

Voeg aan de vorige opdracht een minimale leeftijd als een tweede filter toe.

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
