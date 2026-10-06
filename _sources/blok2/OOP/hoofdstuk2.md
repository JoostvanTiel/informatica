# Hoofdstuk 2: Eigenschappen en methoden

## Leerdoelen

In dit hoofdstuk leer je dat een klasse niet alleen gegevens bevat, maar ook acties kan uitvoeren. Die acties noem je **methoden**.

Je leert:

- wat een methode is;
- hoe je attributen en methoden combineert;
- wat `self` betekent;
- hoe een object zich kan gedragen;
- hoe je een methode aanroept.

Aan het einde van dit hoofdstuk kun je een klasse maken met eigenschappen en methoden die iets doen.

---

## Wat is een methode?

Een **methode** is een functie die bij een object hoort.

Een object heeft gegevens en kan ook handelingen uitvoeren.

Voorbeeld:

```python
class Man:
    def __init__(self, naam):
        self.naam = naam

    def groet(self):
        print("Hoi, ik ben", self.naam)
```

`groet()` is een methode.

Je roept die methode aan op het object:

```python
joost = Man("Joost")
joost.groet()
```

---

## `self` in Python

`self` verwijst naar het huidige object.

Het geeft aan:

```python
self.naam
```

Dat bedoelt: de `naam` van dit specifieke object.

Zonder `self` weet Python niet bij welk object de variabele hoort.

---

## Attributen en methoden samen

Een object kan zowel gegevens als gedrag hebben.

```python
class Speler:
    def __init__(self, naam, xp):
        self.naam = naam
        self.xp = xp

    def voeg_xp_toe(self, aantal):
        self.xp = self.xp + aantal
        print(self.naam, "heeft nu", self.xp, "XP")
```

Hier heeft het object een attribuut `xp` en een methode `voeg_xp_toe()`.

---

## Voorbeeld met een speler

```python
class Speler:
    def __init__(self, naam, hp):
        self.naam = naam
        self.hp = hp

    def ontvang_schade(self, schade):
        self.hp = self.hp - schade
        print(self.naam, "heeft nog", self.hp, "hp")

joost = Speler("Joost", 100)
joost.ontvang_schade(20)
```

De speler houdt zijn eigen levens bij.

---

## Waarom zijn methoden handig?

Methoden zorgen ervoor dat je gedrag in één plaats kunt zetten.

Dat maakt code:

- overzichtelijker;
- makkelijker te begrijpen;
- makkelijker te hergebruiken.

In een game kun je methoden gebruiken voor:

- bewegen;
- schieten;
- springen;
- punten verdienen;
- levens verliezen.

---

## Samenvatting

- Een methode is een functie die bij een object hoort.
- Attributen slaan gegevens op.
- Methoden veranderen of gebruiken die gegevens.
- `self` betekent: deze instantie van de klasse.

## Check je begrip

1. Wat is een methode?
2. Wat betekent `self`?
3. Hoe roep je een methode aan?
4. Waarom is het handig om gedrag in methoden te zetten?

## Afbeeldingen en bronnen

- Zelf maken: maak een schema met een object en verschillende methoden.
- Online zoeken: [Methoden in Python](https://www.youtube.com/results?search_query=python+methoden+class+self)
- Online zoeken: [Python object-oriented programming](https://docs.python.org/3/tutorial/classes.html)
- Online zoeken: [Wikipedia: objectgeoriënteerd programmeren](https://nl.wikipedia.org/wiki/Objectgeori%C3%ABnteerd_programmeren)



# Opdrachten

**Kernroute (verplicht):** opdracht 1 en 2. **Plusroute:** opdracht 3.

1. Methode schrijven

   a. Maak een klasse `Speler` met een attribuut `naam` en `score`.
   b. Voeg een methode `verdien_punten` toe die de score verhoogt.
   c. Roep deze methode aan en laat zien wat de score wordt.

2. Met `self` werken

   a. Leg uit wat `self` betekent in Python.
   b. Waarom kun je zonder `self` niet goed weten bij welk object je werkt?
   c. Schrijf een korte methode die een speler een schadepunt geeft.

3. Toepassingsvraag

   In een game raakt een speler een vijand.

   a. Welke methode zou je dan kunnen gebruiken?
   b. Wat gebeurt met de score of levens als de vijand wordt verslagen?
   c. Waarom is het handig om gedrag in methoden te stoppen?

### Inzichtsvragen

1. Wat is het verschil tussen een attribuut en een methode?
2. Waarom kun je methoden vergelijken met acties van een object?
3. Waarom is een object in Python vaak een 'dingen dat iets kan doen'?
