# Hoofdstuk 3: Datastructuren en operatoren

## Leerdoelen

In hoofdstuk 1 en 2 heb je geleerd hoe je met variabelen informatie bewaart en hoe je met `if`, `elif` en `else` beslissingen maakt.

In dit hoofdstuk ga je een stap verder: je leert hoe je meerdere gegevens netjes opslaat en hoe je met rekenoperatoren berekeningen maakt.

Je leert:

- wat de variabeletypes `int`, `float`, `string` en `boolean` zijn;
- wanneer je welk type gebruikt;
- wat een lijst is en waarom lijsten handig zijn;
- hoe je waarden uit een lijst leest en aanpast;
- wat de functie `range()` doet en hoe je die gebruikt;
- hoe je met `random.randrange()` willekeurige gehele getallen kiest;
- hoe de operatoren `+`, `-`, `*`, `/`, `**`, `//` en `%` werken;
- hoe je met variabelen, lijsten en operatoren problemen oplost;
- waarom herhaling van stappen in code een opstap is naar `for` en `while`.

Aan het einde van dit hoofdstuk kun je gegevens slim organiseren in variabelen en lijsten en kun je berekeningen uitvoeren met de belangrijkste rekenoperatoren.

---

## Waarom datastructuren?

Tot nu toe heb je vaak met losse variabelen gewerkt.

Bijvoorbeeld:

```python
cijfer1 = 6.5
cijfer2 = 7.0
cijfer3 = 5.5
```

Dat kan, maar het wordt snel onhandig als je veel waarden hebt.

Met een **datastructuur** kun je gegevens geordend bewaren.

De eerste datastructuur die je leert is de **lijst**.

Daarmee kun je meerdere waarden in één variabele zetten.

---

## Variabeletypes

Een variabele heeft een **type**.

Het type vertelt wat voor soort waarde erin zit.

### `int`

Een `int` is een geheel getal.

Voorbeelden:

```python
leeftijd = 15
aantal_punten = 120
```

### `float`

Een `float` is een kommagetal.

Voorbeelden:

```python
temperatuur = 18.5
gemiddelde = 6.75
```

### `string`

Een `string` is tekst, tussen aanhalingstekens.

Voorbeelden:

```python
naam = "Sam"
toestand = "OPEN"
```

### `boolean`

Een `boolean` heeft maar twee mogelijke waarden:

```text
True
False
```

Voorbeelden:

```python
ingelogd = True
deur_open = False
```

Je gebruikt een boolean vaak als uitkomst van een controle.

---

## Werken met lijsten

Een lijst zet je tussen vierkante haken:

```python
cijfers = [6.5, 7.0, 5.5, 8.0]
```

De lijst `cijfers` bevat vier waarden.

### Een waarde opvragen

Elke plek in de lijst heeft een **index**.

Let op: de eerste plek heeft index `0`.

```python
cijfers = [6.5, 7.0, 5.5, 8.0]

print(cijfers[0])
print(cijfers[2])
```

Uitvoer:

```text
6.5
5.5
```

### Een waarde aanpassen

```python
cijfers = [6.5, 7.0, 5.5, 8.0]
cijfers[2] = 6.0

print(cijfers)
```

Uitvoer:

```text
[6.5, 7.0, 6.0, 8.0]
```

### Een waarde toevoegen

```python
cijfers = [6.5, 7.0, 5.5]
cijfers.append(8.0)

print(cijfers)
```

Uitvoer:

```text
[6.5, 7.0, 5.5, 8.0]
```

### Lengte van een lijst

```python
cijfers = [6.5, 7.0, 5.5, 8.0]
print(len(cijfers))
```

Uitvoer:

```text
4
```

---

## Operatoren

Met operatoren laat je Python rekenen.

In dit hoofdstuk gebruiken we:

- `+` optellen
- `-` aftrekken
- `*` vermenigvuldigen
- `/` delen (kommagetal als uitkomst)
- `**` macht
- `//` gehele deling
- `%` rest bij deling

Voorbeelden:

```python
a = 17
b = 5

print(a + b)   # 22
print(a - b)   # 12
print(a * b)   # 85
print(a / b)   # 3.4
print(a ** b)  # 1419857
print(a // b)  # 3
print(a % b)   # 2
```

### Wanneer gebruik je `//` en `%`?

Stel: je wilt weten hoeveel complete teams van 4 je kunt maken met 18 leerlingen.

```python
leerlingen = 18
teamgrootte = 4

complete_teams = leerlingen // teamgrootte
over = leerlingen % teamgrootte

print(complete_teams)
print(over)
```

Uitvoer:

```text
4
2
```

Dus: 4 complete teams en 2 leerlingen over.

---

## Van losse stappen naar herhaling

Kijk naar deze code:

```python
scores = [120, 85, 220]

print(scores[0] * 2)
print(scores[1] * 2)
print(scores[2] * 2)
```

Dit werkt, maar je herhaalt bijna dezelfde regel steeds opnieuw.

