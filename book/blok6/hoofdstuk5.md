# Hoofdstuk 5: Sessies en Cookies

## Leerdoelen

Na dit hoofdstuk kun je:
- Sessies gebruiken om tijdelijk data op te slaan
- Cookies gebruiken om data permanent op te slaan
- Het verschil tussen sessies en cookies begrijpen
- Sessies en cookies wissen
- Data tussen pagina's doorgeven en onthouden

## Theorie

### Wat is een Sessie?

Een **sessie** is een manier om gegevens op de server op te slaan. Deze gegevens zijn beschikbaar zolang de gebruiker op je website is. Zodra de browser wordt gesloten, verdwijnt de sessie.

**Sessies zijn nuttig voor:**
- Ingelogde gebruikers onthouden
- Winkelwagentjes
- Gebruikersprefetenties (tijdelijk)

### Sessies Starten

Elke PHP-pagina die sessies wil gebruiken, moet `session_start()` bovenaan hebben:

```php
<?php
session_start();  // Dit moet ALTIJD bovenaan staan!
?>
```

### Data in Sessies Opslaan

Je kunt data opslaan in de `$_SESSION` array:

```php
<?php
session_start();

$_SESSION['gebruiker'] = "Jan";
$_SESSION['leeftijd'] = 16;
$_SESSION['is_ingelogd'] = true;
?>
```

### Data uit Sessies Lezen

```php
<?php
session_start();

echo $_SESSION['gebruiker'];  // Print: Jan
echo $_SESSION['leeftijd'];   // Print: 16
?>
```

### Sessiedata Wissen

Je kunt individuele sessiegegevens wissen:

```php
unset($_SESSION['gebruiker']);
```

Of de hele sessie:

```php
session_destroy();
```

### Wat zijn Cookies?

Een **cookie** is een kleine bestand dat op de computer van de gebruiker wordt opgeslagen. Cookies blijven bestaan totdat ze verlopen, zelfs als de browser wordt gesloten.

**Cookies zijn nuttig voor:**
- "Onthoud mij" functionaliteit
- Gebruikersprefetenties (permanent)
- Analytics
- Tracking

### Cookies Aanmaken

Cookies maak je aan met `setcookie()`:

```php
<?php
setcookie("username", "Jan");
?>
```

**BELANGRIJK:** `setcookie()` moet VÓÓR alle HTML worden aangeroepen! Dit betekent nog voor `<html>`, `<!DOCTYPE>`, en zelfs voor `echo`.

**Geldigheidsduur instellen:**

```php
<?php
// Cookie geldig voor 30 dagen
setcookie("username", "Jan", time() + (30 * 24 * 60 * 60));

// Cookie geldig voor 1 uur
setcookie("sessionid", "abc123", time() + 3600);
?>
```

### Cookies Uitlezen

Je kunt cookies uitlezen via de `$_COOKIE` array:

```php
<?php
if (isset($_COOKIE['username'])) {
    echo "Welkom terug, " . $_COOKIE['username'];
}
?>
```

### Cookies Wissen

Je kunt een cookie verwijderen door deze met een vervallen datum in te stellen:

```php
<?php
setcookie("username", "", time() - 3600);  // Verlopen!
unset($_COOKIE['username']);
?>
```

### Sessies vs. Cookies

| Kenmerk | Sessie | Cookie |
|---------|--------|--------|
| Opslaglocatie | Server | Browser |
| Duur | Tot browser sluit | Tot vervaldatum |
| Beveiliging | Veiliger | Minder veilig |
| Snelheid | Snel | Zeer snel |
| Voorraad | Beperkt | Beperkt per domein |

## Voorbeelden

### Voorbeeld 1: Login Systeem met Sessie

```php
<?php
session_start();

if (isset($_POST['login'])) {
    $gebruiker = $_POST['gebruiker'];
    $wachtwoord = $_POST['wachtwoord'];
    
    // Eenvoudige controle (normaal zou je een database gebruiken!)
    if ($gebruiker == "admin" && $wachtwoord == "geheim") {
        $_SESSION['ingelogd'] = true;
        $_SESSION['gebruiker'] = $gebruiker;
    }
    else {
        echo "<p>Foutieve gegevens!</p>";
    }
}

if (isset($_POST['logout'])) {
    session_destroy();
}

if (isset($_SESSION['ingelogd']) && $_SESSION['ingelogd'] == true) {
    echo "<p>Welkom " . $_SESSION['gebruiker'] . "!</p>";
    echo "<form action='login.php' method='post'>";
    echo "<input type='submit' name='logout' value='Uitloggen'>";
    echo "</form>";
}
else {
    echo "<form action='login.php' method='post'>";
    echo "Gebruiker: <input type='text' name='gebruiker'><br>";
    echo "Wachtwoord: <input type='password' name='wachtwoord'><br>";
    echo "<input type='submit' name='login' value='Inloggen'>";
    echo "</form>";
}
?>
```

