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

Dat gebeurt niet alleen in programmeertalen, maar ook in dingen die leerlingen dagelijks gebruiken.

Denk aan:

- een gebruikersnaam die aan regels moet voldoen;
- een game-commando zoals `move 3` of `jump 2`;
- een hashtag zonder spaties;
- een schoolcode met vast patroon.

Bijvoorbeeld:

```text
chat!help
```

is een geldig commando, maar:

```text
chat ! help
```

kan ongeldig zijn als spaties niet zijn toegestaan.

Ook in Python zelf gelden zulke vormregels. Bijvoorbeeld:

```text
3 + 4 * 2
```

is een geldige expressie, maar:

```text
+ 3 *
```

is niet geldig.

Een grammatica beschrijft zulke regels op een precieze manier.

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

## Voorbeeld 2: gebruikersnaam

Stel: een gebruikersnaam begint met een letter, daarna volgen letters of cijfers.

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

Je kunt ook een regelcontrole programmeren, bijvoorbeeld voor een gebruikersnaam:

```python
naam = "level42"
geldig = True

if len(naam) == 0:
  geldig = False
elif not naam[0].isalpha():
  geldig = False

for i in range(len(naam)):
  teken = naam[i]
  if not (teken.isalpha() or teken.isdigit()):
    geldig = False

print(geldig)
```

Zo zie je hoe grammatica-denken direct aansluit op programmeren.

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

## Succescriteria

Aan het einde van dit hoofdstuk kun je:

- terminals, niet-terminals, productieregels en startsymbool aanwijzen;
- een eenvoudige afleiding maken;
- beoordelen of een woord wel of niet in een taal zit;
- een simpele taalregel uit de praktijk vertalen naar Python-controle.

## Mini-rubric

| Onderdeel | Startend                         | Voldoende                                 | Sterk                                |
| --------- | -------------------------------- | ----------------------------------------- | ------------------------------------ |
| Begrijpen | Herkent enkele grammatica-termen | Legt alle kernbegrippen correct uit       | Verbindt grammatica aan examenkaders |
| Toepassen | Maakt deels correcte afleiding   | Maakt correcte afleidingen en voorbeelden | Ontwerpt bruikbare eigen grammatica  |
| Testen    | Controleert enkele woorden       | Test systematisch geldig/ongeldig         | Onderbouwt testkeuzes met regels     |
| Uitleggen | Beschrijft uitkomst kort         | Legt redeneerstappen uit                  | Vergelijkt alternatieve grammatica's |

---

# Opdrachten

**Kernroute (verplicht, circa 60% van de opgavenlast):** opdracht 1, 2, 3, 4 en 6.  
**Plusroute (verdieping):** opdracht 5, 7 en 8.

1. Onderdelen herkennen (gebruikersnaam-regel)

   Gegeven:

   ```text
   Start -> Letter Rest
   Rest -> Letter Rest | Cijfer Rest | leeg
   Letter -> a | b | ... | z
   Cijfer -> 0 | 1 | ... | 9
   ```

   a. Wat zijn de terminals?

   b. Wat zijn de niet-terminals?

   c. Wat is het startsymbool?

   d. Noem drie geldige gebruikersnamen.

---

2. Afleiden stap voor stap

   Gebruik:

   ```text
   S -> aS
   S -> b
   ```

   a. Geef een afleiding voor `ab`.

   b. Geef een afleiding voor `aaab`.

   c. Kan `aba` met deze grammatica? Leg uit.

---

3. Geldig of ongeldig (chat-commando)

   Een commando heeft de vorm:

   ```text
    actie spatie getal
    actie: jump of move
    getal: 1 t/m 9
   ```

   Bepaal voor elk woord of het geldig is:

   ```text
   jump 3
   move 9
   fly 2
   jump negen
   move10
   jump 0
   ```

---

4. Van regel naar code

   Schrijf Python-code die controleert of een woord:
   - begint met een letter;
   - daarna alleen letters/cijfers bevat.

   Test met:

   ```text
    score1
    1score
    level42
    @naam
   ```

   Gebruik een lus en een boolean-variabele.

---

5. Herhaling met getallenpatroon (plusroute)

   Print met geneste lussen:

   ```text
   0 1 2 3 4 5 6 7 8 9
   ```

   op 10 regels onder elkaar.

   Tip: dit patroon gebruik je later opnieuw in combinatie-opgaven.

---

6. Schoolcode ontwerpen

   Een schoolcode heeft de vorm:

   ```text
   hv-jaar-klasnummer
   ```

   Voorbeeld:

   ```text
   hv-4-23
   ```

   a. Beschrijf in gewone taal de syntaxis van deze code.

   b. Ontwerp een eenvoudige grammatica voor deze vorm.

   c. Geef drie geldige en drie ongeldige voorbeelden.

---

7. Binaire strings met random (plusroute)

   Gebruik `random.randrange()` om willekeurig `0` of `1` te kiezen.

   a. Genereer 8 willekeurige binaire strings met lengte 6.

   b. Laat zien dat elke string past binnen de taal met alleen symbolen `0` en `1`.

   c. Tel per string het aantal nullen en enen.

---

8. Verdieping: patroon uit lussen (plusroute)

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

## Afronding

In dit hoofdstuk heb je geleerd dat grammatica's een formele manier zijn om taalregels te beschrijven.

Je kunt nu terminals, niet-terminals, productieregels en startsymbolen gebruiken om strings af te leiden en te beoordelen.

Door voorbeelden uit je eigen wereld (gebruikersnamen, commando's en codes) zie je dat grammatica's niet alleen theorie zijn, maar direct bruikbaar in software.

Je hebt dit gecombineerd met programmeervaardigheden uit eerdere hoofdstukken: variabelen, beslissingen, operatoren, lijsten, lussen en `random.randrange()`.

In het volgende hoofdstuk breng je alles samen in functies, zodat je grotere problemen modulair en overzichtelijk kunt oplossen.