Dat is een belangrijk signaal:

> Deze code is klaar voor een lus.

In het volgende hoofdstuk leer je hoe je dit met `for` en `while` korter, sneller en overzichtelijker maakt.

---

## De functie `range()`

De functie `range()` maakt een reeks getallen.

Dat is handig als je stap voor stap door indexen of getallen wilt gaan.

Belangrijk: het eindgetal telt niet mee.

```python
print(list(range(5)))
```

Uitvoer:

```text
[0, 1, 2, 3, 4]
```

Je kunt `range()` op drie manieren gebruiken:

```python
range(stop)          # van 0 tot stop-1
range(start, stop)   # van start tot stop-1
range(start, stop, stap)
```

Voorbeelden:

```python
print(list(range(2, 7)))
print(list(range(0, 11, 2)))
```

Uitvoer:

```text
[2, 3, 4, 5, 6]
[0, 2, 4, 6, 8, 10]
```

In dit hoofdstuk gebruik je `range()` vooral om indexen te begrijpen.
In hoofdstuk 4 gebruik je `range()` vaak samen met `for`.

---

## Willekeurige getallen met `random.randrange()`

Bij games en simulaties wil je vaak een willekeurig geheel getal.

Daarvoor gebruiken we:

```python
import random
```

en daarna:

```python
random.randrange(...)
```

Net als bij `range()` telt de stopwaarde niet mee.

Voorbeelden:

```python
import random

print(random.randrange(10))     # 0 t/m 9
print(random.randrange(1, 7))   # 1 t/m 6
print(random.randrange(0, 21, 5))  # 0, 5, 10, 15 of 20
```

Dit sluit goed aan bij lussen, omdat je bijvoorbeeld in elke herhaling een nieuwe willekeurige waarde kunt maken.

In dit boek gebruiken we hier `random.randrange()` en niet `random.random()`.

---

## Begrippenlijst

Aan het einde van deze week moet je de volgende begrippen kunnen uitleggen:

**Datastructuur**  
Een manier om gegevens geordend op te slaan.

**Lijst**  
Een datastructuur met meerdere waarden in een vaste volgorde.

**Index**  
De positie van een waarde in een lijst (de eerste index is 0).

**Type**  
De soort waarde van een variabele.

**`int`**  
Geheel getal.

**`float`**  
Kommagetal.

**`string`**  
Tekst tussen aanhalingstekens.

**`boolean`**  
Waarheidswaarde: `True` of `False`.

**Operator**  
Teken waarmee je een bewerking uitvoert, zoals optellen of delen.

**`range()`**  
Functie die een reeks getallen maakt, waarbij het eindgetal niet wordt meegenomen.

**`random.randrange()`**  
Functie uit de module `random` die een willekeurig geheel getal kiest binnen een bereik, waarbij de stopwaarde niet wordt meegenomen.

---

## Succescriteria

Aan het einde van dit hoofdstuk kun je:

- variabeletypes (`int`, `float`, `string`, `boolean`) herkennen en gebruiken;
- waarden uit lijsten lezen, aanpassen en toevoegen;
- berekeningen maken met `+`, `-`, `*`, `/`, `**`, `//`, `%`;
- `range()` en `random.randrange()` correct toepassen in eenvoudige programma's.

## Mini-rubric

| Onderdeel | Startend                       | Voldoende                                     | Sterk                                     |
| --------- | ------------------------------ | --------------------------------------------- | ----------------------------------------- |
| Begrijpen | Herkent enkele types/operaties | Legt types, lijsten en operatoren correct uit | Verbindt keuzes aan probleemsituaties     |
| Toepassen | Maakt kleine codefragmenten    | Schrijft werkende lijst- en rekenopgaven      | Combineert meerdere concepten foutarm     |
| Testen    | Probeert 1-2 waarden           | Test met meerdere waarden en varianten        | Test systematisch en verklaart uitkomsten |
| Uitleggen | Geeft losse antwoorden         | Licht keuzes in code duidelijk toe            | Onderbouwt alternatief aanpakken          |

---

# Opdrachten

**Kernroute (verplicht, circa 60% van de opgavenlast):** opdracht 1, 2, 4, 5, 6 en 10.  
**Plusroute (verdieping):** opdracht 3, 7, 8 en 9.

1. Type-herhaling (hoofdstuk 1 en 2)

   Gegeven zijn de variabelen:

   ```python
   toestand = "OPEN"
   temperatuur = 18.5
   leeftijd = 14
   is_ingelogd = True
   ```

   a. Schrijf bij elke variabele het type (`int`, `float`, `string`, `boolean`).

   b. Bedenk per variabele een nieuwe waarde met hetzelfde type.

   c. Maak één extra variabele van elk type.

---

