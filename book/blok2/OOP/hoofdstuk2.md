# Objectgeoriënteerd Programmeren Hoofdstuk 2: Methoden en Beweging

## Leerdoelen

Nu gaan we **methoden** introduceren: dingen die objecten kunnen **doen**.

Plus: we maken onze objecten **zichtbaar** met **pygame** én **sprites**!

Je leert:

- **Wat een methode is** (functie in een klasse)
- **Game-loop begrijpen** (INPUT → UPDATE → RENDER)
- **Pygame-basics** (window, events, display)
- **Sprite laden** (pixelart voor de speler)
- **Andere objecten tekenen** met `pygame.draw.rect()`
- **Toetsenbordbesturing** implementeren
- **FPS beheren** (frames per seconde)

Aan het einde van dit hoofstuk:
- Heeft je speler visueel een sprite
- Kun je hem met pijltjestoetsen bewegen
- Lopen andere objecten mee in je game

---

## Wat is een Methode?

Een **methode** is een **functie in een klasse**. Het beschrijft wat een object kan **doen**.

### Voorbeeld

```python
class Speler:
    def __init__(self, naam, x, y):
        self.naam = naam
        self.x = x
        self.y = y
        self.levens = 3
    
    # Dit is een METHODE (functie in klasse)
    def verdien_punten(self, aantal):
        self.score += aantal
        print(self.naam, "wint", aantal, "punten!")
    
    def verlies_leven(self):
        self.levens -= 1
        print(self.naam, "heeft nu", self.levens, "levens")
```

Zie je? De klasse zegt niet alleen **wat** een speler is (naam, x, y), maar ook **wat hij kan doen** (punten verdienen, levens verliezen).

### Methoden aanroepen

```python
speler = Speler("Mario", 50, 100)
speler.verdien_punten(10)      # Output: Mario wint 10 punten!
speler.verdien_punten(20)      # Output: Mario wint 20 punten!
speler.verlies_leven()         # Output: Mario heeft nu 2 levens
```

---

## De Game-Loop: Hoe Games Werken

Elke game loopt in een **loop**. Dit gebeurt ~60 keer per seconde:

```
INPUT → UPDATE → RENDER → WAIT
```

**INPUT:** Wat drukt de speler (pijltjes, spatiebalk)?  
**UPDATE:** Verander positie, collision, score, etc.  
**RENDER:** Teken alles op het scherm.  
**WAIT:** Wacht tot volgende frame (60 FPS = 16ms per frame).

```python
while spel_loopt:
    # INPUT
    for event in pygame.event.get():
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_LEFT:
                speler.x -= 5  # Speler naar links
    
    # UPDATE
    # (Zwaartekracht, collision, etc. komen later)
    
    # RENDER
    screen.fill((150, 150, 150))  # Achtergrond
    # Teken speler, platforms, etc.
    pygame.display.flip()
    
    # WAIT
    clock.tick(60)  # 60 FPS
```

Dit is het **hart van elke game**!

---

## Pygame Installeren en Starten

### Stap 1: Installeer Pygame

```bash
pip install pygame
```

### Stap 2: Basis pygame-setup

```python
import pygame

pygame.init()

# Scherm-afmetingen
BREEDTE = 800
HOOGTE = 600

# Maak venster
screen = pygame.display.set_mode((BREEDTE, HOOGTE))
pygame.display.set_caption("Stick Hero's Quest")

# Clock voor FPS
clock = pygame.time.Clock()

# Game-loop
running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
    
    # Vul scherm met grijs
    screen.fill((150, 150, 150))
    
    # Update display
    pygame.display.flip()
    
    # 60 FPS
    clock.tick(60)

pygame.quit()
```

Run dit. Je ziet een grijs venster. Druk ESCAPE om af te sluiten.

---

## Sprites: Pixel-Art Laden

Nu gaat het interessant! We laden een **sprite** (afbeelding) in plaats van vierkantjes te tekenen.

### Stap 1: Een Sprite Maken

Maak zelf een eenvoudig pixelart poppetje in een grafische tool (bijv. Aseprite, Piskel of Paint):
- **Grootte:** 32x48 pixels (standaard platformer-speler)
- **Format:** PNG (met transparantie)
- **Naam:** `speler.png`

Sla het op in dezelfde map als je `.py`-bestand.

**Voorbeeld:** Een rood poppetje van 32x48 pixels met witte ogen.

### Stap 2: Sprite in Klasse Laden

Update je Speler-klasse:

