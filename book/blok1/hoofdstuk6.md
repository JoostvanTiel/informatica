# Hoofdstuk 6: Toeval & combineren

## Leerdoelen

In dit hoofdstuk combineer je alles wat je tot nu toe hebt geleerd.

Je gebruikt:

- variabelen en types;
- beslissingen met `if`, `elif`, `else`;
- lijsten en indexen;
- operatoren;
- `range()` en `random.randrange()`;
- `for`- en `while`-lussen;
- grammatica-denken uit hoofdstuk 5.

Nieuw in dit hoofdstuk: **functies**.

Je leert:

- waarom functies handig zijn;
- hoe je een functie definieert met `def`;
- hoe je parameters gebruikt;
- hoe je met `return` een waarde teruggeeft;
- hoe je grotere opdrachten opdeelt in kleine functies.

Aan het einde van dit hoofdstuk kun je een groter probleem opdelen in meerdere functies en die functies samen laten werken in een compleet programma.

---

## Waarom functies?

In hoofdstuk 4 en 5 heb je gezien dat code snel lang wordt bij patronen, tabellen en controles.

Zonder functies krijg je vaak:

- veel herhaling;
- moeilijk leesbare code;
- meer kans op fouten;
- lastig testen.

Met functies kun je een programma opbouwen als losse bouwstenen.

```text
probleem opdelen -> kleine functies -> combineren -> testen
```

---

## De basis van een functie

Een functie maak je met `def`.

```python
def begroet(naam):
		print("Hallo", naam)

begroet("Sam")
begroet("Noor")
```

Hier:

- is `begroet` de functienaam;
- is `naam` de parameter;
- is de ingesprongen code het functieblok.

### Stroomdiagram van een functie-aanroep

```text
START
	|
	v
Roep functie aan
	|
	v
Geef argument(en) mee
	|
	v
Voer functiestappen uit
	|
	v
Terug naar hoofdprogramma
	|
	v
EINDE
```

---

## Parameters en argumenten

Een parameter is de naam in de functie.

Een argument is de echte waarde die je meegeeft bij aanroepen.

```python
def toon_score(naam, score):
		print(naam, "heeft", score, "punten")

toon_score("Yara", 120)
toon_score("Milan", 85)
```

Je kunt dezelfde functie dus met verschillende waarden gebruiken.

---

## Return-waarden

Gebruik `return` als je een waarde wilt teruggeven.

```python
def kwadraat(getal):
		return getal * getal

uitkomst = kwadraat(6)
print(uitkomst)
```

Functies met `return` zijn handig om te rekenen, vergelijken of door te geven aan andere functies.

### Stroomdiagram met return

```text
START
	|
	v
Functie krijgt invoer
	|
	v
Berekening / controle
	|
	v
Return resultaat
	|
	v
Hoofdprogramma gebruikt resultaat
	|
	v
EINDE
```

---

## Functies combineren met if, lijsten en lussen

Voorbeeld: gemiddelde van een lijst berekenen.

```python
def gemiddelde_van_lijst(cijfers):
		totaal = 0
		for i in range(len(cijfers)):
				totaal = totaal + cijfers[i]
		return totaal / len(cijfers)

waarden = [6.5, 7.0, 5.5, 8.0]
gemiddelde = gemiddelde_van_lijst(waarden)

if gemiddelde >= 5.5:
		print("voldoende")
else:
		print("onvoldoende")
```

Je herkent hier stof uit hoofdstuk 2, 3 en 4.

---

## Functies met random.randrange

Je kunt toeval netjes in een functie stoppen.

```python
import random

def worp_dobbelsteen():
		return random.randrange(1, 7)

for i in range(5):
		print(worp_dobbelsteen())
```

Of uitgebreider:

```python
import random

def tel_zessen(aantal_worpen):
		teller = 0
		for i in range(aantal_worpen):
				worp = random.randrange(1, 7)
				if worp == 6:
						teller = teller + 1
		return teller

print(tel_zessen(20))
```

---

