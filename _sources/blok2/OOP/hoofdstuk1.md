# Objectgeoriënteerd Programmeren Hoofdstuk 1: Klassen en objecten

## Leerdoelen

In deze lessen ga je werken met **klassen** en **objecten**. Dat is het begin van object-georiënteerd programmeren.

Je leert:

- wat een klasse is;
- wat een object is;
- hoe je een object maakt;
- waarom klassen handig zijn in een spel of programma;
- hoe een klasse verschillende objecten kan beschrijven.

Aan het einde van dit hoofdstuk kun je een eenvoudige klasse ontwerpen en objecten daarvan maken.

---

## Wat is een klasse?

Een **klasse** is een blauwdruk.

Een blauwdruk beschrijft wat een object kan hebben en wat het kan doen.

Bijvoorbeeld:

```python
class Speler:
    def __init__(self, naam, levens):
        self.naam = naam
        self.levens = levens
```

Hier is `Speler` de klasse.

De klasse zegt: een speler heeft een naam en aantal levens.

---

## Wat is een object?

Een **object** is een concrete versie van die blauwdruk.

Zo maak je een object:

```python
joost = Speler("Joost", 3)
```

Nu is `joost` een object van de klasse `Speler`.

Het object heeft eigenschappen zoals:

```python
joost.naam
joost.levens
```

Een klasse kan meerdere objecten maken.

```python
amyra = Speler("Amyra", 5)
```

---

## Waarom zijn klassen handig?

Met klassen kun je veel gelijke dingen op een overzichtelijke manier maken.

In een spel heb je vaak veel vijanden, spelers of kogels.

Zonder klassen zou je elke speler apart moeten programmeren.

Met klassen kun je bijvoorbeeld één blauwdruk maken voor alle spelers.

```python
class Speler:
    def __init__(self, naam, score):
        self.naam = naam
        self.score = score
```

Dan kun je meerdere spelers aanmaken zonder de code steeds opnieuw te schrijven.

---

## Eigenschappen van een object

Eigenschappen noem je ook wel **attributen**.

In Python zet je attribuutwaarden in `self`.

```python
class Speler:
    def __init__(self, naam, snelheid):
        self.naam = naam
        self.snelheid = snelheid
```

Nu heeft elk object zijn eigen waarde voor `naam` en `snelheid`.

---

## Voorbeeld: een spelpersonage

```python
class SpelPersonage:
    def __init__(self, naam, hp, xpos):
        self.naam = naam
        self.hp = hp
        self.xpos = xpos

p1 = SpelPersonage("SuperTygo", 100, 10)
p2 = SpelPersonage("SuperFinn", 80, 200)
```

Nu zijn `p1` en `p2` twee verschillende objecten, maar ze hebben dezelfde structuur.

---

## Samenvatting

- Een klasse is een blauwdruk.
- Een object is een concrete instantie van die blauwdruk.
- Attributen beschrijven een object.
- Met klassen kun je meerdere vergelijkbare objecten maken.

## Check je begrip

1. Wat is het verschil tussen een klasse en een object?
2. Wat is een attribuut?
3. Hoe maak je een object aan?
4. Waarom is een klasse handig in een spel?

## Opdrachten

1. Klasse ontwerpen

   a. Maak een klasse `Vijand` met een attribuut `naam` en een attribuut `hp`.

   b. Maak twee verschillende objecten van deze klasse.

   c. Leg uit waarom het handig is om één klasse te gebruiken voor meerdere vijanden.

2. Objecten in een programma

   a. Schrijf een klein stukje code waarin je een speler maakt met een naam en levens.

   b. Zorg dat je twee verschillende spelers kunt maken.

   c. Noem één verschil tussen een klasse en een object.

3. Toepassingsvraag

   Je wilt een spel met meerdere kogels maken.

   a. Waarom is een klasse handig om kogels te modelleren?

   b. Noem twee kenmerken die een kogel kan hebben.

   c. Waarom is het niet handig om elke kogel apart handmatig te programmeren?

### Inzichtsvragen

1. Wat is een blauwdruk in een programma?
2. Waarom is een object niet hetzelfde als een klasse?
3. Hoe kun je een klasse als 'bouwplan' uitleggen?
