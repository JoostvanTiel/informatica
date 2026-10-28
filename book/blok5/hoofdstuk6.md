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

Ook in dit hoofdstuk gebruik je jouw database:

`nimmastream_<gebruikersnaam>`

---

## 1. UPDATE vanuit een formulier

Stap voor stap:

1. toon huidige gegevens;
2. laat gebruiker aanpassen;
3. verstuur formulier;
4. voer `UPDATE` uit.

Bij een webformulier werkt het meestal als volgt: de gebruiker opent een pagina, ziet de huidige gegevens, past die aan en klikt op "opslaan". Daarna stuurt de browser die nieuwe waarden terug naar PHP. PHP controleert de invoer en voert vervolgens een SQL-`UPDATE` uit.

### Belangrijk: eerst tonen, dan aanpassen

Je wilt niet dat een gebruiker per ongeluk verkeerde data wijzigz. Daarom is het logisch om eerst de huidige gegevens te tonen en pas daarna een wijziging door te laten voeren. Zodoende kun je de gebruiker begeleiden en voorkom je fouten.

Voorbeeld:

```php
$sql = "UPDATE profielen SET leeftijd_profiel = ? WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ii", $leeftijd, $id);
$stmt->execute();
```

Hier wordt niet direct een SQL-string met waarden ingevuld. De waarden worden veilig doorgegeven via placeholders.

---

## 2. DELETE met bevestiging

Verwijderen is onomkeerbaar in deze context, dus:

- vraag bevestiging in de interface;
- controleer op de server of een geldig `id` is ontvangen;
- geef feedback na verwijderen.

### Waarom een bevestiging?

Een delete-knop is op een website heel gemakkelijk te klikken. Als het verwijderen meteen gebeurt zonder controle, kan een gebruiker per ongeluk iets wegslaan. Een bevestiging voorkomt onbedoeld dataverlies en maakt het interface betrouwbaarder.

---

## 3. Basisvalidatie

Controleer minimaal:

- is het veld ingevuld;
- is het juiste datatype gebruikt;
- zit de waarde in een logische range;
- probeer je geen ongeldige `id` te wijzigen of verwijderen.

### Voorbeeld van logische controle

Als je verwacht dat een leeftijd een getal tussen 0 en 120 is, dan kun je dat in PHP checken. Een leeg veld of een tekstwaarde bij een numeriek veld is een signaal dat de invoer niet klopt. Als de invoer onjuist is, moet je de wijziging afbreken en een duidelijke foutmelding tonen.

---

## 4. Veilig programmeren

Gebruik bij invoer uit formulieren geen direct ingeplakte SQL-strings. Gebruik prepared statements met placeholders (`?`).

### Waarom is dit veilig?

Bij prepared statements worden invoerwaarden gescheiden van de SQL-opdracht zelf. De database behandelt die waarden als data in plaats van als onderdeel van de query. Daardoor worden veel veelvoorkomende beveiligingsproblemen voorkomen, zoals SQL-injectie.

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
