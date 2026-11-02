# Hoofdstuk 3: Afbeeldingen en Condities in PHP

## Leerdoelen

Na dit hoofdstuk kun je:

- Afbeeldingen weergeven met PHP
- If/else statements gebruiken voor verschillende acties
- If/elseif/else structures bouwen
- Condities evalueren en beslissingen nemen
- Afbeeldingen dynamisch weergeven op basis van invoer

## Theorie

### Afbeeldingen Weergeven

In PHP kun je afbeeldingen weergeven met:

```php
echo "<img src='plaatje.png' />";
```

Dit is eigenlijk gewoon HTML die door PHP wordt afgedrukt.

### If/Else Statements

Soms wil je bepaalde code alleen uitvoeren als aan een bepaalde voorwaarde is voldaan. Hiervoor gebruik je `if`.

```php
<?php
$leeftijd = 16;

if ($leeftijd >= 18) {
    echo "Je bent volwassen.";
}
else {
    echo "Je bent nog minderjarig.";
}
?>
```

### Vergelijkingsoperators

Om voorwaarden te controleren, gebruik je vergelijkingsoperators:

- `==` - Gelijk aan
- `!=` - Niet gelijk aan
- `>` - Groter dan
- `<` - Kleiner dan
- `>=` - Groter dan of gelijk aan
- `<=` - Kleiner dan of gelijk aan

```php
if ($getal == 5) { ... }
if ($naam != "Jan") { ... }
if ($prijs > 100) { ... }
```

### Logische Operators

Je kunt meerdere voorwaarden combineren:

- `&&` - EN (beide voorwaarden moeten waar zijn)
- `||` - OF (minstens één voorwaarde moet waar zijn)
- `!` - NIET (kehrt de voorwaarde om)

```php
if ($leeftijd >= 18 && $rijbewijs == true) {
    echo "Je mag rijden!";
}

if ($naam == "Jan" || $naam == "Piet") {
    echo "Welkom!";
}
```

### If/Elseif/Else

Je kunt meerdere voorwaarden achter elkaar controleren:

```php
<?php
$getal = 5;

if ($getal > 10) {
    echo "Het getal is groter dan 10";
}
elseif ($getal == 10) {
    echo "Het getal is gelijk aan 10";
}
elseif ($getal > 5) {
    echo "Het getal is groter dan 5";
}
else {
    echo "Het getal is 5 of kleiner";
}
?>
```

## Voorbeelden

### Voorbeeld 1: Dobbelsteen Werpen

```php
<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

if (isset($_POST['werp'])) {
    $worp = rand(1, 6);

    if ($worp == 1) {
        echo "<img src='img/1.png' />";
    }
    elseif ($worp == 2) {
        echo "<img src='img/2.png' />";
    }
    elseif ($worp == 3) {
        echo "<img src='img/3.png' />";
    }
    elseif ($worp == 4) {
        echo "<img src='img/4.png' />";
    }
    elseif ($worp == 5) {
        echo "<img src='img/5.png' />";
    }
    else {
        echo "<img src='img/6.png' />";
    }
}
?>

<form action="dobbelsteen.php" method="post">
    <input type="submit" name="werp" value="WERP">
</form>
```

### Voorbeeld 2: Blij of Verdrietig

```php
<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

if (isset($_POST['verzend'])) {
    $gevoel = $_POST['gevoel'];

    if ($gevoel == 'blij') {
        echo "<img src='img/happy.png' />";
        echo "<p>Super dat je blij bent!</p>";
    }
    else {
        echo "<img src='img/sad.png' />";
        echo "<p>Sterkte!</p>";
    }
}
?>

<form action="gevoel.php" method="post">
    <select name="gevoel">
        <option value="blij">Blij</option>
        <option value="verdrietig">Verdrietig</option>
    </select>
    <input type="submit" name="verzend" value="Verzenden">
</form>
```

### Voorbeeld 3: Schijnbaar Onbeperkt Aantal Keuzes

```php
<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

if (isset($_POST['dier'])) {
    $dier = $_POST['dier'];

    if ($dier == 'hond') {
        echo "<img src='img/hond.png' />";
        echo "<p>Woef woef!</p>";
    }
    elseif ($dier == 'kat') {
        echo "<img src='img/kat.png' />";
        echo "<p>Miauw!</p>";
    }
    elseif ($dier == 'vogel') {
        echo "<img src='img/vogel.png' />";
        echo "<p>Tjilp tjilp!</p>";
    }
    elseif ($dier == 'vis') {
        echo "<img src='img/vis.png' />";
        echo "<p>Blubblub!</p>";
    }
}
?>

<form action="dieren.php" method="post">
    <input type="radio" name="dier" value="hond"> Hond<br>
    <input type="radio" name="dier" value="kat"> Kat<br>
    <input type="radio" name="dier" value="vogel"> Vogel<br>
    <input type="radio" name="dier" value="vis"> Vis<br>
    <input type="submit" name="verzend" value="Toon dier">
</form>
```

### Voorbeeld 4: Leeftijdscontrole

```php
<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

if (isset($_POST['leeftijd'])) {
    $leeftijd = $_POST['leeftijd'];

    if ($leeftijd >= 18) {
        echo "<img src='img/volwassen.png' />";
        echo "<p>Welkom volwassene!</p>";
    }
    elseif ($leeftijd >= 13) {
        echo "<img src='img/tiener.png' />";
        echo "<p>Welkom tiener!</p>";
    }
    else {
        echo "<img src='img/kind.png' />";
        echo "<p>Welkom kind!</p>";
    }
}
?>

<form action="leeftijd.php" method="post">
    Wat is je leeftijd?<br>
    <input type="number" name="leeftijd">
    <input type="submit" value="Verzenden">
</form>
```

## Oefeningen

### Oefening 1: Temperatuur Feedback

Maak een PHP-bestand dat:

1. Vraagt om een temperatuur in te voeren
2. Afdrukt:
   - "Brrr, koud!" als het kleiner is dan 0°C
   - "Lekker weer!" als het tussen 0 en 25°C is
   - "Warm!" als het tussen 25 en 35°C is
   - "Heel erg warm!" als het hoger is dan 35°C

### Oefening 2: Verkeerslicht

Maak een formulier dat je laat kiezen uit rood, oranje of groen. Vertoon dan een afbeelding van een verkeerslicht (of maak zelf een eenvoudig gekleurde div) en print wat je moet doen:

- Rood: "STOP!"
- Oranje: "Voorbereiding"
- Groen: "GA!"

### Oefening 3: Speelfilm Classificatie

Maak een PHP-bestand dat naar een leeftijd vraagt en afdrukt welke films je mag kijken:

- Jonger dan 6: Geen films
- 6-12: Kinderfilms
- 12-16: PG films
- 16-18: 16+ films
- 18+: Alle films

### Oefening 4: Getal Raden (Met Afbeeldingen)

Maak een PHP-bestand dat:

1. Vraagt om een getal van 1-10
2. Genereert een willekeurig getal tussen 1-10
3. Toont een afbeelding en bericht:
   - "Gewonnen!" afbeelding als je gelijk hebt
   - "Te hoog!" afbeelding als je getal hoger is
   - "Te laag!" afbeelding als je getal lager is

### Oefening 5: Vrije Opdracht - Keuzemenu

Maak een PHP-bestand met minstens 5 verschillende keuzes (via radiobutttons of dropdown). Voor elke keuze toont je een ander afbeelding en een ander bericht. Zorg dat je minstens 5 `elseif` statements hebt.
