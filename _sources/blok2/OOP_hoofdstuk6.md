# Objectgeoriënteerd Programmeren Hoofdstuk 6: Start- en eindscherm

## Leerdoelen

Een goed spel begint niet meteen met het spelen. Vaak heb je een **startscherm** en later een **eindscherm**.

Je leert:

- hoe een startscherm werkt;
- hoe je een spel start en reset;
- hoe je een eindscherm maakt;
- hoe je een spel opnieuw kunt starten;
- hoe je de game-status beheert.

Aan het einde van dit hoofdstuk kun je een eenvoudige spelstaat ontwerpen met een startscherm en een game-over scherm.

---

## Waarom een startscherm?

Een startscherm laat de speler zien dat het spel klaar is om te starten.

Het is nuttig om:

- een titel te tonen;
- een knop te laten zien;
- de speler een keuze te geven.

Voorbeeld:

```text
START SPEL
SLUIT KNOP
```

---

## Spelstatus

De game hoeft niet altijd in dezelfde staat te zitten.

Je hebt bijvoorbeeld:

- `startscherm`
- `spelen`
- `game_over`

Deze toestanden kun je opslaan in een variabele.

```python
status = "startscherm"
```

Dan kun je in je loop checken welke toestand actief is.

---

## Starten van het spel

Als je op "Start" klikt, zet je de status op:

```python
status = "spelen"
```

Dan worden alle objecten opnieuw gemaakt en begint het spel.

```python
joost = Speler(100)
vijanden = []
```

---

## Eindscherm

Als de speler alle levens verlaat of een doel niet haalt, kun je de status aanpassen:

```python
status = "game_over"
```

Daarna kun je een scherm tonen met tekst zoals:

```text
GAME OVER
Druk op spatie om opnieuw te starten
```

---

## Resetten van het spel

Een reset is handig als je opnieuw wilt beginnen.

```python
if status == "game_over" and toets_ingedrukt:
    status = "startscherm"
```

Of je roept een functie aan die alle waarden terugzet.

```python
def start_game():
    speler = Speler()
    score = 0
    status = "spelen"
```

---

## Voorbeeld: simpele spelstatus

```python
status = "startscherm"

while True:
    if status == "startscherm":
        toon_startscherm()
    elif status == "spelen":
        update_spel()
    elif status == "game_over":
        toon_game_over()
```

Zo is het duidelijk wat het spel op ieder moment doet.

---

## Samenvatting

- Een startscherm helpt bij het openen van het spel.
- Een eindscherm laat de speler zien dat het spel is afgelopen.
- Je gebruikt statusvariabelen om verschillende schermen te regelen.
- Resetten en opnieuw starten maakt een spel beter te gebruiken.

## Check je begrip

1. Waarom heb je een startscherm?
2. Wat is een spelstatus?
3. Hoe kun je een game-over scherm laten zien?
4. Waarom is resetten handig?

## Afbeeldingen en bronnen

- Zelf maken: maak een schematische flowchart van startscherm → spel → game over.
- Online zoeken: [Game menu UI voorbeelden](https://www.youtube.com/results?search_query=game+menu+ui+start+screen)
- Online zoeken: [Pygame menu tutorial](https://www.pygame.org/docs/)
- Online zoeken: [Wikipedia: game state](https://en.wikipedia.org/wiki/Game_state)

# Opdrachten

**Kernroute (verplicht):** opdracht 1 en 2. **Plusroute:** opdracht 3.

1. Startscherm maken

   a. Teken een eenvoudig startscherm met tekst zoals `START SPEL`.
   b. Leg uit welke variabele je gebruikt om te onthouden in welke toestand het spel zich bevindt.
   c. Noem drie mogelijke toestanden van een simpel spel.

2. Eindscherm en reset

   a. Schrijf een korte structuur waarin het spel eerst een startscherm toont, daarna het spel en daarna een game-over scherm.
   b. Welke code zou je gebruiken om het spel opnieuw te starten?
   c. Waarom is het handig om statusvariabelen te gebruiken in plaats van losse losse `if`-checks?

3. Toepassingsvraag

   Je maakt een spel waarin een speler een level kan winnen of verliezen.

   a. Hoe kun je de status van het spel veranderen als het level is afgelopen?
   b. Waarom is een start- en eindscherm belangrijk voor een spelervaring?
   c. Noem een situatie waarin een reset van het spel logisch is.

### Inzichtsvragen

1. Wat is een spelstatus?
2. Waarom kun je het spel vergelijken met een machine met verschillende toestanden?
3. Hoe helpt een startscherm om een spel overzichtelijk te maken?
