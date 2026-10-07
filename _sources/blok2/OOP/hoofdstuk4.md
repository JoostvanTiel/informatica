# Objectgeoriënteerd Programmeren Hoofdstuk 4: FPS en tijd

## Leerdoelen

In een spel is tijd belangrijk. Je wilt dat bewegingen vloeiend verlopen en dat de tijd goed wordt bijgehouden.

Je leert:

- wat FPS betekent;
- hoe een game-lus werkt;
- hoe je tijd in een spel bijhoudt;
- waarom `clock.tick(60)` belangrijk is;
- hoe je acties met tijd kunt aanpassen.

Aan het einde van dit hoofdstuk kun je uitleggen hoe een game de tijd en frames gebruikt om bewegingen te laten lopen.

---

## Wat is FPS?

**FPS** staat voor **frames per second**.

Dat betekent hoeveel beelden per seconde op het scherm worden ververst.

Bijvoorbeeld:

```text
60 FPS
```

Een game die 60 fps draait, lijkt erg vloeiend.

---

## De game-lus

Een game draait vaak in een lus:

```python
while True:
    # kijk naar toetsen
    # update de objecten
    # teken alles op het scherm
```

Deze lus wordt vele keren per seconde uitgevoerd.

Bij elke update wordt de toestand van het spel aangepast.

---

## `clock.tick(60)`

In Pygame gebruik je een klok:

```python
clock = pygame.time.Clock()
```

Dan kun je de snelheid regelen:

```python
clock.tick(60)
```

Dat betekent dat de game ongeveer 60 frames per seconde draait.

---

## Tijd bijhouden

Je kunt een teller maken voor de tijd:

```python
tijd = 0
```

In elke lus kun je de tijd verhogen:

```python
tijd += 1
```

Ook kun je de tijd gebruiken om een vijand elke paar seconden te laten spawnen.

---

## Voorbeeld: beweging afhankelijk van tijd

```python
speed = 2
x = 0

for i in range(100):
    x = x + speed
```

Als je per frame 2 pixels beweegt, dan gaat de speler snel over het scherm.

In een game is tijd dus belangrijk om bewegingen te synchroniseren.

---

## Samenvatting

- FPS geeft aan hoeveel beelden per seconde worden getoond.
- Een game werkt in een lus.
- De klok regelt de snelheid van de loop.
- Tijd helpt bij beweging, spawnen en updates.

## Check je begrip

1. Wat betekent FPS?
2. Waarom is een game-lus belangrijk?
3. Wat doet `clock.tick(60)`?
4. Waarom is tijd handig in een spel?

## Afbeeldingen en bronnen

- Zelf maken: teken een schema van een game-loop met update en render.
- Online zoeken: [Pygame game loop](https://www.youtube.com/results?search_query=pygame+game+loop+fps)
- Online zoeken: [Pygame Clock docs](https://www.pygame.org/docs/ref/time.html)
- Online zoeken: [Wikipedia: frames per second](https://nl.wikipedia.org/wiki/Frames_per_second)

## Opdrachten

**Kernroute (verplicht):** opdracht 1 en 2. **Plusroute:** opdracht 3.

1. FPS en game-lus

   a. Leg uit wat FPS betekent.
   b. Waarom is 60 FPS vaak een goede keuze voor een game?
   c. Noem een effect dat je ziet als de FPS laag is.

2. Tijd bijhouden

   a. Maak een variabele `tijd` en laat zien hoe je die per frame opvoert.
   b. Waarom is tijd handig om een vijand met een vaste snelheid te laten bewegen?
   c. Wat doet `clock.tick(60)` in Pygame?

3. Toepassingsvraag

   Je maakt een game waarin een enemy elke 2 seconden opnieuw verschijnt.

   a. Hoe kun je met tijd bepalen wanneer een nieuwe enemy verschijnt?
   b. Waarom is een vaste tijdsregel beter dan alleen een toevallige code?
   c. Leg uit waarom een game-lus belangrijk is voor beweging en weergave.

### Inzichtsvragen

1. Wat is een frame?
2. Wat gebeurt er met een game als de computer minder frames per seconde kan tekenen?
3. Waarom is tijd een belangrijk onderdeel van computerspellen?
