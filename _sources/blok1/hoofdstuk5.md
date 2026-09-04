# Hoofdstuk 5: Grammatica's

## Leerdoelen

In de vorige hoofdstukken heb je gewerkt met toestanden, algoritmen, variabelen, lijsten en lussen.

In dit hoofdstuk leer je hoe je met grammatica's nauwkeurig beschrijft welke reeksen symbolen wel en niet geldig zijn.

Je leert:

- wat een grammatica is in de informatica;
- het verschil tussen terminals en niet-terminals;
- wat productieregels en een startsymbool zijn;
- hoe je met regels strings kunt afleiden;
- hoe je een taal formeel beschrijft;
- hoe grammatica's aansluiten bij het examenprogramma informatica;
- hoe je met lussen patronen en strings opbouwt die bij regels horen.

Aan het einde van dit hoofdstuk kun je eenvoudige grammatica's lezen, zelf ontwerpen en toepassen in programmeeropdrachten.

---

## Waarom grammatica's?

Een computer moet precies weten wat geldig is.

Bij programmeertalen is dat heel belangrijk.

Bijvoorbeeld:

```text
3 + 4 * 2
```

is een geldige expressie, maar:

```text
+ 3 *
```

is niet geldig.

Een grammatica beschrijft die regels.

Zo weet een computer welke invoer syntactisch klopt.

---

## Wat is een grammatica?

Een **grammatica** is een verzameling regels waarmee je strings kunt opbouwen.

In de informatica gebruiken we vaak deze onderdelen:

1. **Terminals**: de symbolen die echt in de uiteindelijke string staan.
2. **Niet-terminals**: hulpsymbolen die je tijdens het opbouwen vervangt.
3. **Productieregels**: regels die aangeven hoe je vervangt.
4. **Startsymbool**: het symbool waarmee je begint.

Voorbeeld:

```text
Terminals: a, b
Niet-terminals: S
Start: S
Regels:
S -> aS
S -> b
```

Mogelijke strings uit deze grammatica:

```text
b
ab
aab
aaab
...
```

De taal is dus:

```text
{ a^n b | n >= 0 }
```

---

## Afleiden stap voor stap

We starten met het startsymbool `S`.

Voor string `aaab`:

```text
S
-> aS
-> aaS
-> aaaS
-> aaab
```

Dit heet een **afleiding**.

### Stroomdiagram van een afleiding

```text
START
  |
  v
Schrijf startsymbool op
  |
  v
Kies een regel die past
  |
  v
Vervang een niet-terminaal
  |
  v
Nog niet-terminals over?
  | ja -> terug naar kies een regel
  | nee
  v
Klaar: string met alleen terminals
```

---

## Grammatica en het examenprogramma informatica

Op examenniveau gaat het niet alleen om code schrijven, maar ook om modelleren.

Grammatica's horen daarbij, omdat je:

- formeel beschrijft welke invoer geldig is;
- onderscheid maakt tussen **syntaxis** (vorm) en **semantiek** (betekenis);
- regels precies en controleerbaar noteert;
- verband ziet met automaten uit hoofdstuk 1.

Kort gezegd:

automaten beschrijven gedrag over tijd,
grammatica's beschrijven vorm van symbolen/strings.

---

## Voorbeeld 1: binaire strings

We willen alle binaire strings met lengte 1 of meer.

```text
Terminals: 0, 1
Niet-terminals: S
Start: S
Regels:
S -> 0S
S -> 1S
S -> 0
S -> 1
```

Mogelijke strings:

```text
0
1
01
101
1110
...
```

---

## Voorbeeld 2: eenvoudige identifier

Een identifier begint met een letter, daarna volgen letters of cijfers.

```text
Start -> Letter Rest
Rest -> Letter Rest | Cijfer Rest | leeg
Letter -> a | b | ... | z
Cijfer -> 0 | 1 | ... | 9
```

Geldig:

```text
score1
x
level42
```

Niet geldig:

```text
1score
@naam
```

---

## Van grammatica naar code-denken

Je kunt regels ook simuleren met code.

Voorbeeld: maak vijf strings van de vorm `a^n b`.

```python
for n in range(5):
	 woord = "a" * n + "b"
	 print(woord)
```

Uitvoer:

```text
b
ab
aab
aaab
aaaab
```

Hier herhaal je een patroon met een lus, net als in hoofdstuk 4.

### Stroomdiagram van dit programma

```text
START
  |
  v
Neem n uit range(5)
  |
  v
Maak woord: "a" * n + "b"
  |
  v
Print woord
  |
  v
Nog waarden voor n?
  | ja -> terug naar maak woord
  | nee
  v
EINDE
```

---

## Begrippenlijst

Aan het einde van deze week moet je de volgende begrippen kunnen uitleggen:

**Grammatica**  
Een formele set regels om geldige strings op te bouwen.

**Terminal**  
Symbool dat in de uiteindelijke string voorkomt.

