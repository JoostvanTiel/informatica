# Hoofdstuk 4: Lussen

## Leerdoelen

In hoofdstuk 1, 2 en 3 heb je geleerd hoe je informatie bewaart in variabelen, beslissingen neemt met `if` en werkt met lijsten, `range()` en `random.randrange()`.

In dit hoofdstuk leer je hoe je stappen automatisch herhaalt met lussen.

Je leert:

- wat een lus is en waarom lussen nodig zijn;
- het verschil tussen `for` en `while`;
- hoe je `range()` gebruikt in een `for`-lus;
- hoe een teller werkt in een `while`-lus;
- hoe je met lussen totalen, aantallen en patronen maakt;
- hoe je eenvoudige geneste lussen (een lus in een lus) gebruikt;
- hoe je een lus ontwerpt met een stroomdiagram;
- hoe je oneindige lussen voorkomt.

Aan het einde van dit hoofdstuk kun je herhalende taken met `for` en `while` programmeren en kun je eenvoudige patroonproblemen oplossen als voorbereiding op het volgende hoofdstuk.

---

## Waarom lussen?

Kijk naar deze code:

```python
print("Welkom")
print("Welkom")
print("Welkom")
print("Welkom")
print("Welkom")
```

Dit werkt, maar je herhaalt steeds dezelfde regel.

Met een lus kan de computer die herhaling voor jou doen.

Een **lus** betekent:

> voer een of meer instructies meerdere keren uit.

---

## Twee soorten lussen

In Python gebruiken we hier twee basisvormen:

1. `for`-lus
2. `while`-lus

De keuze hangt af van je probleem.

Gebruik meestal:

- `for` als je van tevoren weet hoe vaak je wilt herhalen;
- `while` als je doorgaat totdat een voorwaarde niet meer waar is.

---

## De `for`-lus

Een `for`-lus loopt vaak door een reeks getallen met `range()`.

Voorbeeld:

```python
for i in range(5):
		print("Welkom")
```

Uitvoer:

```text
Welkom
Welkom
Welkom
Welkom
Welkom
```

### Wat gebeurt er precies?

In `range(5)` zitten de waarden:

```text
0, 1, 2, 3, 4
```

De variabele `i` krijgt die waarden één voor één.

Voor elke waarde wordt het blok met inspringing uitgevoerd.

```python
for i in range(5):
		print(i)
```

Uitvoer:

```text
0
1
2
3
4
```

### Stroomdiagram van een `for`-lus

```text
START
	|
	v
Zet i op eerste waarde uit range
	|
	v
Is er nog een volgende waarde?
	| ja
	v
Voer lusblok uit
	|
	v
Neem volgende waarde van i
	|
	+------ terug naar controle ------+
	|
	nee
	v
EINDE
```

---

## `range()` in een `for`-lus

Je kent `range()` al uit hoofdstuk 3.

Nu gebruiken we die in lussen:

```python
for i in range(2, 7):
		print(i)
```

Uitvoer:

```text
2
3
4
5
6
```

Met stapgrootte:

```python
for i in range(0, 11, 2):
		print(i)
```

Uitvoer:

```text
0
2
4
6
8
10
```

---

## De `while`-lus

Een `while`-lus herhaalt zolang een voorwaarde waar is.

Voorbeeld:

```python
teller = 0

while teller < 5:
		print(teller)
		teller = teller + 1
```

Uitvoer:

```text
0
1
2
3
4
```

Belangrijk:

Als je `teller` niet verhoogt, blijft de voorwaarde waar en krijg je een oneindige lus.

### Stroomdiagram van een `while`-lus

```text
START
	|
	v
Initialiseer variabele(n)
	|
	v
Voorwaarde waar?
	| ja
	v
Voer lusblok uit
	|
	v
Pas variabele(n) aan
	|
	+------ terug naar controle ------+
	|
	nee
	v
EINDE
```

---

## `for` of `while`?

Beide kunnen vaak hetzelfde.

Voorbeeld met `for`:

```python
for i in range(5):
		print(i)
```

Zelfde idee met `while`:

```python
i = 0
while i < 5:
		print(i)
		i = i + 1
```

In de praktijk kies je meestal `for` bij een vaste reeks en `while` bij een voorwaarde.

