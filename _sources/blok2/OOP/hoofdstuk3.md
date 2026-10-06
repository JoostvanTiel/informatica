# Hoofdstuk 3: Lijsten van objecten

## Leerdoelen

In een spel heb je vaak meerdere objecten tegelijk: vijanden, kogels, muren en spelers. Die kun je handig in een lijst bewaren.

Je leert:

- hoe je meerdere objecten in een lijst zet;
- hoe je over een lijst van objecten kunt lopen;
- hoe je objecten kunt toevoegen en verwijderen;
- waarom lijsten handig zijn in een game.

Aan het einde van dit hoofdstuk kun je een lijst van objecten gebruiken om een kleine game te maken.

---

## Waarom een lijst?

We willen vaak niet één object, maar meerdere.

Bijvoorbeeld:

```python
vijanden = []
```

Daarin kunnen we meerdere vijanden opslaan.

```python
vijand1 = Vijand("Enemy 1")
vijand2 = Vijand("Enemy 2")
vijanden = [vijand1, vijand2]
```

Nu kunnen we alle vijanden tegelijk verwerken.

---

## Over een lijst lopen

Met een `for`-lus kun je door een lijst van objecten heen gaan.

```python
for vijand in vijanden:
    vijand.beweeg()
```

Zo kun je voor elk object dezelfde actie uitvoeren.

---

## Objecten toevoegen

Je kunt nieuwe objecten aan een lijst toevoegen met `append()`.

```python
vijanden.append(Vijand("Enemy 3"))
```

Dat is handig als nieuwe enemies ontstaan in de game.

---

## Objecten verwijderen

Als een object verdwijnt, kun je het weer uit de lijst halen.

```python
vijanden.pop(0)
```

Of je kunt een object markeren en later verwijderen.

Dit is handig bij kogels, vijanden of munitie in een spel.

---

## Voorbeeld: lijst met kogels

```python
kogels = []

class Kogel:
    def __init__(self, x):
        self.x = x

    def beweeg(self):
        self.x += 5

kogels.append(Kogel(10))
kogels.append(Kogel(50))

for kogel in kogels:
    kogel.beweeg()
```

Nu beweegt elke kogel op zijn eigen manier.

---

## Samenvatting

- Lijsten kunnen meerdere objecten bevatten.
- Je kunt met een lus alle objecten verwerken.
- Nieuwe objecten kunnen worden toegevoegd.
- Verwijderde objecten kunnen uit de lijst worden gehaald.

## Check je begrip

1. Waarom gebruik je een lijst voor meerdere objecten?
2. Hoe voeg je een object toe aan een lijst?
3. Hoe loop je over alle objecten in een lijst?
4. Waarom is dit handig in een game?

## Afbeeldingen en bronnen

- Zelf maken: teken een lijst met 3 vijanden en laat zien hoe je ze in een lus verwerkt.
- Online zoeken: [Python lists tutorial](https://www.youtube.com/results?search_query=python+lists+objects)
- Online zoeken: [Python list documentation](https://docs.python.org/3/library/stdtypes.html#lists)
- Online zoeken: [Wikipedia: array (informatica)](https://nl.wikipedia.org/wiki/Array)



# Opdrachten

**Kernroute (verplicht):** opdracht 1 en 2. **Plusroute:** opdracht 3.

1. Lijst met objecten

   a. Maak een lijst met drie vijanden.
   b. Gebruik een `for`-lus om over alle vijanden heen te lopen.
   c. Leg uit waarom een lijst handig is bij een game met meerdere enemies.

2. Voorwerp toevoegen en verwijderen

   a. Voeg een nieuwe vijand toe aan een lijst met `append()`.
   b. Laat zien hoe je een object uit een lijst kunt verwijderen.
   c. Waarom kun je een lijst beter gebruiken dan losse variabelen als je veel objecten hebt?

3. Toepassingsvraag

   Een spel spawnt elke paar seconden een nieuwe vijand.

   a. Hoe kun je nieuw gemaakte vijanden in een lijst zetten?
   b. Wat gebeurt er als de speler een vijand verslaat?
   c. Waarom is het handig om een lijst van objecten in een game bij te houden?

### Inzichtsvragen

1. Wat is het voordeel van een lijst van objecten?
2. Waarom kun je met één lus meerdere objecten tegelijk bewerken?
3. Wat is het verschil tussen één object en een lijst van objecten?