## Functies voor patronen

Veel patroonopgaven uit lussen worden overzichtelijker met functies.

Voorbeeld 1: een regel sterretjes.

```python
def print_sterren(aantal):
		for i in range(aantal):
				print("*", end=" ")
		print()
```

Voorbeeld 2: een rechthoek met sterretjes.

```python
def print_rechthoek(rijen, kolommen):
		for r in range(rijen):
				print_sterren(kolommen)

print_rechthoek(3, 5)
```

Hier roept de ene functie de andere functie aan.

---

## Functies en grammatica-denken

In hoofdstuk 5 heb je grammatica's gebruikt om te beschrijven welke strings geldig zijn.

Nu kun je zo'n controle als functie maken.

```python
def eindigt_op_b(woord):
		if len(woord) == 0:
				return False
		return woord[len(woord) - 1] == "b"

print(eindigt_op_b("aaab"))
print(eindigt_op_b("aba"))
```

Combinatie van formeel denken en programmeren is precies wat op examenniveau belangrijk is.

---

## Programma-opbouw in stappen

Voor grotere opdrachten helpt deze volgorde:

1. Beschrijf het probleem in gewone taal.
2. Bepaal input en output.
3. Knip op in functies.
4. Schrijf en test elke functie apart.
5. Bouw het hoofdprogramma dat functies combineert.
6. Test het geheel met meerdere testgevallen.

### Stroomdiagram van een gecombineerd programma

```text
START
	|
	v
Lees / kies invoer
	|
	v
Roep functie A aan
	|
	v
Roep functie B aan
	|
	v
Gebruik if/elif op resultaten
	|
	v
Print output
	|
	v
EINDE
```

---

## Veelgemaakte fouten

1. `return` vergeten

   Dan krijg je geen bruikbare uitkomst terug.

2. Verkeerde inspringing

   Dan hoort code niet bij de functie of lus.

3. Variabele buiten bereik gebruiken

   Een variabele die in een functie staat, bestaat niet automatisch buiten die functie.

4. Functie en print door elkaar halen

   Soms wil je printen, soms wil je een waarde teruggeven.

---

## Begrippenlijst

Aan het einde van deze week moet je de volgende begrippen kunnen uitleggen:

**Functie**  
Een benoemd stuk code dat je kunt aanroepen.

**`def`**  
Python-sleutelwoord om een functie te definiëren.

**Parameter**  
Naam van invoer in de functiedefinitie.

**Argument**  
Werkelijke waarde die je meegeeft bij het aanroepen.

**`return`**  
Geeft een waarde terug uit een functie.

**Lokale variabele**  
Variabele die alleen binnen een functie bestaat.

**Hulpfunctie**  
Kleine functie die door een andere functie wordt gebruikt.

**Modulair ontwerpen**  
Een programma opdelen in losse, samenwerkende onderdelen.

---

# Opdrachten

1. Eerste functies

   a. Schrijf een functie `begroet(naam)` die `Hallo <naam>` print.

   b. Roep de functie aan met drie verschillende namen.

   c. Schrijf een functie `toon_getal(getal)` die het getal en zijn kwadraat print.

---

2. Return oefenen

   a. Schrijf een functie `som(a, b)` die `a + b` teruggeeft.

   b. Schrijf een functie `verschil(a, b)` die `a - b` teruggeeft.

   c. Schrijf een functie `is_even(getal)` die `True` of `False` teruggeeft.

   d. Test elke functie met minstens drie voorbeelden.

---

3. Lijst verwerken met functies

   Gegeven:

   ```python
   cijfers = [6.5, 7.0, 5.5, 8.0, 4.5]
   ```

   a. Schrijf `som_lijst(cijfers)`.

   b. Schrijf `gemiddelde_lijst(cijfers)` die `som_lijst` gebruikt.

   c. Schrijf `beoordeling(gemiddelde)` die `voldoende` of `onvoldoende` teruggeeft.

   d. Combineer alles in een hoofdprogramma.

---