```python
class Speler:
    def __init__(self, x, y, sprite_path):
        # Positie
        self.x = x
        self.y = y
        
        # Sprite laden
        self.afbeelding = pygame.image.load(sprite_path)
        self.rect = self.afbeelding.get_rect()
        self.rect.x = self.x
        self.rect.y = self.y
        
        # Game-stats
        self.levens = 3
        self.score = 0
    
    def draw(self, screen):
        """Teken de speler op het scherm."""
        self.rect.x = self.x
        self.rect.y = self.y
        screen.blit(self.afbeelding, self.rect)
    
    def move_left(self):
        """Speler gaat naar links."""
        self.x -= 7
    
    def move_right(self):
        """Speler gaat naar rechts."""
        self.x += 7
```

**Wat gebeurt hier?**
- `pygame.image.load()` laadt de sprite van schijf
- `get_rect()` geeft een rechthoek (voor positionering)
- `screen.blit()` plakt de afbeelding op het scherm
- `move_left/move_right` zijn methoden om te bewegen

### Stap 3: Speler Gebruiken in Game-Loop

```python
import pygame

pygame.init()

BREEDTE = 800
HOOGTE = 600
screen = pygame.display.set_mode((BREEDTE, HOOGTE))
pygame.display.set_caption("Stick Hero's Quest")
clock = pygame.time.Clock()

# Maak speler (laadt sprite automatisch)
speler = Speler(100, 500, "speler.png")

running = True
while running:
    # INPUT
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
        
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_LEFT:
                speler.move_left()
            elif event.key == pygame.K_RIGHT:
                speler.move_right()
    
    # Grenzen checken (speler kan niet uit scherm lopen)
    if speler.x < 0:
        speler.x = 0
    if speler.x + 32 > BREEDTE:
        speler.x = BREEDTE - 32
    
    # RENDER
    screen.fill((150, 150, 150))
    speler.draw(screen)
    pygame.display.flip()
    
    # WAIT
    clock.tick(60)

pygame.quit()
```

**Test het:** Run het programma, druk pijltjes, je sprite beweegt!

---

## Platforms Tekenen met `draw()`

Terwijl de speler een **sprite** is, tekenen we platforms met `pygame.draw.rect()`:

```python
class Platform:
    def __init__(self, x, y, breedte, hoogte, kleur=(0, 200, 100)):
        self.x = x
        self.y = y
        self.breedte = breedte
        self.hoogte = hoogte
        self.kleur = kleur
    
    def draw(self, screen):
        """Teken platform als rechthoek."""
        pygame.draw.rect(screen, self.kleur, [self.x, self.y, self.breedte, self.hoogte])
        # Zwarte border
        pygame.draw.rect(screen, (0, 0, 0), [self.x, self.y, self.breedte, self.hoogte], 2)
```

Gebruik in game-loop:

```python
# Maak platforms
platforms = [
    Platform(0, 550, 800, 50),      # Grond
    Platform(100, 450, 200, 25),    # Platform 1
    Platform(450, 350, 250, 25),    # Platform 2
]

# In game-loop (RENDER gedeelte):
for platform in platforms:
    platform.draw(screen)
```

---

## Munten Tekenen

Munten tekenen we als gele cirkels:

```python
class Munt:
    def __init__(self, x, y, waarde=10):
        self.x = x
        self.y = y
        self.radius = 8
        self.waarde = waarde
    
    def draw(self, screen):
        """Teken munt als cirkel."""
        pygame.draw.circle(screen, (255, 255, 0), [int(self.x), int(self.y)], self.radius)
```

Gebruik:

```python
munten = [
    Munt(200, 400),
    Munt(575, 300),
    Munt(275, 200),
]

# In game-loop:
for munt in munten:
    munt.draw(screen)
```

---

## Complete Voorbeeld: Bewegende Speler