### Voorbeeld 2: Winkelwagentje met Sessie

```php
<?php
session_start();

if (!isset($_SESSION['winkelwagen'])) {
    $_SESSION['winkelwagen'] = array();
}

if (isset($_POST['voeg_toe'])) {
    $artikel = $_POST['artikel'];
    $prijs = $_POST['prijs'];
    
    $item = array('naam' => $artikel, 'prijs' => $prijs);
    array_push($_SESSION['winkelwagen'], $item);
}

echo "<h1>Winkelwagen</h1>";

// Toon alle artikelen
$totaal = 0;
foreach ($_SESSION['winkelwagen'] as $item) {
    echo "<p>" . $item['naam'] . " - €" . $item['prijs'] . "</p>";
    $totaal += $item['prijs'];
}

echo "<p><strong>Totaal: €" . $totaal . "</strong></p>";

echo "<form action='winkelwagen.php' method='post'>";
echo "Artikel: <input type='text' name='artikel'><br>";
echo "Prijs: <input type='number' step='0.01' name='prijs'><br>";
echo "<input type='submit' name='voeg_toe' value='Toevoegen'>";
echo "</form>";
?>
```

### Voorbeeld 3: Cookie voor Terugkeren

```php
<?php
if (isset($_POST['login'])) {
    $naam = $_POST['naam'];
    
    // Onthoud voor 365 dagen
    setcookie("laatste_bezoeker", $naam, time() + (365 * 24 * 60 * 60));
    $_COOKIE['laatste_bezoeker'] = $naam;
}

if (isset($_COOKIE['laatste_bezoeker'])) {
    echo "<p>Welkom terug, " . $_COOKIE['laatste_bezoeker'] . "!</p>";
}
?>

<form action="cookie.php" method="post">
    Naam: <input type="text" name="naam"><br>
    <input type="submit" name="login" value="Opslaan">
</form>
```

### Voorbeeld 4: Thema-selectie met Cookie

```php
<?php
if (isset($_POST['thema'])) {
    setcookie("thema", $_POST['thema'], time() + (365 * 24 * 60 * 60));
    $_COOKIE['thema'] = $_POST['thema'];
}

$thema = isset($_COOKIE['thema']) ? $_COOKIE['thema'] : 'licht';

if ($thema == 'donker') {
    echo "<body style='background-color: #333; color: white;'>";
}
else {
    echo "<body style='background-color: white; color: black;'>";
}

echo "<h1>Kies je thema</h1>";

echo "<form action='thema.php' method='post'>";
echo "<input type='radio' name='thema' value='licht'> Licht<br>";
echo "<input type='radio' name='thema' value='donker'> Donker<br>";
echo "<input type='submit' value='Opslaan'>";
echo "</form>";
?>
```

## Oefeningen

### Oefening 1: Bezoekerscounter

Maak een PHP-bestand dat:
1. Telt hoeveel keer een pagina is bezocht (gebruik een cookie)
2. De pagina herlaad en kijk of het aantal omhoog gaat
3. Een "Reset" knop heeft om de teller op nul te zetten

### Oefening 2: Winkelwagen

Maak een PHP-bestand met:
1. Een lijst van producten
2. Een formulier om producten toe te voegen aan een winkelwagen (gebruik sessie)
3. Een overzicht van alle artikelen in de winkelwagen met totaalbedrag
4. Een "Kassa" knop die de winkelwagen leedt

### Oefening 3: Voorkeurverzameling

Maak een PHP-bestand dat:
1. De gebruiker vraagt om zijn lievelingskleur, eten en muziekgenre
2. Dit opslaat in een cookie
3. Bij volgende bezoek de voorkeur onthoudt en afdrukt

### Oefening 4: Login Pagina's

Maak twee PHP-bestanden:
1. `login.php` - Login formulier
2. `welkom.php` - Beveiligde pagina die alleen beschikbaar is als je ingelogd bent

Zorg dat:
- Je kunt inloggen met gebruiker "student" en wachtwoord "geheim"
- De sessie voert je naar de welkompagina
- Je kunt uitloggen en teruggaan naar de loginpagina

### Oefening 5: Vrije Opdracht - Quiz

Maak een quiz waarbij:
1. Vragen en antwoorden in sessie worden opgeslagen
2. De score wordt bijgehouden
3. Na het spel de score wordt opgeslagen in een cookie
4. Volgende keer de vorige score wordt weergegeven

