# Objectgeoriënteerd Programmeren Hoofdstuk 5: Score en levens

## Leerdoelen

Een spel is leuker als je punten kunt verzamelen en levens kunt verliezen. Deze informatie moet in het programma worden bijgehouden.

Je leert:

- hoe je score kunt bijhouden;
- hoe je levens kunt opslaan;
- hoe je bij een treffen punten of schade geeft;
- hoe je een score op het scherm laat zien;
- hoe objecten samenwerken in een spel.

Aan het einde van dit hoofdstuk kun je een score en levens in een kleine game laten werken.

---

## Score

Een score is een getal dat bijhoudt hoeveel punten je hebt.

```python
punten = 0
```

Als je iets goed doet, kun je punten optellen:

```python
punten = punten + 10
```

Dat is precies wat je in een spel vaak doet.

---

## Levens

Levens geven aan hoe vaak een speler iets kan misgaan.

```python
levens = 3
```

Als een vijand je raakt, kun je levens verminderen:

```python
levens = levens - 1
```

Als levens 0 zijn, is het spel afgelopen.

---

## Samenwerken tussen objecten

In een game zijn score en levens geen losse variabelen. Ze horen vaak bij het spel of bij de speler.

```python
class Speler:
    def __init__(self):
        self.levens = 3
        self.score = 0
```

Als een vijand wordt geraakt, kun je de score veranderen.

```python
speler.score += 10
```

---

## Tekst op het scherm

Je kunt punten en levens ook laten zien in het spel.

```python
tekst = font.render("Score: " + str(punten), True, (0, 0, 0))
```

Dat is handig om de speler te informeren.

---

## Voorbeeld

```python
class Speler:
    def __init__(self):
        self.levens = 3
        self.score = 0

    def raak_gevangen(self):
        self.levens = self.levens - 1

    def verdien_punten(self, aantal):
        self.score = self.score + aantal
```

Nu kun je het spel laten reageren op acties.

---

## Samenvatting

- Score en levens zijn centrale spelgegevens.
- Je kunt punten toevoegen en levens aftrekken.
- Het is handig om deze gegevens bij een speler of bij het spel te bewaren.
- De speler moet kunnen zien wat zijn toestand is.

## Check je begrip

1. Wat is score?
2. Hoe kun je levens laten afnemen?
3. Waarom is `self` handig bij score en levens?
4. Waarom laat je de score op het scherm zien?

## Afbeeldingen en bronnen

- Zelf maken: maak een schematische scorebalk met levens en punten.
- Online zoeken: [Game HUD uitleg](https://www.youtube.com/results?search_query=game+hud+score+levens)
- Online zoeken: [Pygame font rendering](https://www.pygame.org/docs/ref/font.html)
- Online zoeken: [Wikipedia: heads-up display](https://nl.wikipedia.org/wiki/Heads-up_display)

# Opdrachten

**Kernroute (verplicht):** opdracht 1 en 2. **Plusroute:** opdracht 3.

1. Score en levens

   a. Maak een klasse `Speler` met `score` en `levens`.
   b. Schrijf een methode die 10 punten geeft als een vijand wordt verslagen.
   c. Schrijf een tweede methode die een leven aftrekt als een vijand een speler raakt.

2. Score tonen

   a. Leg uit waarom je score op het scherm wilt laten zien.
   b. Hoe kun je een score in tekst omzetten voor weergave?
   c. Waarom is het handig om score en levens bij de speler te bewaren?

3. Toepassingsvraag

   Je speelt een platformgame en je score is 150 punten, maar je hebt nog 1 leven over.

   a. Hoe kun je het spel laten reageren wanneer de laatste levenswaarde 0 wordt?
   b. Waarom is een duidelijke score belangrijk voor een game?
   c. Wat is het verschil tussen een score en een levenswaarde in een spel?

### Inzichtsvragen

1. Waarom is score een voorbeeld van data die bij een object hoort?
2. Welke invloed heeft een leven op de spelstatus?
3. Waarom is het fijn als een programma de status van de speler bijhoudt?
