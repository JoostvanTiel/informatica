# Hoofdstuk 2: HTML Formulieren met PHP

## Leerdoelen

Na dit hoofdstuk kun je:
- HTML formulieren maken
- Formuliergegevens opvangen met `$_POST` in PHP
- Controleren of formuliergegevens ingevuld zijn met `isset()`
- Gebruikersinvoer valideren en verwerken
- Formulieren interactief maken

## Theorie

### HTML Formulieren

Een HTML formulier wordt gebruikt om gebruikersinput op te vragen. Dit formulier stuurt de gegevens naar een PHP-bestand waar ze verwerkt kunnen worden.

Dit is de basis van een formulier:

```html
<form action="verwerk.php" method="post">
  <input type="text" name="voornaam">
  <input type="submit" value="Verzenden">
</form>
```

**Belangrijk:**
- `action`: Dit is het PHP-bestand dat de gegevens zal verwerken
- `method="post"`: Dit betekent dat de gegevens via POST worden verstuurd (veilig voor gevoelige data)
- `name`: Dit is de naam van het inputveld. Deze naam gebruik je in PHP om de waarde op te halen

### Gegevens Uitlezen in PHP

Alle gegevens die via een formulier met `method="post"` worden verzonden, kun je uitlezen met de `$_POST` variabele.

```php
<?php
$voornaam = $_POST['voornaam'];
?>
```

### Controleren of Gegevens Ingevuld Zijn

Je kunt controleren of een formulier is ingevuld met de `isset()` functie. Deze functie geeft `true` terug als een variabele een waarde heeft:

```php
<?php
if (isset($_POST['voornaam'])) {
    $voornaam = $_POST['voornaam'];
    echo "Hallo " . $voornaam;
}
?>
```

### Meerdere Velden in een Formulier

Je kunt meerdere inputvelden in een formulier zetten:

```html
<form action="verwerk.php" method="post">
  <input type="text" name="voornaam" placeholder="Voornaam">
  <input type="text" name="achternaam" placeholder="Achternaam">
  <input type="number" name="leeftijd" placeholder="Leeftijd">
  <input type="submit" value="Verzenden">
</form>
```

In PHP haal je alle waarden op:

```php
<?php
if (isset($_POST['voornaam']) && isset($_POST['achternaam']) && isset($_POST['leeftijd'])) {
    $voornaam = $_POST['voornaam'];
    $achternaam = $_POST['achternaam'];
    $leeftijd = $_POST['leeftijd'];
    
    echo "$voornaam $achternaam is $leeftijd jaar oud.";
}
?>
```

### Verschillende Inputtypes

PHP kan met veel verschillende inputtypes werken:

- `type="text"` - Normale tekstinput
- `type="email"` - E-mailadres
- `type="number"` - Getal
- `type="date"` - Datum
- `type="password"` - Verborgen wachtwoord
- `type="radio"` - Radiobuttons (één keuze)
- `type="checkbox"` - Checkboxes (meerdere keuzes)
- `type="select"` - Dropdown menu

## Voorbeelden

### Voorbeeld 1: Eenvoudig Formulier

**HTML:**
```html
<form action="groet.php" method="post">
  <input type="text" name="naam">
  <input type="submit" value="Begroet me!">
</form>
```

**PHP (groet.php):**
```php
<?php
if (isset($_POST['naam'])) {
    $naam = $_POST['naam'];
    echo "Hallo $naam, welkom!";
}
?>
```

### Voorbeeld 2: Persoonlijke Informatie

**HTML:**
```html
<form action="persoon.php" method="post">
  Voornaam: <input type="text" name="voornaam"><br>
  Achternaam: <input type="text" name="achternaam"><br>
  Leeftijd: <input type="number" name="leeftijd"><br>
  <input type="submit" value="Verzenden">
</form>
```

**PHP (persoon.php):**
```php
<?php
if (isset($_POST['voornaam']) && isset($_POST['achternaam']) && isset($_POST['leeftijd'])) {
    $voornaam = $_POST['voornaam'];
    $achternaam = $_POST['achternaam'];
    $leeftijd = $_POST['leeftijd'];
    
    echo "<p>Voornaam: $voornaam</p>";
    echo "<p>Achternaam: $achternaam</p>";
    echo "<p>Leeftijd: $leeftijd jaar</p>";
}
?>
```

### Voorbeeld 3: Keuze met Radiobuttons

**HTML:**
```html
<form action="lievelingskleur.php" method="post">
  Wat is je lievelingskleur?<br>
  <input type="radio" name="kleur" value="rood"> Rood<br>
  <input type="radio" name="kleur" value="blauw"> Blauw<br>
  <input type="radio" name="kleur" value="groen"> Groen<br>
  <input type="submit" value="Verzenden">
</form>
```

**PHP (lievelingskleur.php):**
```php
<?php
if (isset($_POST['kleur'])) {
    $kleur = $_POST['kleur'];
    echo "Je lievelingskleur is: " . ucfirst($kleur);
}
?>
```

### Voorbeeld 4: Formulier op Dezelfde Pagina

**HTML en PHP (zelfverwerkend.php):**
```php
<?php
$bericht = "";
if (isset($_POST['verzend'])) {
    $voornaam = $_POST['voornaam'];
    $email = $_POST['email'];
    $bericht = "Bedankt $voornaam, we nemen contact op via $email";
}
?>

<form action="zelfverwerkend.php" method="post">
  Voornaam: <input type="text" name="voornaam"><br>
  Email: <input type="email" name="email"><br>
  <input type="submit" name="verzend" value="Verzenden">
</form>

<?php
if ($bericht != "") {
    echo "<p>" . $bericht . "</p>";
}
?>
```

## Oefeningen

### Oefening 1: Eenvoudig Contactformulier

Maak een HTML-formulier met een naam en een emailadres. Maak een PHP-bestand dat de gegevens verwerkt en afdrukt: "Bedankt [naam], we zullen je contacteren op [email]".

### Oefening 2: Keuzes met Radio Buttons

Maak een formulier waar de gebruiker kan kiezen uit 3 dingen (bijvoorbeeld: Automatisch, Fiets, Te voet). Verwerk de keuze in PHP en print welke optie is gekozen.

### Oefening 3: Formulier met Dropdown

Maak een formulier met een dropdown menu met daarop landen. Laat de gebruiker een land kiezen en print: "[Gebruikersnaam] heeft [land] gekozen."

**Tip:** Voor een dropdown gebruik je:
```html
<select name="land">
  <option value="nederland">Nederland</option>
  <option value="belgië">België</option>
  <option value="duitsland">Duitsland</option>
</select>
```

### Oefening 4: Formulier op Dezelfde Pagina

Maak een PHP-bestand dat:
1. Een HTML-formulier weergeeft
2. Als het formulier is ingevuld, de gegevens verwerkt en afdrukt
3. Na verzenden, het formulier nog steeds zichtbaar is (zodat de gebruiker nog keer iets kan invullen)

### Oefening 5: Validatie

Maak een formulier voor registratie. Check in PHP of:
- De voornaam niet leeg is
- De leeftijd groter is dan 13
- Het wachtwoord minstens 6 karakters lang is

Als alles correct is, print "Registratie succesvol!" Anders print een foutbericht.

