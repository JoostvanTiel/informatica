# Objectgeoriënteerd Programmeren Hoofdstuk 2: Methoden en Beweging

## Leerdoelen

In dit hoofdstuk leer je dat een klasse niet alleen gegevens bevat, maar ook acties kan uitvoeren. Die acties noem je **methoden**.

Nog belangrijker: je leert hoe je deze methoden gebruikt in een **werkende game-loop** zodat je spel werkelijk **beweegt en leeft**.

Je leert:

- wat een methode is;
- hoe je attributen en methoden combineert;
- wat `self` betekent;
- hoe een object zich kan gedragen;
- hoe je een methode aanroept;
- hoe je een **game-loop** bouwt;
- hoe je **snelheid** en **beweging** implementeert.

Aan het einde van dit hoofdstuk heb je een speler die je met pijltjes kunt besturen!

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

## Beweging in een game: Methoden in actie

Tot nu toe hebben we methoden gezien die iets afdrukken. Maar in een game moet je **objecten laten bewegen**.

Laten we een Speler-klasse maken met beweging:

```python
class Speler:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.breedte = 40
        self.hoogte = 50
        self.kleur = (255, 0, 0)  # Rood
        
        # Snelheid (pixels per frame)
        self.xSnelheid = 0
        self.ySnelheid = 0
    
    def move(self):
        """Update de positie op basis van snelheid."""
        self.x += self.xSnelheid
        self.y += self.ySnelheid
    
    def set_x_snelheid(self, snelheid):
        """Zet de horizontale snelheid."""
        self.xSnelheid = snelheid
    
    def draw(self, screen):
        """Teken de speler."""
        pygame.draw.rect(screen, self.kleur, [self.x, self.y, self.breedte, self.hoogte])
```

Let op wat hier gebeurt:

- De methode `move()` gebruikt `self.xSnelheid` en `self.ySnelheid`
- De methode `set_x_snelheid()` **verandert** de snelheid
- Deze methoden werken samen om beweging te realiseren

---

## De Game-Loop: Alles tot leven brengen

Een **game-loop** is het hart van elk spel. Het ziet er zo uit:

```
1. VERWERKEN → Kijk naar toetsenbord-input
2. UPDATE → Verplaats objecten, check botsingen
3. RENDEREN → Teken alles op het scherm
4. HERHAAL → Ga terug naar stap 1
```

Dit gebeurt ongeveer 60 keer per seconde!

### Een pygame game-loop

Hier is een compleet voorbeeld met beweging:

```python
import pygame

pygame.init()

# Constants
BREEDTE = 800
HOOGTE = 600
FPS = 60

# Kleuren
ZWART = (0, 0, 0)
GRIJS = (150, 150, 150)

# Scherm setup
screen = pygame.display.set_mode((BREEDTE, HOOGTE))
pygame.display.set_caption("Speler beweging")
clock = pygame.time.Clock()

# Speler aanmaken
speler = Speler(400, 500)

# Game loop
running = True
while running:
    # STAP 1: INPUT - Toetsenbord verwerken
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
        
        # Toets ingedrukt
        elif event.type == pygame.KEYDOWN:
            if event.key == pygame.K_LEFT:
                speler.set_x_snelheid(-7)  # Links bewegen
            elif event.key == pygame.K_RIGHT:
                speler.set_x_snelheid(7)   # Rechts bewegen
        
        # Toets losgelaten
        elif event.type == pygame.KEYUP:
            if event.key == pygame.K_LEFT or event.key == pygame.K_RIGHT:
                speler.set_x_snelheid(0)   # Stoppen
    
    # STAP 2: UPDATE - Beweeg de speler
    speler.move()
    
    # STAP 3: RENDER - Teken alles
    screen.fill(GRIJS)
    speler.draw(screen)
    pygame.display.flip()
    
    # Houd FPS constante op 60
    clock.tick(FPS)

pygame.quit()
```

### Wat gebeurt hier regel voor regel?

