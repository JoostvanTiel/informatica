# Hoofdstuk 6: PHP + MySQL - UPDATE en DELETE via formulieren

## Leerdoelen

In dit hoofdstuk bouw je van "alleen lezen" naar "gegevens beheren via een webinterface".

Je leert:

- records wijzigen met een formulier (`UPDATE`);
- records verwijderen met bevestiging (`DELETE`);
- invoer controleren voordat je query's uitvoert;
- prepared statements gebruiken voor veiligere code.

Aan het einde van dit hoofdstuk kun je een eenvoudige beheerpagina bouwen voor één tabel.

---

## 1. UPDATE vanuit een formulier

Stap voor stap:

1. toon huidige gegevens;
2. laat gebruiker aanpassen;
3. verstuur formulier;
4. voer `UPDATE` uit.

Voorbeeld:

```php
$sql = "UPDATE profielen SET leeftijd_profiel = ? WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ii", $leeftijd, $id);
$stmt->execute();
```

---

## 2. DELETE met bevestiging

Verwijderen is onomkeerbaar in deze context, dus:

- vraag bevestiging in de interface;
- controleer op de server of een geldig `id` is ontvangen;
- geef feedback na verwijderen.

---

## 3. Basisvalidatie

Controleer minimaal:

- is het veld ingevuld;
- is het juiste datatype gebruikt;
- zit de waarde in een logische range;
- probeer je geen ongeldige `id` te wijzigen of verwijderen.

---

## 4. Veilig programmeren

Gebruik bij invoer uit formulieren geen direct ingeplakte SQL-strings.  
Gebruik prepared statements met placeholders (`?`).

---

## Opdrachten

### Opdracht 1 - Bewerkfunctie

Maak een pagina waarop je één profiel kunt wijzigen:

1. ID kiezen;
2. huidig record tonen;
3. leeftijd of naam aanpassen;
4. opslaan en bevestiging tonen.

### Opdracht 2 - Verwijderfunctie

Maak een verwijderknop met:

1. confirm-vraag;
2. server-side check;
3. succes- of foutmelding.

### Opdracht 3 - Inputcontrole

Voeg validatie toe:

1. lege velden blokkeren;
2. leeftijd als getal controleren;
3. foutmelding bij ongeldige invoer.

### Opdracht 4 - Testmatrix

Test ten minste deze situaties:

1. geldige update;
2. update met leeg veld;
3. delete met bestaand id;
4. delete met niet-bestaand id.

Noteer per test: verwachting en uitkomst.

---

## Check je begrip

1. Waarom gebruik je prepared statements?
2. Wat is het verschil tussen validatie in de browser en op de server?
3. Waarom moet je na een update altijd teruglezen?
4. Welke fout heeft de meeste impact: foute update of foute delete? Leg uit.

---

## Samenvatting

- Met formulieren kun je data beheren.
- UPDATE en DELETE vragen om controle en voorzichtigheid.
- Validatie en prepared statements maken je code betrouwbaarder en veiliger.

## Huiswerk

Rond je CRUD-pagina voor één tabel af met:

- overzicht;
- bewerken;
- verwijderen;
- duidelijke fout- en succesmeldingen.
