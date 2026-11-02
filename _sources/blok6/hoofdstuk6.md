# Hoofdstuk 6: Lussen in PHP

## Leerdoelen

Na dit hoofdstuk kun je:
- For-loops gebruiken voor herhalingen
- Foreach-loops gebruiken voor arrays
- While-loops gebruiken
- Geneste loops bouwen
- Arrays gebruiken met loops
- Herhaling efficiënt programmeren

## Theorie

### Waarom Loops?

Soms wil je code meerdere keren uitvoeren. In plaats van dezelfde regel tien keer te schrijven, kun je een loop gebruiken.

### De For-Loop

Een `for`-loop voert code een bepaald aantal keren uit. De syntax:

```php
for (start; voorwaarde; toename) {
    // Code die herhaald wordt
}
```

**Voorbeeld:**

```php
<?php
for ($x = 0; $x < 5; $x++) {
    echo $x . " ";
}
?>
```

Output: `0 1 2 3 4`

**Uitleg:**
- `$x = 0` - Start bij 0
- `$x < 5` - Herhaal zolang x kleiner is dan 5
- `$x++` - Voeg 1 toe aan x (++ betekent +1)

### De Foreach-Loop

Een `foreach`-loop loopt door alle elementen van een array:

```php
<?php
$fruiten = ['appel', 'banaan', 'sinaasappel'];

foreach ($fruiten as $fruit) {
    echo $fruit . "<br>";
}
?>
```

Output:
```
appel
banaan
sinaasappel
```

**Voor arrays met sleutels:**

```php
<?php
$persoon = ['naam' => 'Jan', 'leeftijd' => 16, 'stad' => 'Amsterdam'];

foreach ($persoon as $sleutel => $waarde) {
    echo $sleutel . ": " . $waarde . "<br>";
}
?>
```

Output:
```
naam: Jan
leeftijd: 16
stad: Amsterdam
```

### De While-Loop

Een `while`-loop voert code uit zolang een voorwaarde waar is:

```php
<?php
$x = 0;

while ($x < 5) {
    echo $x;
    $x++;
}
?>
```

Output: `01234`

### Arrays

Een array is een lijst met waarden:

```php
<?php
$getallen = [1, 2, 3, 4, 5];
$namen = ['Jan', 'Piet', 'Koos'];
?>
```

Je kunt elementen toevoegen:

```php
<?php
$fruiten = [];
$fruiten[] = 'appel';
$fruiten[] = 'banaan';

// Of gebruik array_push
array_push($fruiten, 'sinaasappel');
?>
```

### Geneste Loops

Je kunt loops in loops zetten:

```php
<?php
for ($i = 1; $i <= 3; $i++) {
    for ($j = 1; $j <= 3; $j++) {
        echo "(" . $i . "," . $j . ") ";
    }
    echo "<br>";
}
?>
```

Output:
```
(1,1) (1,2) (1,3)
(2,1) (2,2) (2,3)
(3,1) (3,2) (3,3)
```

## Voorbeelden

### Voorbeeld 1: Eenvoudige For-Loop

```php
<?php
echo "Aftellen:<br>";
for ($i = 10; $i >= 1; $i--) {
    echo $i . "<br>";
}
echo "Blastoff!";
?>
```

### Voorbeeld 2: Tafel van Vermenigvuldiging

```php
<?php
if (isset($_POST['verzend'])) {
    $getal = $_POST['getal'];
    
    echo "<h2>Tafel van " . $getal . "</h2>";
    
    for ($x = 1; $x <= 10; $x++) {
        $antwoord = $getal * $x;
        echo $getal . " × " . $x . " = " . $antwoord . "<br>";
    }
}
?>

<form action="tafel.php" method="post">
    Welke tafel? <input type="number" name="getal"><br>
    <input type="submit" name="verzend" value="Toon">
</form>
```

### Voorbeeld 3: Alle Tafels Met Foreach

```php
<?php
$tafels = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

foreach ($tafels as $tafel) {
    echo "<h3>Tafel van " . $tafel . "</h3>";
    
    for ($x = 1; $x <= 10; $x++) {
        echo $tafel . " × " . $x . " = " . ($tafel * $x) . "<br>";
    }
}
?>
```

