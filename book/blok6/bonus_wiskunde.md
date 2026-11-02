# Bonus Hoofdstuk: Wiskundige Bewerkingen in PHP

## Leerdoelen

Na dit hoofdstuk kun je:
- Wiskundige operatoren gebruiken in PHP
- Een eenvoudige rekenmachine programmeren
- Formuliergegevens als getallen verwerken
- Resultaten formatteren

## Theorie

### Wiskundige Operatoren

PHP ondersteunt verschillende wiskundige bewerkingen:

| Operator | Naam | Voorbeeld | Resultaat |
|----------|------|-----------|-----------|
| `+` | Optellen | `5 + 3` | 8 |
| `-` | Aftrekken | `5 - 3` | 2 |
| `*` | Vermenigvuldigen | `5 * 3` | 15 |
| `/` | Delen | `6 / 2` | 3 |
| `%` | Modulo (rest) | `7 % 3` | 1 |
| `**` | Macht | `2 ** 3` | 8 |

### Getallen Formatteren

Bij formulieren worden getallen vaak als strings binnenkomen. Je kunt ze omzetten naar getallen:

```php
<?php
$getal1 = floatval($_POST['getal1']);  // Omzetten naar decimal getal
$getal2 = intval($_POST['getal2']);    // Omzetten naar geheel getal
?>
```

### Wiskundige Functies

PHP heeft veel ingebouwde wiskundige functies:

```php
<?php
abs(-5);           // Absolute waarde: 5
round(3.7);        // Afronden: 4
ceil(3.2);         // Afronden omhoog: 4
floor(3.9);        // Afronden omlaag: 3
sqrt(16);          // Vierkantswortel: 4
pow(2, 3);         // Macht: 8
min(3, 5, 2);      // Kleinste: 2
max(3, 5, 2);      // Grootste: 5
?>
```

### Modulo (%)

De modulo operator geeft de rest van een deling:

```php
<?php
7 % 3;  // Geeft 1 (7 gedeeld door 3 = 2 rest 1)
10 % 4; // Geeft 2 (10 gedeeld door 4 = 2 rest 2)
?>
```

Dit is handig om te checken of een getal even of oneven is:

```php
<?php
if ($getal % 2 == 0) {
    echo "Even getal";
} else {
    echo "Oneven getal";
}
?>
```

## Voorbeelden

### Voorbeeld 1: Eenvoudige Rekenmachine

```php
<?php
if (isset($_POST['verzend'])) {
    $getal1 = floatval($_POST['getal1']);
    $getal2 = floatval($_POST['getal2']);
    $bewerking = $_POST['bewerking'];
    
    if ($bewerking == '+') {
        $antwoord = $getal1 + $getal2;
    }
    elseif ($bewerking == '-') {
        $antwoord = $getal1 - $getal2;
    }
    elseif ($bewerking == '*') {
        $antwoord = $getal1 * $getal2;
    }
    elseif ($bewerking == '/') {
        if ($getal2 != 0) {
            $antwoord = $getal1 / $getal2;
        }
        else {
            $antwoord = "Kan niet door 0 delen!";
        }
    }
    
    echo "<p>$getal1 $bewerking $getal2 = $antwoord</p>";
}
?>

<form action="rekenmachine.php" method="post">
    Getal 1: <input type="number" step="0.01" name="getal1"><br>
    
    Bewerking:<br>
    <input type="radio" name="bewerking" value="+" checked> +<br>
    <input type="radio" name="bewerking" value="-"> -<br>
    <input type="radio" name="bewerking" value="*"> *<br>
    <input type="radio" name="bewerking" value="/"> /<br>
    
    Getal 2: <input type="number" step="0.01" name="getal2"><br>
    
    <input type="submit" name="verzend" value="Bereken">
</form>
```

### Voorbeeld 2: Uitgebreide Rekenmachine