4. Toestand en gebeurtenissen opnieuw

   Gegeven:

   ```python
   gebeurtenissen = ["openen", "sluiten", "openen", "openen", "sluiten"]
   ```

   a. Schrijf een functie `volgende_toestand(toestand, gebeurtenis)`.

   b. Verwerk de hele lijst met een lus.

   c. Print na elke stap de toestand.

   d. Test met een tweede lijst gebeurtenissen.

---

5. Dobbelsteenfuncties

   Gebruik `random.randrange()`.

   a. Schrijf `worp_dobbelsteen()`.

   b. Schrijf `aantal_zessen(aantal_worpen)`.

   c. Schrijf `aantal_even(aantal_worpen)`.

   d. Vergelijk de resultaten van 20, 100 en 1000 worpen.

---

6. Patroonfunctie 1

   a. Schrijf `print_sterren(aantal)`.

   b. Schrijf `print_blok(rijen, kolommen)` die `print_sterren` gebruikt.

   c. Test met `(10, 10)`, `(5, 10)` en `(20, 5)`.

---

7. Patroonfunctie 2

   Schrijf een functie `print_getalrij(n)` die print:

   ```text
   0 1 2 ... n
   ```

   a. Gebruik een lus.

   b. Gebruik daarna deze functie om 10 regels te printen met telkens `0` t/m `9`.

---

8. Driehoekfunctie

   Schrijf een functie `print_driehoek(hoogte)` die dit patroon maakt:

   ```text
   0
   0 1
   0 1 2
   ...
   ```

   a. Gebruik geneste lussen.

   b. Roep de functie aan met hoogte 10.

   c. Extra: maak ook een omgekeerde variant.

---

9. Tafel van vermenigvuldiging

   a. Schrijf een functie `print_tafel_van(getal, max_factor)`.

   b. Schrijf een functie `print_tafels_1_tot_9()` die alle tafels 1 t/m 9 print.

   c. Zorg dat de uitvoer leesbaar blijft met nette spaties.

---

10. Grammatica-controlefunctie

    Een woord is geldig als:
    - het alleen `a` en `b` bevat;
    - en eindigt op `b`.

    a. Schrijf `is_geldig_ab_woord(woord)`.

    b. Test met minstens 8 woorden.

    c. Print per woord: woord + geldig/ongeldig.

---

11. Mini-project combineren

    Ontwerp een programma dat een lijst met willekeurige scores maakt en daarna analyseert.

    Verplicht:
    - gebruik `random.randrange()`;
    - zet de scores in een lijst;
    - gebruik minimaal drie zelfgemaakte functies;
    - gebruik `if` voor een beoordeling;
    - toon minimum, maximum en gemiddelde.

    Lever in:
    1. functielijst met korte uitleg;
    2. volledige code;
    3. testuitvoer van minstens drie runs.

---

12. Eindopdracht blok 1

    Maak een gecombineerd programma met:
    - toestanden of gebeurtenissen;
    - beslissingen;
    - lijsten;
    - lussen;
    - toeval;
    - functies.

    Voorbeelden:
    - game-ronde simulatie;
    - toegangscontrole met meerdere pogingen;
    - patroongenerator met menu;
    - binaire codegenerator en controle.

    Je programma bevat minimaal:
    1. vier functies;
    2. een hoofdprogramma;
    3. duidelijke testgevallen;
    4. korte reflectie: wat ging goed, wat kan beter.

---

## Afronding

In dit hoofdstuk heb je geleerd hoe je alle onderdelen van blok 1 kunt combineren in functies.

Je hebt gewerkt met:

- variabelen en types;
- beslissingen;
- lijsten;
- lussen;
- toeval met `random.randrange()`;
- en formeel controleren met regels.

Daardoor kun je nu grotere programma's ontwerpen die overzichtelijk, testbaar en uitbreidbaar zijn.

Je bent hiermee klaar voor het vervolg waarin je nog zelfstandiger ontwerpt en programmeert met meerdere samenwerkende functies.
