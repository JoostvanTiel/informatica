# Hoofdstuk 1: PHP Basis - Variabelen en echo

## Leerdoelen

Na dit hoofdstuk kun je:
- Een PHP-bestand openen en sluiten
- Variabelen aanmaken en waarden toekennen
- De `echo` functie gebruiken om tekst af te drukken
- Verschil begrijpen tussen enkele en dubbele aanhalingstekens
- Strings samenvoegen met de concatenatieoperator

## Theorie

### Wat is PHP?

PHP staat voor "Hypertext Preprocessor". Het is een scripttaal die op de server wordt uitgevoerd. Dit betekent dat de PHP-code wordt verwerkt op de computer van de websitehosting, voordat de website naar je browser wordt gestuurd.

Om PHP te gebruiken, moet je bestand de extensie `.php` hebben (bijvoorbeeld: `mijnpagina.php`).

### PHP Code schrijven

PHP-code plaats je tussen de opening `<?php` en de afsluiting `?>`. Alles wat daartussen staat, wordt als PHP-code gelezen.

```php
<?php
  // Hier komt je PHP-code
?>
```

### Foutmeldingen weergeven

Van nature geeft PHP geen foutmeldingen weer op websites. Dit is voor veiligheid, maar maakt debuggen moeilijk. Om foutmeldingen te zien, voeg je aan het begin van je PHP-bestand deze regels toe:

```php
<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
?>
```

### Variabelen

Een variabele is een "bakje" waarin je een waarde kunt opslaan. Variabelen in PHP beginnen altijd met een dollarteken `$`.

```php
$naam = "Karel";
$leeftijd = 16;
$lengte = 1.75;
```

Let op: elke PHP-regel eindigt met een **puntkomma** (`;`).

### De echo functie

Om iets op het scherm af te drukken, gebruik je de `echo` functie:

```php
echo "Hallo wereld!";
```

Dit print: `Hallo wereld!`

### Enkele vs. Dubbele Aanhalingstekens

Er is een belangrijk verschil tussen enkele (`'`) en dubbele (`"`) aanhalingstekens:

**Dubbele aanhalingstekens (`"`)**: Variabelen worden vervangen door hun waarde:
```php
$naam = "Karel";
echo "Hallo $naam!";
```
Dit print: `Hallo Karel!`

**Enkele aanhalingstekens (`'`)**: Variabelen worden NIET vervangen:
```php
$naam = "Karel";
echo 'Hallo $naam!';
```
Dit print: `Hallo $naam!`

### Strings Samenvoegen

Je kunt strings samenvoegen met een **punt (`.`)**:

```php
$voornaam = "Jan";
$achternaam = "Jansen";
echo "Volledige naam: " . $voornaam . " " . $achternaam;
```

Dit print: `Volledige naam: Jan Jansen`

### Speciale Tekens

Als je een dollar-teken wil afdrukken, kan je het weghalen met een backslash:

```php
echo "Prijs: \$50";
```

Dit print: `Prijs: $50`

## Voorbeelden

### Voorbeeld 1: Eenvoudige echo

```php
<?php
echo "Welkom in PHP!";
?>
```

Output:
```
Welkom in PHP!
```

### Voorbeeld 2: Variabelen gebruiken

```php
<?php
$stad = "Amsterdam";
$land = "Nederland";

echo "Ik woon in " . $stad . ", " . $land;
?>
```

Output:
```
Ik woon in Amsterdam, Nederland
```

### Voorbeeld 3: Variabelen met dubbele aanhalingstekens

```php
<?php
$naam = "Isa";
$leeftijd = 15;

echo "Mijn naam is $naam en ik ben $leeftijd jaar oud.";
?>
```

Output:
```
Mijn naam is Isa en ik ben 15 jaar oud.
```

### Voorbeeld 4: Berekeningen in echo

```php
<?php
$aantal = 5;
$prijs = 3;

echo "Je hebt " . $aantal . " items gekocht.";
echo "Totaal: €" . ($aantal * $prijs);
?>
```

Output:
```
Je hebt 5 items gekocht.
Totaal: €15
```

## Oefeningen

### Oefening 1: Je Introduceren

Maak een PHP-bestand dat je naam, leeftijd en woonplaats afdrukt. Gebruik variabelen en echo.

**Verwachte output:**
```
Hallo, ik ben [jouw naam], ik ben [jouw leeftijd] jaar oud en ik woon in [jouw plaats].
```

### Oefening 2: Strings Samenvoegen

Maak variabelen voor voornaam en achternaam. Print dan volledige informatie zoals:
```
Voornaam: [voornaam]
Achternaam: [achternaam]
Volledige naam: [voornaam achternaam]
```

### Oefening 3: Eenvoudige Berekening

Maak variabelen voor aantal uren dat je hebt gewerkt en je uurtarief. Bereken en print het totaalbedrag.

**Verwachte output:**
```
Je hebt 8 uren gewerkt à €12,50 per uur.
Je verdient: €100,00
```

### Oefening 4: Dubbele vs. Enkele Aanhalingstekens

Maak een PHP-bestand en test het verschil tussen dubbele en enkele aanhalingstekens. Print dezelfde zin twee keer: eenmaal met dubbele en eenmaal met enkele aanhalingstekens en kijk wat het verschil is.

### Oefening 5: Vrij Opdracht

Maak een PHP-bestand dat een recept beschrijft. Gebruik minstens 5 variabelen (ingrediënten, hoeveelheden, bereidingstijd, etc.) en print het hele recept netjes geformateerd met echo.