```php
<?php
if (isset($_POST['bereken'])) {
    $getal1 = floatval($_POST['getal1']);
    $getal2 = floatval($_POST['getal2']);
    $bewerking = $_POST['bewerking'];
    $antwoord = 0;
    
    switch ($bewerking) {
        case '+':
            $antwoord = $getal1 + $getal2;
            break;
        case '-':
            $antwoord = $getal1 - $getal2;
            break;
        case '*':
            $antwoord = $getal1 * $getal2;
            break;
        case '/':
            if ($getal2 != 0) {
                $antwoord = $getal1 / $getal2;
            } else {
                $antwoord = "Fout: deling door nul!";
            }
            break;
        case '**':
            $antwoord = $getal1 ** $getal2;
            break;
        case '%':
            if ($getal2 != 0) {
                $antwoord = $getal1 % $getal2;
            } else {
                $antwoord = "Fout: deling door nul!";
            }
            break;
    }
    
    echo "<h2>Uitkomst</h2>";
    echo "<p>$getal1 $bewerking $getal2 = $antwoord</p>";
}
?>

<form action="rekenmachine_uit.php" method="post">
    <h2>Rekenmachine</h2>
    Getal 1: <input type="number" step="0.01" name="getal1" required><br><br>
    
    Bewerking:<br>
    <input type="radio" name="bewerking" value="+" checked> Optellen (+)<br>
    <input type="radio" name="bewerking" value="-"> Aftrekken (-)<br>
    <input type="radio" name="bewerking" value="*"> Vermenigvuldigen (*)<br>
    <input type="radio" name="bewerking" value="/"> Delen (/)<br>
    <input type="radio" name="bewerking" value="**"> Macht (**)<br>
    <input type="radio" name="bewerking" value="%"> Modulo (%)<br><br>
    
    Getal 2: <input type="number" step="0.01" name="getal2" required><br><br>
    
    <input type="submit" name="bereken" value="Bereken">
</form>
```

### Voorbeeld 3: Even of Oneven

```php
<?php
if (isset($_POST['check'])) {
    $getal = intval($_POST['getal']);
    
    if ($getal % 2 == 0) {
        echo "<p>$getal is een EVEN getal</p>";
    }
    else {
        echo "<p>$getal is een ONEVEN getal</p>";
    }
}
?>

<form action="even_oneven.php" method="post">
    Voer een getal in: <input type="number" name="getal"><br>
    <input type="submit" name="check" value="Check">
</form>
```

### Voorbeeld 4: Oppervlakte en Omtrek

```php
<?php
if (isset($_POST['bereken'])) {
    $lengte = floatval($_POST['lengte']);
    $breedte = floatval($_POST['breedte']);
    
    $oppervlakte = $lengte * $breedte;
    $omtrek = 2 * ($lengte + $breedte);
    
    echo "<h2>Rechthoek</h2>";
    echo "<p>Lengte: " . $lengte . " meter</p>";
    echo "<p>Breedte: " . $breedte . " meter</p>";
    echo "<p>Oppervlakte: " . $oppervlakte . " m²</p>";
    echo "<p>Omtrek: " . $omtrek . " meter</p>";
}
?>

<form action="rechthoek.php" method="post">
    <h2>Rechthoek Calculator</h2>
    Lengte: <input type="number" step="0.01" name="lengte"><br>
    Breedte: <input type="number" step="0.01" name="breedte"><br>
    <input type="submit" name="bereken" value="Bereken">
</form>
```

## Oefeningen

### Oefening 1: Eenvoudige Rekenmachine

Maak een PHP-bestand met een formulier voor twee getallen en vijf bewerkingen (+, -, *, /, %). Zorg voor foutafhandeling (bijv. niet door nul delen).

### Oefening 2: Cirkelcalculator

Maak een PHP-bestand dat:
1. Vraagt om de straal van een cirkel
2. Berekent en toont:
   - Omtrek (2πr)
   - Oppervlakte (πr²)

(Gebruik `pi()` voor π)

### Oefening 3: BMI Calculator

Maak een PHP-bestand dat:
1. Vraagt om lengte (in cm) en gewicht (in kg)
2. Berekent BMI: gewicht / (lengte in meter)²
3. Toont de BMI en wat deze betekent:
   - < 18.5: Ondergewicht
   - 18.5 - 25: Normaal gewicht
   - 25 - 30: Overgewicht
   - > 30: Obesitas

### Oefening 4: Korting Calculator

Maak een PHP-bestand dat:
1. Een prijs vraagt
2. Een kortingspercentage vraagt
3. Berekent:
   - Het korting bedrag
   - De nieuwe prijs
4. Dit netjes formatteert

### Oefening 5: Vrije Opdracht - Omzekeeper

Maak een PHP-bestand voor een omzekeeping (valutaconverter) dat:
1. Vraagt om een bedrag in euro's
2. Laat kiezen tussen verschillende valuta's
3. Berekent en toont het omgerekende bedrag
4. Minimaal 3 valuta's ondersteunt

