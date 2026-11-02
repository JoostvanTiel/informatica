# Hoofdstuk 4: Willekeurige Getallen en Raadspelletjes

## Leerdoelen

Na dit hoofdstuk kun je:
- De `rand()` functie gebruiken om willekeurige getallen te genereren
- Een raadspelletje programmeren
- Gebruikersinvoer vergelijken met gegenereerde waarden
- Feedback geven ("hoger" of "lager")
- Sessies gebruiken om data tussen pagina's op te slaan

## Theorie

### Willekeurige Getallen Met rand()

In PHP kun je willekeurige getallen genereren met de functie `rand()`. Je geeft een minimum en maximum waarde op:

```php
<?php
$getal = rand(1, 10);  // Geeft een willekeurig getal tussen 1 en 10
echo $getal;
?>
```

Dit genereert elke keer een ander getal.

### Raadspelletje Bouwen

Een eenvoudig raadspelletje kun je maken door:
1. Een willekeurig getal te genereren
2. De gebruiker te vragen een getal in te voeren
3. Het ingevoerde getal te vergelijken met het gegenereerde getal
4. Feedback te geven

### Sessies Gebruiken

Soms moet je informatie onthouden tussen verschillende pagina's. Daarvoor kun je sessies gebruiken. Een sessie start je met `session_start()`:

```php
<?php
session_start();
$_SESSION['geheim_getal'] = 7;
?>
```

In een ander PHP-bestand kun je deze waarde weer uitlezen:

```php
<?php
session_start();
echo $_SESSION['geheim_getal'];  // Print: 7
?>
```

**Let op:** `session_start()` moet altijd BOVENAAN je PHP-bestand staan, nog voor alle HTML!

### Sessies Wissen

Je kunt een sessie sluiten met `session_destroy()`:

```php
<?php
session_start();
session_destroy();
?>
```

## Voorbeelden

### Voorbeeld 1: Eenvoudige Dobbelsteen

```php
<?php
if (isset($_POST['werp'])) {
    $getal = rand(1, 6);
    echo "<p>Je hebt geworpen: $getal</p>";
}
?>

<form action="dobbelsteen.php" method="post">
    <input type="submit" name="werp" value="Gooi dobbelsteen">
</form>
```

### Voorbeeld 2: Raadspelletje - Hoger Lager (1 kans)

```php
<?php
session_start();

if (isset($_POST['start'])) {
    $_SESSION['geheim'] = rand(1, 10);
    $_SESSION['guess'] = false;
}

if (isset($_POST['gok'])) {
    $gok = $_POST['getal'];
    $geheim = $_SESSION['geheim'];
    
    if ($gok == $geheim) {
        echo "<p>JE HEBT GEWONNEN! Het getal was $geheim!</p>";
        $_SESSION['guess'] = true;
    }
    elseif ($gok > $geheim) {
        echo "<p>FOUT! Het getal is LAGER dan $gok.</p>";
    }
    else {
        echo "<p>FOUT! Het getal is HOGER dan $gok.</p>";
    }
}

if (!isset($_SESSION['guess']) || $_SESSION['guess'] == false) {
    echo "<form action='raden.php' method='post'>";
    echo "Raad een getal tussen 1 en 10:<br>";
    echo "<input type='number' name='getal' min='1' max='10'><br>";
    echo "<input type='submit' name='gok' value='Gok!'><br>";
    echo "<input type='submit' name='start' value='Nieuw spel'>";
    echo "</form>";
}
?>
```

### Voorbeeld 3: Raadspelletje - Hoger Lager (Onbeperkt)