2. Rekenen met operatoren

   Neem:

   ```python
   a = 29
   b = 6
   ```

   a. Bereken met Python:
   - `a + b`
   - `a - b`
   - `a * b`
   - `a / b`
   - `a ** 2`
   - `a // b`
   - `a % b`

   b. Schrijf bij elke uitkomst in woorden wat het betekent.

   c. Leg uit wat het verschil is tussen `/` en `//`.

---

3. Lijst met temperaturen (herhaling beslissingen)

   Je krijgt de lijst:

   ```python
   temperaturen = [-3, 0, 8, 16]
   ```

   Gebruik de regels uit hoofdstuk 2:
   - onder 0: `Het vriest.`
   - 0 t/m 15: `Het is koud.`
   - boven 15: `Het is niet koud.`

   a. Schrijf code die voor `temperaturen[0]` de juiste tekst print.

   b. Herhaal dat voor `temperaturen[1]`, `temperaturen[2]` en `temperaturen[3]`.

   c. Wat valt je op aan de code die je hebt herhaald?

   d. Schrijf in één zin waarom deze aanpak bij langere lijsten snel onoverzichtelijk wordt.

---

4. Gemiddelde van drie cijfers

   Gebruik een lijst:

   ```python
   cijfers = [6.5, 7.0, 5.5]
   ```

   a. Bereken het gemiddelde met `+` en `/`. Gebruik de cijferslijst met index, niet de letterlijke getallen.

   b. Print `voldoende` als het gemiddelde 5.5 of hoger is, anders `onvoldoende`.

   c. Verander de cijfers en test opnieuw met minstens drie sets.

---

5. Teams maken met `//` en `%`

   Een klas heeft 31 leerlingen. Je maakt teams van 4.

   a. Bereken het aantal complete teams.

   b. Bereken hoeveel leerlingen overblijven.

   c. Test opnieuw met teamgroottes 3 en 5.

   d. Leg uit waarom `%` nuttig is in dit soort problemen.

---

6. Scorelijst verbeteren

   Gegeven:

   ```python
   scores = [120, 85, 220, 40]
   ```

   a. Print de eerste score.

   b. Verhoog de tweede score met 15 punten.

   c. Voeg een nieuwe score toe aan het einde van de lijst.

   d. Print de hele lijst.

   e. Bereken handmatig de som van alle scores.

---

7. Van toestand naar lijst

   In hoofdstuk 1 werkte je met toestanden van een deur.

   Gebruik nu:

   ```python
   gebeurtenissen = ["openen", "sluiten", "openen"]
   toestand = "DICHT"
   ```

   a. Werk stap voor stap `gebeurtenissen[0]`, `gebeurtenissen[1]` en `gebeurtenissen[2]` af met `if` en `else`.

   b. Print na elke stap de nieuwe toestand.

   c. Waarom is dit een goede voorbereiding op het verwerken van langere reeksen gebeurtenissen?

---

8. Werken met een lijst prijzen

   Bekijk deze code:

   ```python
   prijzen = [2.5, 1.2, 3.0, 4.8]

   totaal = prijzen[0] + prijzen[1] + prijzen[2] + prijzen[3]
   print(totaal)
   ```

   a. Wat doet deze code?

   b. Welke regels zijn herhaling van hetzelfde idee?

   c. Schrijf in gewone taal een stappenplan om dit met meer prijzen uit te rekenen.

   d. Breid de lijst uit naar 6 prijzen en pas de berekening handmatig aan.

---

9. Oefenen met `range()`

   a. Schrijf op wat de uitvoer is van:

   ```python
   print(list(range(4)))
   print(list(range(3, 8)))
   print(list(range(1, 10, 3)))
   ```

   b. Maak een lijst met vijf nullen zonder die handmatig uit te typen. Gebruik `range()`.

   c. Een lijst is:

   ```python
   namen = ["Joep", "Niels", "Amyra", "Finn"]
   ```

   Schrijf code die met `range()` alle geldige indexen van deze lijst print.

---

10. Oefenen met `random.randrange()`

    Gebruik:

    ```python
    import random
    ```

    a. Schrijf code die één dobbelsteenworp simuleert met `random.randrange(1, 7)`.

    b. Simuleer daarna nog vier extra worpen en print alle vijf worpen onder elkaar.

    c. Bepaal met `//` en `%` van elke worp of het getal even of oneven is.

    d. Extra: maak een score tussen 0 en 100 in stappen van 5 met `random.randrange(0, 101, 5)`.

---

## Afronding

In dit hoofdstuk heb je geleerd hoe je gegevens niet alleen in losse variabelen, maar ook in lijsten kunt opslaan.

Je hebt gewerkt met de variabeletypes `int`, `float`, `string` en `boolean`, en je hebt berekeningen gemaakt met de operatoren:

```text
+  -  *  /  **  //  %
```

Ook heb je gezien dat je bij meerdere waarden snel dezelfde soort regels code herhaalt.

Dat is precies het punt waarop lussen belangrijk worden.

In hoofdstuk 4 leer je hoe je met `for` en `while` zulke herhaling slim en overzichtelijk programmeert.
