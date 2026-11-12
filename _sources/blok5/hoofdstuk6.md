# Hoofdstuk 6: PHP + MySQL - INSERT, UPDATE en DELETE via formulieren

## Leerdoelen

In dit hoofdstuk bouw je van "alleen lezen" naar "gegevens beheren via een webinterface".

Je leert:

- records wijzigen met een formulier (`UPDATE`);
- records toevoegen met een formulier (`INSERT INTO`);
- records verwijderen met bevestiging (`DELETE`);
- invoer controleren voordat je query's uitvoert;
- prepared statements gebruiken voor veiligere code.

Aan het einde van dit hoofdstuk kun je een eenvoudige beheerpagina bouwen voor één tabel.

---

Ook in dit hoofdstuk gebruik je jouw database:

`nimmastream_<gebruikersnaam>`

Zorg dat je verbindingsblok van het vorige hoofdstuk weer bovenaan je script staat.

---

## 1. Informatie uit een formulier veilig verwerken

In het vorige hoofdstuk zag je een waarschuwing over [**SQL-injectie**](https://nl.wikipedia.org/wiki/SQL-injectie).  
Dat is een beveiligingsprobleem waarbij invoer van een gebruiker per ongeluk als SQL-code wordt uitgevoerd.

Daarom gebruiken we **prepared statements**.  
Het idee is steeds hetzelfde:

1. je schrijft de SQL met placeholders (`?`);
2. je koppelt daar waarden aan;
3. de database voert de query uit met die waarden als data.

Zo blijft de structuur van de query vast en kan invoer die structuur niet veranderen.

Voorbeeld:

```php
$regio = $_POST['regio'];
$minimale_leeftijd = $_POST['leeftijd'];
$stmt = $conn->prepare("SELECT * FROM gebruikers WHERE regio = ? AND leeftijd > ?");
$stmt->bind_param('si', $regio, $minimale_leeftijd);
$stmt->execute();
```

Wat gebeurt hier stap voor stap?

1. In `$stmt` staat het voorbereid statement.
2. Met `bind_param()` koppel je waarden aan de vraagtekens.
3. Met `execute()` voer je de query uit.

Bij `bind_param()` is de eerste parameter een type-string.  
Die letters moeten in dezelfde volgorde staan als de vraagtekens in je query.

Daarna geef je de waarden door, ook in diezelfde volgorde.

Er zijn vier typeletters:

- 's' - string
- 'i' - integer
- 'd' - float (of double)
- 'b' - blob (binary large object), gebruiken wij niet.

## 2. UPDATE vanuit een formulier

Stap voor stap:

1. toon huidige gegevens;
2. laat gebruiker aanpassen;
3. verstuur formulier;
4. voer `UPDATE` uit.

Bij een webformulier werkt het meestal als volgt: de gebruiker opent een pagina, ziet de huidige gegevens, past die aan en klikt op "opslaan". Daarna stuurt de browser die nieuwe waarden terug naar PHP. PHP controleert de invoer en voert vervolgens een SQL-`UPDATE` uit.

### Belangrijk: eerst tonen, dan aanpassen

Je wilt niet dat een gebruiker per ongeluk verkeerde data wijzigt. Daarom is het logisch om eerst de huidige gegevens te tonen en pas daarna een wijziging door te laten voeren. Zodoende kun je de gebruiker begeleiden en voorkom je fouten.

Voorbeeld:

```php
$query = "UPDATE profielen SET leeftijd_profiel = ? WHERE id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("ii", $leeftijd, $id);
$stmt->execute();
```

Hier wordt niet direct een SQL-string met waarden ingevuld. De waarden worden veilig doorgegeven via placeholders.

Wat doet dit statement stap voor stap?

1. `prepare()` zet de SQL met placeholders klaar.
2. `bind_param("ii", $leeftijd, $id)` koppelt twee integers aan de vraagtekens.
3. `execute()` voert de wijziging uit in de database.

---

## 3. INSERT INTO vanuit een formulier

Nieuwe gegevens toevoegen werkt bijna hetzelfde als updaten:

1. gebruiker vult een formulier in;
2. PHP leest de invoer;
3. PHP controleert de invoer;
4. PHP voert `INSERT INTO` uit met een prepared statement.

Voorbeeld:

```php
$naam = $_POST['naam'];
$leeftijd = $_POST['leeftijd'];

$sql = "INSERT INTO profielen (naam, leeftijd_profiel) VALUES (?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("si", $naam, $leeftijd);
$stmt->execute();
```

Wat gebeurt hier stap voor stap?

1. `prepare()` zet de SQL-opdracht met placeholders klaar.
2. `bind_param("si", $naam, $leeftijd)` koppelt een string en een integer.
3. `execute()` voegt het nieuwe record toe aan de tabel.

Ook hier geldt: waarden worden niet direct in de SQL-string geplakt, maar veilig als data doorgestuurd.

---

## 4. DELETE met bevestiging

Verwijderen is onomkeerbaar in deze context, dus:

- vraag bevestiging via een aparte pagina;
- controleer op de server of een geldig `id` is ontvangen;
- geef feedback na verwijderen.

### Waarom een bevestiging?

Een delete-knop is op een website heel gemakkelijk te klikken. Als het verwijderen meteen gebeurt zonder controle, kan een gebruiker per ongeluk iets wegslaan. Een bevestiging voorkomt onbedoeld dataverlies en maakt de interface betrouwbaarder.

### Bevestigen zonder JavaScript: `confirm.php`

Omdat we nog geen JavaScript gebruiken, werken we met twee pagina's:

1. Op de overzichtspagina klik je op "Verwijderen".
2. Je stuurt het `id` met `POST` naar `confirm.php` en toont daar de vraag: "Weet je het zeker?"
3. Pas na klik op "Ja, verwijderen" sturen we een `POST` en voeren we de `DELETE` uit.

**Stap 1 - Formulier op je overzichtspagina (POST naar `confirm.php`)**

```php
echo "<form method='POST' action='confirm.php'>";
echo "  <input type='hidden' name='id' value='" . $row['id'] . "'>";
echo "  <button type='submit'>Verwijderen</button>";
echo "</form>";
```

**Stap 2 - `confirm.php` met bevestigingsformulier**

```php
<?php
$id = $_POST['id'];
?>

<h2>Weet je zeker dat je dit profiel wilt verwijderen?</h2>

<form method="POST" action="verwijder.php">
    <input type="hidden" name="id" value="<?php echo $id; ?>">
    <button type="submit" name="bevestig" value="ja">Ja, verwijderen</button>
</form>

<p><a href="overzicht.php">Nee, terug naar overzicht</a></p>
```

### Stap 3 - `verwijder.php` met prepared statement

```php
$id = $_POST['id'];

if (!isset($_POST['bevestig']) || $_POST['bevestig'] !== 'ja') {
    echo "Verwijderen geannuleerd.";
} else {
    $sql = "DELETE FROM profielen WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        if ($stmt->affected_rows > 0) {
            echo "Profiel verwijderd.";
        } else {
            echo "Geen profiel gevonden met dit id.";
        }
    } else {
        echo "Verwijderen mislukt: " . $stmt->error;
    }
}
```

Wat doet dit statement stap voor stap?

1. We controleren of de gebruiker echt op "Ja, verwijderen" heeft geklikt.
2. We controleren of `id` een geldig getal is.
3. `prepare()` zet de delete-query klaar.
4. `bind_param("i", $id)` koppelt het id aan het vraagteken.
5. `execute()` probeert de verwijdering uit te voeren.
6. Met `affected_rows` controleer je of er echt een record is verwijderd.
7. Als er een error optreedt, wordt die getoond met `$stmt->error`.

Verwijder alleen op basis van een geldig id en geef daarna duidelijke feedback (gelukt of mislukt).

---

## 5. Basisvalidatie

Controleer minimaal:

- is het veld ingevuld;
- is het juiste datatype gebruikt;
- zit de waarde in een logische range;
- probeer je geen ongeldige `id` te wijzigen of verwijderen.

### Voorbeeld van logische controle

Als je verwacht dat een leeftijd een getal tussen 0 en 120 is, dan kun je dat in PHP checken. Een leeg veld of een tekstwaarde bij een numeriek veld is een signaal dat de invoer niet klopt. Als de invoer onjuist is, moet je de wijziging afbreken en een duidelijke foutmelding tonen.

---

## 6. Veilig programmeren

Gebruik bij invoer uit formulieren geen direct ingeplakte SQL-strings. Gebruik prepared statements met placeholders (`?`).

### Waarom is dit veilig?

Bij prepared statements worden invoerwaarden gescheiden van de SQL-opdracht zelf. De database behandelt die waarden als data in plaats van als onderdeel van de query. Daardoor worden veel voorkomende beveiligingsproblemen voorkomen, zoals SQL-injectie.

### Praktisch voorbeeld: Volledige UPDATE workflow

**Stap 1: HTML-formulier**

```html
<form method="POST" action="bewerkprofiel.php">
  <input type="hidden" name="id" value="<?php echo $id; ?>" />
  <label>Leeftijd:</label>
  <input
    type="number"
    name="leeftijd"
    value="<?php echo $huidigeleeftijd; ?>"
  />
  <button type="submit">Opslaan</button>
</form>
```

**Stap 2: PHP - Invoer uit formulier lezen**

```php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];           // Welk profiel wijzigen?
    $leeftijd = $_POST['leeftijd']; // Naar welke leeftijd?

    // Validatie: is leeftijd ingevuld en logisch?
    if (empty($leeftijd) || $leeftijd < 0 || $leeftijd > 120) {
        echo "Fout: leeftijd moet tussen 0 en 120 zijn.";
    } else {
        // Stap 3: Prepared statement
        $sql = "UPDATE profielen SET leeftijd_profiel = ? WHERE id = ?";
        $stmt = $conn->prepare($sql);

        // Stap 4: Types en waarden koppelen
        $stmt->bind_param("ii", $leeftijd, $id);
        // "ii" = twee integers
        // eerste ? = $leeftijd
        // tweede ? = $id

        // Stap 5: Uitvoeren
        if ($stmt->execute()) {
            echo "Profiel bijgewerkt!";
        } else {
            echo "Fout: " . $stmt->error;
        }
    }
}
```

**Waarom is dit veiliger?**

`bind_param()` scheidt de SQL-code van de invoerdata:

- SQL-code: `UPDATE profielen SET leeftijd_profiel = ? WHERE id = ?`
- Data: `[15, 1]`

Zelfs als iemand typt `'; DROP TABLE gebruikers; --`, wordt dit als invoerwaarde behandeld en niet als extra SQL-code.

### Belangrijk verschil tussen validatie en beveiliging

- validatie controleert of invoer klopt en logisch is;
- prepared statements beschermen tegen ongewenste SQL-code in invoer.

Beide zijn belangrijk bij CRUD-pagina's.

---

## Opdrachten

Voer alle opdrachten uit in jouw database: `nimmastream_<gebruikersnaam>`.

### Opdracht 1 - Bewerkfunctie

Maak een pagina waarop je één profiel kunt wijzigen:

1. ID kiezen;
2. huidig record tonen;
3. leeftijd of naam aanpassen;
4. opslaan en bevestiging tonen.

### Opdracht 2 - Invoegfunctie

Maak een formulier om een nieuw profiel toe te voegen:

1. naam en leeftijd invoeren;
2. invoer valideren;
3. met `INSERT INTO` en prepared statement opslaan;
4. succes- of foutmelding tonen.

### Opdracht 3 - Verwijderfunctie

Maak een verwijderknop met:

1. confirm-vraag;
2. server-side check;
3. succes- of foutmelding.

### Opdracht 4 - Inputcontrole

Voeg validatie toe:

1. lege velden blokkeren;
2. leeftijd als getal controleren;
3. foutmelding bij ongeldige invoer.

### Opdracht 5 - Testmatrix

Test ten minste deze situaties:

1. geldige insert;
2. insert met ongeldig veld;
3. geldige update;
4. update met leeg veld;
5. delete met bestaand id;
6. delete met niet-bestaand id.

Noteer per test: verwachting en uitkomst.

---

## Check je begrip

1. Waarom gebruik je prepared statements bij INSERT, UPDATE en DELETE?
2. Wat is het verschil tussen validatie in de browser en op de server?
3. Waarom moet je na een update altijd teruglezen?
4. Welke fout heeft de meeste impact: foute update of foute delete? Leg uit.

---

## Samenvatting

- Met formulieren kun je data beheren.
- INSERT, UPDATE en DELETE vragen om controle en voorzichtigheid.
- Validatie en prepared statements maken je code betrouwbaarder en veiliger.

## Huiswerk

Rond je CRUD-pagina voor één tabel af met:

- overzicht;
- bewerken;
- verwijderen;
- duidelijke fout- en succesmeldingen.