**Niet-terminaal**  
Hulpsymbool dat tijdens een afleiding wordt vervangen.

**Productieregel**  
Regel die aangeeft hoe een niet-terminaal mag worden vervangen.

**Startsymbool**  
Het symbool waarmee een afleiding begint.

**Afleiding**  
Het stap voor stap toepassen van productieregels.

**Taal**  
De verzameling strings die door een grammatica kunnen worden gemaakt.

**Syntaxis**  
De vormregels van een taal.

**Semantiek**  
De betekenis van uitdrukkingen in een taal.

---

# Opdrachten

1. Onderdelen herkennen

   Gegeven:

   ```text
   S -> aS
   S -> b
   ```

   a. Wat zijn de terminals?

   b. Wat zijn de niet-terminals?

   c. Wat is het startsymbool?

   d. Noem drie strings die in de taal zitten.

---

2. Afleiden

   Gebruik dezelfde grammatica.

   a. Geef een afleiding voor `ab`.

   b. Geef een afleiding voor `aaab`.

   c. Kan `aba` met deze grammatica? Leg uit.

---

3. Geldig of ongeldig

   Gegeven grammatica:

   ```text
   S -> 0S
   S -> 1S
   S -> 0
   S -> 1
   ```

   Bepaal voor elk woord of het geldig is:

   ```text
   0
   1
   101
   11010
   leeg woord
   2
   ```

---

4. Van regel naar patroon

   Schrijf Python-code die de volgende regels print:

   ```text
   b
   ab
   aab
   aaab
   aaaab
   ```

   Gebruik een lus en de operator `*` voor strings.

---

5. Herhaling met getallenpatroon

   Print met geneste lussen:

   ```text
   0 1 2 3 4 5 6 7 8 9
   ```

   op 10 regels onder elkaar.

   Tip: dit patroon gebruik je later opnieuw in combinatie-opgaven.

---

6. Sterrenblokken

   a. Print een blok van 10 bij 10 sterretjes.

   b. Print een blok van 5 bij 10 sterretjes.

   c. Print een blok van 20 bij 5 sterretjes.

   d. Leg uit welke lus de rijen maakt en welke de kolommen.

---

7. Grammatica ontwerpen

   Ontwerp een grammatica voor woorden met alleen `x` en `y` die altijd eindigen op `y`.

   a. Geef terminals, niet-terminals, startsymbool en regels.

   b. Geef vijf voorbeeldwoorden.

   c. Geef twee woorden die niet mogen.

---

8. Eenvoudige expressies

   Ontwerp een eenvoudige grammatica voor:
   - een cijfer (`0` t/m `9`)
   - gevolgd door
   - een operator (`+` of `-`)
   - gevolgd door
   - een cijfer

   Voorbeelden van geldige woorden:

   ```text
   3+4
   8-1
   ```

   Voorbeelden van ongeldige woorden:

   ```text
   +34
   44-
   ```

---

9. Willekeurige grammatica-string

   Gebruik `random.randrange()` om willekeurig `0` of `1` te kiezen.

   a. Genereer 8 willekeurige binaire strings met lengte 6.

   b. Laat zien dat elke string past binnen de grammatica van opdracht 3.

   c. Tel per string het aantal nullen en enen.

---

10. Van grammatica naar controle

    Schrijf een programma dat controleert of een woord alleen uit `a` en `b` bestaat en eindigt op `b`.

    a. Gebruik een lus om de tekens te controleren.

    b. Gebruik een boolean-variabele om bij te houden of het woord geldig blijft.

    c. Test met minstens zes woorden.

---

11. Verdieping: opbouw zoals patroonopgaven

    Bouw met geneste lussen deze figuur op:

    ```text
    0
    0 1
    0 1 2
    ...
    0 1 2 3 4 5 6 7 8 9
    ```

    a. Los eerst de eerste drie regels op.

    b. Breid uit naar alle tien regels.

    c. Leg uit welke grens in `range()` je hebt aangepast.

---

12. Examengericht mini-ontwerp

    Ontwerp voor een eenvoudige invoertaal (bijvoorbeeld leerlingcode, productcode of game-commando):
    1.  een korte informele beschrijving;
    2.  een formele grammatica;
    3.  drie geldige voorbeelden;
    4.  drie ongeldige voorbeelden;
    5.  een Python-fragment dat een deelcontrole doet.

---

## Afronding

In dit hoofdstuk heb je geleerd dat grammatica's een formele manier zijn om taalregels te beschrijven.

Je kunt nu terminals, niet-terminals, productieregels en startsymbolen gebruiken om strings af te leiden en te beoordelen.

Je hebt dit gecombineerd met programmeervaardigheden uit eerdere hoofdstukken: variabelen, beslissingen, operatoren, lijsten, lussen en `random.randrange()`.

Daarmee heb je precies de basis die je nodig hebt voor het volgende combinatiehoofdstuk, waarin je alles samenbrengt en leert werken met functies.