---

## Lussen met lijsten

In hoofdstuk 3 werkte je al met lijsten.

Nu kun je door een lijst lopen met indexen:

```python
scores = [120, 85, 220, 40]

for i in range(len(scores)):
		print(scores[i])
```

Uitvoer:

```text
120
85
220
40
```

En je kunt waarden verwerken:

```python
scores = [120, 85, 220, 40]
totaal = 0

for i in range(len(scores)):
		totaal = totaal + scores[i]

print(totaal)
```

Uitvoer:

```text
465
```

---

## Lussen met `random.randrange()`

In hoofdstuk 3 heb je `random.randrange()` gezien.

Samen met lussen kun je meerdere willekeurige waarden maken.

```python
import random

for i in range(5):
		worp = random.randrange(1, 7)
		print(worp)
```

Dit simuleert vijf dobbelsteenworpen.

Je kunt tellers combineren met beslissingen uit hoofdstuk 2:

```python
import random

aantal_zessen = 0

for i in range(20):
		worp = random.randrange(1, 7)
		if worp == 6:
				aantal_zessen = aantal_zessen + 1

print(aantal_zessen)
```

---

## Geneste lussen

Een **geneste lus** is een lus binnen een andere lus.

Dat gebruik je vaak voor patronen en tabellen.

Voorbeeld: 3 regels met 5 sterretjes.

```python
for rij in range(3):
		for kolom in range(5):
				print("*", end=" ")
		print()
```

Uitvoer:

```text
* * * * *
* * * * *
* * * * *
```

### Stroomdiagram van geneste lussen (globaal)

```text
START
	|
	v
Start buitenste lus (rij)
	|
	v
Start binnenste lus (kolom)
	|
	v
Print element
	|
	v
Binnenste lus klaar?
	| nee -> terug naar print element
	| ja
	v
Nieuwe regel
	|
	v
Buitenste lus klaar?
	| nee -> terug naar binnenste lus
	| ja
	v
EINDE
```

---

## Veelgemaakte fouten

1. Vergeten in te springen

   Alles wat bij de lus hoort, moet ingesprongen staan.

2. Foute `range()`-grens

   De stopwaarde telt niet mee.

3. Teller niet aanpassen in `while`

   Dan stopt de lus niet.

4. Buiten de lijst gaan

   Bij indexen moet je binnen `0` tot en met `len(lijst) - 1` blijven.

---

## Begrippenlijst

Aan het einde van deze week moet je de volgende begrippen kunnen uitleggen:

**Lus**  
Een instructie waarmee je code herhaald uitvoert.

**`for`-lus**  
Lus die door een reeks waarden loopt.

**`while`-lus**  
Lus die doorgaat zolang een voorwaarde waar is.

**Teller**  
Variabele die bijhoudt hoeveel stappen zijn uitgevoerd.

**Accumulator**  
Variabele waarin je tijdens een lus een totaal opbouwt.

**Geneste lus**  
Een lus binnen een andere lus.

**Oneindige lus**  
Een lus die niet stopt.

---

# Opdrachten

1. Eerste `for`-lus

   a. Schrijf code die 10 keer `Hallo` print met een `for`-lus.

   b. Schrijf code die de getallen 0 t/m 9 print, elk op een nieuwe regel.

   c. Pas je code aan zodat alleen de even getallen van 0 t/m 20 worden geprint.

---

2. `range()` goed begrijpen

   Voorspel eerst de uitvoer, voer daarna uit.

   a.

   ```python
   for i in range(5):
   		 print(i)
   ```

   b.

   ```python
   for i in range(2, 8):
   		 print(i)
   ```

   c.

   ```python
   for i in range(10, 0, -2):
   		 print(i)
   ```

   d. Leg uit waarom de stopwaarde niet wordt geprint.

---

3. Eerste `while`-lus

   a. Schrijf een `while`-lus die de getallen 1 t/m 5 print.

   b. Schrijf dezelfde opdracht met een `for`-lus.

   c. Wat is in jouw code het grootste verschil tussen beide oplossingen?

---