```python
import pygame

pygame.init()

BREEDTE = 800
HOOGTE = 600
screen = pygame.display.set_mode((BREEDTE, HOOGTE))
pygame.display.set_caption("Stick Hero's Quest")
clock = pygame.time.Clock()

class Speler:
    def __init__(self, x, y, sprite_path):
        self.x = x
        self.y = y
        self.afbeelding = pygame.image.load(sprite_path)
        self.rect = self.afbeelding.get_rect()
        self.levens = 3
    
    def move_left(self):
        self.x -= 7
    
    def move_right(self):
        self.x += 7
    
    def draw(self, screen):
        self.rect.x = self.x
        self.rect.y = self.y
        screen.blit(self.afbeelding, self.rect)

class Platform:
    def __init__(self, x, y, breedte, hoogte):
        self.x = x
        self.y = y
        self.breedte = breedte
        self.hoogte = hoogte
    
    def draw(self, screen):
        pygame.draw.rect(screen, (0, 200, 100), [self.x, self.y, self.breedte, self.hoogte])
        pygame.draw.rect(screen, (0, 0, 0), [self.x, self.y, self.breedte, self.hoogte], 2)

class Munt:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.radius = 8
    
    def draw(self, screen):
        pygame.draw.circle(screen, (255, 255, 0), [int(self.x), int(self.y)], self.radius)

# Game-setup
speler = Speler(50, 500, "speler.png")
platforms = [
    Platform(0, 550, 800, 50),
    Platform(100, 450, 200, 25),
    Platform(450, 350, 250, 25),
]
munten = [
    Munt(200, 400),
    Munt(575, 300),
    Munt(275, 200),
]

# Game-loop
running = True
while running:
    # INPUT
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
        
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_LEFT:
                speler.move_left()
            elif event.key == pygame.K_RIGHT:
                speler.move_right()
    
    # Grenzen
    if speler.x < 0:
        speler.x = 0
    if speler.x + 32 > BREEDTE:
        speler.x = BREEDTE - 32
    
    # RENDER
    screen.fill((150, 150, 150))
    
    for platform in platforms:
        platform.draw(screen)
    
    for munt in munten:
        munt.draw(screen)
    
    speler.draw(screen)
    
    pygame.display.flip()
    clock.tick(60)

pygame.quit()
```

**Run dit! Je hebt:**
- Speler-sprite die beweegt
- Platforms (groen)
- Munten (geel)
- Vloeiende beweging (60 FPS)

---

## 🎯 Huiswerk Hst 2

### Opgave 1: Methoden Toevoegen

Voeg methoden toe aan je Speler-klasse:

```python
class Speler:
    # ... bestaande code ...
    
    def verdien_punten(self, aantal):
        self.score += aantal
        print("Score:", self.score)
    
    def verlies_leven(self):
        self.levens -= 1
        print("Levens:", self.levens)
    
    def reset(self):
        self.x = 50
        self.y = 500
        self.score = 0
        self.levens = 3
```

Test methoden:
```python
speler = Speler(50, 500, "speler.png")
speler.verdien_punten(10)
speler.verlies_leven()
speler.reset()
```

### Opgave 2: Eigen Sprite Maken

1. Download **Piskel** (piskelapp.com) of gebruik Paint
2. Maak een 32x48 poppetje
3. Sla op als `speler.png` in je project-map
4. Laad in je code

### Opgave 3: Level Uitbreiden

Voeg meer platforms toe:

```python
platforms = [
    Platform(0, 550, 800, 50),      # Grond
    Platform(50, 450, 150, 20),
    Platform(300, 400, 150, 20),
    Platform(550, 350, 150, 20),
    Platform(150, 250, 150, 20),
    Platform(450, 200, 150, 20),
]
```

### Opgave 4: Voeg Munten Toe

Maak minstens 5 munten en plaats ze boven platforms.

---

## 💡 Samenvatting

| Concept | Uitleg |
|---------|--------|
| **Methode** | Functie in een klasse (wat object kan doen) |
| **Game-loop** | INPUT → UPDATE → RENDER (60x per seconde) |
| **Sprite** | Afbeelding voor object (pixelart) |
| **`draw()`** | Methode om object zichtbaar te maken |
| **`pygame.image.load()`** | Laadt sprite van schijf |
| **`screen.blit()`** | Plakt afbeelding op scherm |
| **`pygame.draw.rect()`** | Tekent rechthoek |
| **`pygame.draw.circle()`** | Tekent cirkel |
| **`clock.tick(60)`** | Zorgt voor 60 FPS |

---

## Checklist: Begrijp je dit?

- [ ] Wat is het verschil tussen een methode en een eigenschap?
- [ ] Wat zijn de 4 stappen van de game-loop?
- [ ] Hoe laad je een sprite in pygame?
- [ ] Wat is `screen.blit()`?
- [ ] Hoe teken je een rechthoek?
- [ ] Hoe zorgen voor 60 FPS?
- [ ] Kun je een speler-sprite van een bestand laden?

---

## ✅ Volgende Stap

**Hoofstuk 3:** 
- Lijsten van platforms
- Level-design als datastructuur
- Collision-voorbereiding