### Voorbeeld 4: Naam Verzamelen en Tonen

```php
<?php
session_start();

if (isset($_POST['voeg_toe'])) {
    if (!isset($_SESSION['namen'])) {
        $_SESSION['namen'] = [];
    }
    
    $naam = $_POST['naam'];
    array_push($_SESSION['namen'], $naam);
}

echo "<h1>Namen</h1>";

echo "<form action='namen.php' method='post'>";
echo "Voeg naam toe: <input type='text' name='naam'><br>";
echo "<input type='submit' name='voeg_toe' value='Voeg toe'>";
echo "</form>";

if (isset($_SESSION['namen']) && count($_SESSION['namen']) > 0) {
    echo "<h2>Alle namen:</h2>";
    echo "<ol>";
    
    foreach ($_SESSION['namen'] as $naam) {
        echo "<li>" . $naam . "</li>";
    }
    
    echo "</ol>";
}
?>
```

### Voorbeeld 5: Tafelkalender (Geneste Loops)

```php
<?php
echo "<table border='1' cellpadding='10'>";
echo "<tr>";
for ($dag = 1; $dag <= 7; $dag++) {
    echo "<th>Dag " . $dag . "</th>";
}
echo "</tr>";

$nummer = 1;
for ($week = 1; $week <= 4; $week++) {
    echo "<tr>";
    for ($dag = 1; $dag <= 7; $dag++) {
        echo "<td>" . $nummer . "</td>";
        $nummer++;
    }
    echo "</tr>";
}
echo "</table>";
?>
```

### Voorbeeld 6: Scores Invoeren en Gemiddelde Berekenen

```php
<?php
if (isset($_POST['berekening'])) {
    $scores = [
        floatval($_POST['score1']),
        floatval($_POST['score2']),
        floatval($_POST['score3']),
        floatval($_POST['score4'])
    ];
    
    $totaal = 0;
    foreach ($scores as $score) {
        $totaal += $score;
    }
    
    $gemiddelde = $totaal / count($scores);
    
    echo "<h2>Resulten</h2>";
    echo "<p>Scores: ";
    foreach ($scores as $score) {
        echo $score . " ";
    }
    echo "</p>";
    echo "<p>Gemiddelde: " . round($gemiddelde, 2) . "</p>";
}
?>

<form action="scores.php" method="post">
    <h2>Voer je scores in:</h2>
    Score 1: <input type="number" step="0.1" name="score1"><br>
    Score 2: <input type="number" step="0.1" name="score2"><br>
    Score 3: <input type="number" step="0.1" name="score3"><br>
    Score 4: <input type="number" step="0.1" name="score4"><br>
    <input type="submit" name="berekening" value="Bereken">
</form>
```

## Oefeningen

### Oefening 1: Tafels van Vermenigvuldiging

Maak een PHP-bestand dat vragen om een getal en toont vervolgens de tafel van 1 tot 10.

### Oefening 2: Sterren Patroon

Maak een PHP-bestand dat vraagt om een getal en toont vervolgens een sterrenpatroon (geneste loop):

```
*
**
***
****
*****
```

### Oefening 3: Alle Tafels

Maak een PHP-bestand dat alle tafels van 1 tot 10 weergeeft. Maak er iets moois van met HTML-tabel.

### Oefening 4: Fruit Verzamelen

Maak een PHP-bestand dat:
1. Een formulier toont om fruitnamen in te voeren
2. Dit opslaat in een array (gebruik sessie)
3. Alle ingevoerde fruitnamen in een lijst toont met foreach
4. De totaal aantal fruiten telt

### Oefening 5: Priemgetallen

Maak een PHP-bestand dat vraagt om een getal en toont vervolgens alle priemgetallen tot dat getal.

**Tip:** Een priemgetal is alleen deelbaar door 1 en zichzelf.

### Oefening 6: Vrije Opdracht - Tabel Generator

Maak een PHP-bestand dat:
1. Vraagt hoeveel rijen en kolommen
2. Een HTML-tabel genereert met nummers (1, 2, 3, ...)
3. Geneste loops gebruikt
4. De tabel mooi formateert