4. Som en gemiddelde (aansluiting op hoofdstuk 2 en 3)

   Gegeven:

   ```python
   cijfers = [6.5, 7.0, 5.5, 8.0, 4.5]
   ```

   a. Bereken met een lus de som van alle cijfers.

   b. Bereken daarna het gemiddelde.

   c. Print `voldoende` als het gemiddelde 5.5 of hoger is, anders `onvoldoende`.

---

5. Toestand verwerken in herhaling

   Gegeven:

   ```python
   gebeurtenissen = ["openen", "sluiten", "openen", "openen", "sluiten"]
   toestand = "DICHT"
   ```

   a. Verwerk de gebeurtenissen met een lus.

   b. Gebruik `if` en `elif` om de toestand te veranderen.

   c. Print na elke gebeurtenis de toestand.

---

6. Willekeurige worpen

   Gebruik:

   ```python
   import random
   ```

   a. Simuleer 20 dobbelsteenworpen met `random.randrange(1, 7)`.

   b. Tel hoeveel keer een 6 voorkomt.

   c. Tel ook hoeveel worpen even en hoeveel worpen oneven zijn.

   d. Welke operator uit hoofdstuk 3 gebruik je om even/oneven te bepalen?

---

7. Sterretjes in regels

   a. Print met een lus precies deze regel:

   ```text
   * * * * * * * * * *
   ```

   b. Print daarna drie regels met respectievelijk 10, 5 en 20 sterretjes.

   c. Gebruik voor elk patroon lussen, niet een kant-en-klare tekststring.

---

8. Rechthoeken met geneste lussen

   a. Print een rechthoek van 10 bij 10 sterretjes.

   b. Print een rechthoek van 5 bij 10 sterretjes.

   c. Print een rechthoek van 20 bij 5 sterretjes.

   d. Welke `range()` bepaalt het aantal rijen en welke het aantal kolommen?

---

9. Nummerpatroon

   Print met geneste lussen een blok van 10 regels.

   Elke regel bevat:

   ```text
   0 1 2 3 4 5 6 7 8 9
   ```

   Tip: bouw eerst een lus die precies één regel print.

---

10. Driehoek met getallen

    Print:

    ```text
    0
    0 1
    0 1 2
    0 1 2 3
    0 1 2 3 4
    0 1 2 3 4 5
    0 1 2 3 4 5 6
    0 1 2 3 4 5 6 7
    0 1 2 3 4 5 6 7 8
    0 1 2 3 4 5 6 7 8 9
    ```

    a. Gebruik twee geneste lussen.

    b. Leg uit waarom de binnenste `range()` nu afhangt van de buitenste teller.

---

11. Vermenigvuldigingstabel 1 t/m 9

    Maak een tabel waarbij elke regel de veelvouden van een getal laat zien.

    Begin met:

    ```text
    1 2 3 4 5 6 7 8 9
    ```

    en eindig met:

    ```text
    9 18 27 36 45 54 63 72 81
    ```

    a. Gebruik geneste lussen.

    b. Gebruik de operator `*` voor de berekening.

    c. Extra: zorg dat getallen onder elkaar netjes uitgelijnd staan.

---

12. Ontwerp-opdracht

    Bedenk een eigen programma met minimaal:
    - één lijst;
    - één `for`-lus;
    - één beslissing met `if`;
    - één berekening met een operator uit hoofdstuk 3;
    - duidelijke uitvoer met `print`.

    Mogelijke ideeën:
    - score-analyse van een game;
    - simulatie van dobbelsteenworpen;
    - verwerking van een lijst met temperaturen;
    - controle van toestanden in een reeks gebeurtenissen.

    Lever in:
    1. je probleemomschrijving;
    2. je code;
    3. minstens drie testgevallen met verwachte en echte uitvoer.

---

## Afronding

In dit hoofdstuk heb je geleerd hoe je met lussen herhaling in programma's slim oplost.

Je hebt gewerkt met `for`, `while`, `range()`, `random.randrange()` en geneste lussen.

Ook heb je eerdere kennis toegepast: variabelen, lijsten, beslissingen en operatoren.

Daardoor kun je nu niet alleen losse opdrachten oplossen, maar ook grotere patronen, tabellen en simulaties bouwen.

In het volgende hoofdstuk ga je deze vaardigheden verder uitdiepen met uitdagende lusproblemen waarin nauwkeurig denken en stap-voor-stap ontwerpen centraal staan.