**INPUT:**
- We controleren of KEYDOWN- of KEYUP-events plaatsvinden
- Als LEFT ingedrukt is, zetten we `xSnelheid` op -7 (naar links)
- Als RIGHT ingedrukt is, zetten we `xSnelheid` op 7 (naar rechts)
- Als losgelaten, zetten we `xSnelheid` op 0 (stoppen)

**UPDATE:**
- We roepen `speler.move()` aan
- Dit voert uit: `self.x += self.xSnelheid`
- Dus elke frame beweegt de speler een beetje

**RENDER:**
- We vullen het scherm grijs
- We tekenen de speler
- We verversen het scherm met `pygame.display.flip()`

**TIMING:**
- `clock.tick(FPS)` zorgt dat dit 60 keer per seconde gebeurt

**Resultaat:** Een speler die vloeiend beweegt als je pijltjes indrukt!

---

## FPS: Frames Per Second

**FPS** staat voor Frames Per Second. Dit is hoe vaak je scherm per seconde ververst wordt.

```python
clock = pygame.time.Clock()
clock.tick(60)  # 60 frames per seconde
```

Met `clock.tick(60)` run je game op **60 FPS**.

Dit zorgt ervoor dat:
- De beweging vloeiend is
- De game op elke computer even snel loopt
- Je niet "hardloopt" door je code heen

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

- **bewegen** (de `move()` methode);
- schieten;
- springen;
- punten verdienen;
- levens verliezen.

---

## Samenvatting

- Een methode is een functie die bij een object hoort.
- Attributen slaan gegevens op (bijv. `xSnelheid`).
- Methoden veranderen of gebruiken die gegevens (bijv. `move()`).
- `self` betekent: deze instantie van de klasse.
- Een **game-loop** herhaalt INPUT → UPDATE → RENDER elke frame.
- **FPS** bepaalt hoe snel de loop draait (bijv. 60 keer per seconde).

## Check je begrip

1. Wat is een methode?
2. Wat betekent `self`?
3. Hoe roep je een methode aan?
4. Waarom is het handig om gedrag in methoden te zetten?
5. Wat zijn de drie stappen van een game-loop?
6. Wat doet `clock.tick(60)`?
7. Hoe zorg je dat een speler beweegt naar links?

## Opdrachten

1. **Game-loop met beweging**

   <ol type='a'>
   <li>Maak een Speler-klasse met attributen `x`, `y`, `xSnelheid`.</li>
   <li>Voeg de methoden `move()` en `set_x_snelheid()` toe.</li>
   <li>Bouw een game-loop die de speler met pijltjes bestuurbaar maakt.</li>
   <li>Zorg dat de speler van links naar rechts kan bewegen.</li>
   </ol>

2. **Met `self` werken**

   <ol type='a'>
   <li>Leg uit wat `self` betekent in je beweging-programma.</li>
   <li>Wat zou er fout gaan als je `self` vergat in je `move()` methode?</li>
   <li>Waarom is het belangrijk dat elke speler zijn eigen `xSnelheid` heeft?</li>
   </ol>

3. **Toepassingsvraag: Verticale beweging**

   Je wilt dat je speler ook omhoog en omlaag kan bewegen (niet alleen links-rechts).

   <ol type='a'>
   <li>Voeg `ySnelheid` toe aan je Speler-klasse.</li>
   <li>Zorg dat pijl omhoog/omlaag ook werkt.</li>
   <li>Zorg dat de speler niet buiten het scherm kan gaan.</li>
   </ol>

4. **FPS begrijpen**

   <ol type='a'>
   <li>Wat gebeurt er met je speler als je `clock.tick(60)` verandert in `clock.tick(30)`?</li>
   <li>Waarom is een consistente FPS belangrijk in een game?</li>
   <li>Hoeveel pixels beweegt je speler per seconde als `xSnelheid = 7` en FPS = 60?</li>
   </ol>

### Inzichtsvragen

1. Wat is het verschil tussen een attribuut en een methode?
2. Waarom kun je methoden vergelijken met acties van een object?
3. Waarom stopt de speler van bewegen als je de toets loslaat?
4. Hoe zorgt `set_x_snelheid()` voor vloeiende beweging?