```php
<?php
session_start();
ini_set('display_errors', 1);
error_reporting(E_ALL);

// Start nieuw spel
if (isset($_POST['start'])) {
    $_SESSION['geheim'] = rand(1, 100);
    $_SESSION['pogingen'] = 0;
}

$bericht = "";
$gewonnen = false;

// Verwerk gok
if (isset($_POST['gok'])) {
    $gok = $_POST['getal'];
    $_SESSION['pogingen']++;
    
    if ($gok == $_SESSION['geheim']) {
        $bericht = "JE HEBT GEWONNEN in " . $_SESSION['pogingen'] . " pogingen!";
        $gewonnen = true;
    }
    elseif ($gok > $_SESSION['geheim']) {
        $bericht = "Het getal is LAGER dan $gok. (Poging " . $_SESSION['pogingen'] . ")";
    }
    else {
        $bericht = "Het getal is HOGER dan $gok. (Poging " . $_SESSION['pogingen'] . ")";
    }
}

// Toon spel
echo "<h1>Raad het getal!</h1>";
echo "<p>Ik denk aan een getal tussen 1 en 100. Kun je het raden?</p>";

if ($bericht != "") {
    echo "<p><strong>$bericht</strong></p>";
}

if (!$gewonnen) {
    echo "<form action='raden_onbeperkt.php' method='post'>";
    echo "Je gok: <input type='number' name='getal' min='1' max='100'><br>";
    echo "<input type='submit' name='gok' value='Gok!'><br>";
    echo "</form>";
}

echo "<form action='raden_onbeperkt.php' method='post'>";
echo "<input type='submit' name='start' value='Nieuw spel'>";
echo "</form>";
?>
```

### Voorbeeld 4: Dobbelsteen Gooien (Memory)

```php
<?php
session_start();

if (isset($_POST['reset'])) {
    session_destroy();
    session_start();
}

if (!isset($_SESSION['geworpen'])) {
    $_SESSION['geworpen'] = array();
}

if (isset($_POST['werp'])) {
    $getal = rand(1, 6);
    array_push($_SESSION['geworpen'], $getal);
}
?>

<h1>Dobbelsteen Gooien</h1>

<?php
if (isset($_SESSION['geworpen']) && count($_SESSION['geworpen']) > 0) {
    echo "<p>Je worpen: ";
    foreach ($_SESSION['geworpen'] as $worp) {
        echo $worp . " ";
    }
    echo "</p>";
    echo "<p>Totaal: " . array_sum($_SESSION['geworpen']) . "</p>";
}
?>

<form action="dobbelsteenmemory.php" method="post">
    <input type="submit" name="werp" value="Gooi dobbelsteen">
    <input type="submit" name="reset" value="Reset">
</form>
```

## Oefeningen

### Oefening 1: Getal Raden (1 Kans)

Maak een PHP-bestand dat:
1. Een willekeurig getal tussen 1-20 genereert
2. Vraagt de gebruiker om te raden
3. Zegt of het getal juist of fout is

### Oefening 2: Getal Raden (Hoger/Lager)

Maak een PHP-bestand dat:
1. Een willekeurig getal tussen 1-50 genereert
2. De gebruiker laat raden
3. Zegt "HOGER" of "LAGER" als het fout is
4. Telt hoeveel pogingen nodig waren
5. Gebruik sessies om het getal tussen inzendingen te onthouden

### Oefening 3: Meer Pogingen Tellen

Bouw voort op oefening 2. Tel nu hoeveel pogingen de gebruiker nodig had en geef een score:
- 1-3 pogingen: Incredible!
- 4-6 pogingen: Goed!
- 7+ pogingen: Volgende keer beter!

### Oefening 4: Dobbelstenen Verzamelen

Maak een PHP-bestand dat:
1. Elke keer een dobbelsteen geworpen kan worden (1-6)
2. Alle worpen opslaat in een sessie
3. Na elke worp het totaal toont
4. Een "Reset" knop heeft om opnieuw te beginnen

### Oefening 5: Vrije Opdracht - Memory Game

Maak een eenvoudig geheugenspel waar:
1. De computer genereert een reeks getallen (bijvoorbeeld: 3, 5, 2)
2. Deze toont aan de speler
3. De speler moet deze reeks invoeren
4. De reeks wordt langer naarmate het spel voortschrijdt
5. Gebruik sessies om de reeks op te slaan

