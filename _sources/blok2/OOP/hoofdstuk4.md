# Objectgeoriënteerd Programmeren Hoofdstuk 4: FPS, Zwaartekracht en Springen

## Leerdoelen

In een spel is tijd en beweging alles. Je wilt dat bewegingen vloeiend verlopen en dat fysica realistisch voelt.

Tot nu toe kon je speler alleen links-rechts bewegen. Nu gaan we **verticale beweging** toevoegen: **springen** en **vallen** door zwaartekracht.

Je leert:

- wat FPS betekent en waarom het belangrijk is;
- hoe een game-lus timing regelt;
- hoe je tijd in een spel bijhoudt;
- hoe je **zwaartekracht** implementeert;
- hoe je **springen** mechanieken bouwt;
- hoe je detecteert of een speler "op de grond" staat;
- waarom `clock.tick(60)` essentieel is voor vloeiende gameplay.

Aan het einde van dit hoofdstuk heeft je speler echte fysica: hij valt, springt, en het voelt natuurlijk!

---

## Wat is FPS?

**FPS** staat voor **Frames Per Second**.

Dat betekent hoeveel beelden per seconde op het scherm worden ververst.

Bijvoorbeeld:

```text
30 FPS  = soepel, maar niet erg vloeiend (consoles, films)
60 FPS  = zeer vloeiend (meeste games)
120 FPS = extreem soepel (esports games)
```

Met 60 FPS voeren we onze game-loop **60 keer per seconde** uit.

```python
clock = pygame.time.Clock()
while running:
    # ... game code ...
    clock.tick(60)  # Zorg dat dit 60 keer per seconde gebeurt
```

---

## De game-lus en timing

Herinner je de game-loop uit Hoofdstuk 2:

```
1. INPUT   → Lees toetsenbord
2. UPDATE  → Verplaats objecten, check collisies
3. RENDER  → Teken alles
4. WAIT    → Zorg dat dit 1/60ste van een seconde duurt
```

Dit herhaalt zich 60 keer per seconde.

### Waarom consistent timing?

Als je geen `clock.tick(60)` gebruikt, loopt je game zo snel als je computer kan (misschien 1000+ FPS). Dat betekent:
- Beweging is onmogelijk voorstelbaar snel
- Op snellere computers gaat alles sneller
- Beweging is niet consistent

Met `clock.tick(60)`:
- Alle computers draaien op dezelfde snelheid
- Beweging is voorspelbaar
- Je kunt precies berekenen hoe ver iets per frame beweegt

---

## Zwaartekracht: Realistisch vallen

Tot nu toe stond je speler stil als je hem niet aanstuurde. Maar in de echte wereld **valt** je speler door zwaartekracht.

### Hoe zwaartekracht werkt

Zwaartekracht is een **constante versnelling omlaag**.

Elke frame voegen we een klein beetje snelheid toe:

```python
class Speler:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.xSnelheid = 0
        self.ySnelheid = 0
        
        # NIEUW: Zwaartekracht
        self.zwaartekracht = 0.6      # Pixels per frame^2
        self.op_grond = False
    
    def move(self):
        # Horizontale beweging (zoals eerder)
        self.x += self.xSnelheid
        
        # NIEUW: Zwaartekracht toevoegen
        self.ySnelheid += self.zwaartekracht
        
        # Verticale beweging
        self.y += self.ySnelheid
        
        # Game Over: speler valt uit scherm
        if self.y > HOOGTE:
            return False  # Game is voorbij
        
        return True  # Game loopt nog
```

**Wat gebeurt hier?**
- Elke frame verhogen we `ySnelheid` met 0.6
- Dit geeft het effect van versnelling
- De speler beweegt steeds sneller omlaag

### Visueel:

```
Frame 0: ySnelheid = 0,   y beweging = 0
Frame 1: ySnelheid = 0.6, y beweging = 0.6
Frame 2: ySnelheid = 1.2, y beweging = 1.2
Frame 3: ySnelheid = 1.8, y beweging = 1.8
...
```

De speler versnelt en valt steeds sneller!

---

## Springen: Initiële snelheid omhoog

Om te springen geven we de speler een **negatieve snelheid** (omhoog).

```python
class Speler:
    def __init__(self, x, y):
        # ... vorig code ...
        self.kracht_spring = -15  # Negatief = omhoog
    
    def spring(self):
        """De speler springt (alleen als hij op grond staat)."""
        if self.op_grond:
            self.ySnelheid = self.kracht_spring  # -15
            self.op_grond = False
```

**Wat gebeurt?**

```
Spring ingedrukt:
- ySnelheid wordt -15 (omhoog)
- Speler beweegt omhoog: y -= 15

Volgende frames:
- Zwaartekracht voegt 0.6 toe: ySnelheid = -14.4
- Dan -13.8, -13.2, ...
- Uiteindelijk wordt ySnelheid positief
- Speler begint omlaag te vallen

Op grond teruggekomen:
- Collision detectie: op_grond = True
- Volgende sprong is mogelijk
```

Dit geeft het natuurlijke sprong-patroon: omhoog, langzamer, stopt, valt, versnelt.

---

## Landingsdetectie: "Op grond?" checken

De speler kan alleen springen als hij "op grond" staat. Dit checken we in UPDATE:

```python
def controleer_landing(speler, platforms):
    """Check of speler op een platform staat."""
    speler.op_grond = False  # Assume niet op grond
    
    for platform in platforms:
        # AABB collision: rechthoeken overlappen?
        if (speler.rechts > platform.links and
            speler.links < platform.rechts and
            speler.onder + speler.ySnelheid >= platform.boven and
            speler.ySnelheid >= 0):  # Valt omlaag, niet omhoog
            
            # Speler landt!
            speler.op_grond = True
            speler.y = platform.boven - speler.hoogte
            speler.ySnelheid = 0
            break

# In game-loop:
while running:
    # INPUT
    for event in pygame.event.get():
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_SPACE:
                speler.spring()
    
    # UPDATE
    speler.move()
    controleer_landing(speler, platforms)
    
    # RENDER
    # ... teken alles ...
```

---

## Volledig voorbeeld: Speler met zwaartekracht en springen

```python
import pygame

pygame.init()

BREEDTE = 800
HOOGTE = 600
screen = pygame.display.set_mode((BREEDTE, HOOGTE))
clock = pygame.time.Clock()

class Speler:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.breedte = 40
        self.hoogte = 50
        self.kleur = (255, 0, 0)
        
        self.xSnelheid = 0
        self.ySnelheid = 0
        
        self.zwaartekracht = 0.6
        self.kracht_spring = -15
        self.op_grond = False
    
    def move(self):
        # Horizontaal
        self.x += self.xSnelheid
        
        # Zwaartekracht
        self.ySnelheid += self.zwaartekracht
        self.y += self.ySnelheid
        
        # Grenzen
        if self.x < 0:
            self.x = 0
        if self.x + self.breedte > BREEDTE:
            self.x = BREEDTE - self.breedte
    
    def spring(self):
        if self.op_grond:
            self.ySnelheid = self.kracht_spring
            self.op_grond = False
    
    def set_x_snelheid(self, snelheid):
        self.xSnelheid = snelheid
    
    def draw(self, screen):
        pygame.draw.rect(screen, self.kleur, [self.x, self.y, self.breedte, self.hoogte])
    
    @property
    def links(self):
        return self.x
    
    @property
    def rechts(self):
        return self.x + self.breedte
    
    @property
    def boven(self):
        return self.y
    
    @property
    def onder(self):
        return self.y + self.hoogte

class Platform:
    def __init__(self, x, y, breedte, hoogte):
        self.x = x
        self.y = y
        self.breedte = breedte
        self.hoogte = hoogte
    
    def draw(self, screen):
        pygame.draw.rect(screen, (0, 200, 0), [self.x, self.y, self.breedte, self.hoogte])
    
    @property
    def links(self):
        return self.x
    
    @property
    def rechts(self):
        return self.x + self.breedte
    
    @property
    def boven(self):
        return self.y
    
    @property
    def onder(self):
        return self.y + self.hoogte

# Maak level
platforms = [
    Platform(0, 550, 800, 50),      # Grond
    Platform(100, 450, 200, 25),    # Platform 2
    Platform(450, 350, 250, 25),    # Platform 3
]

speler = Speler(400, 500)

def controleer_landing(speler, platforms):
    speler.op_grond = False
    
    for platform in platforms:
        if (speler.rechts > platform.links and
            speler.links < platform.rechts and
            speler.onder + speler.ySnelheid >= platform.boven and
            speler.ySnelheid >= 0):
            
            speler.op_grond = True
            speler.y = platform.boven - speler.hoogte
            speler.ySnelheid = 0
            break

# Game loop
running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
        elif event.type == pygame.KEYDOWN:
            if event.key == pygame.K_LEFT:
                speler.set_x_snelheid(-7)
            elif event.key == pygame.K_RIGHT:
                speler.set_x_snelheid(7)
            elif event.key == pygame.K_SPACE:
                speler.spring()
        elif event.type == pygame.KEYUP:
            if event.key in [pygame.K_LEFT, pygame.K_RIGHT]:
                speler.set_x_snelheid(0)
    
    speler.move()
    controleer_landing(speler, platforms)
    
    if speler.y > HOOGTE:  # Game Over
        running = False
    
    screen.fill((150, 150, 150))
    for platform in platforms:
        platform.draw(screen)
    speler.draw(screen)
    
    pygame.display.flip()
    clock.tick(60)

pygame.quit()
```

---

## Samenvatting

- **FPS** bepaalt hoe snel je game draait (60 FPS = 60 beelden per seconde)
- **Zwaartekracht** is een constante versnelling omlaag (`ySnelheid += zwaartekracht`)
- **Springen** geeft je speler een initiële negatieve (omhoog) snelheid
- **Landingsdetectie** checkt of je speler op een platform staat
- `clock.tick(60)` zorgt dat alles consistent speed draait
- Met deze elementen heb je realistisch speelgedrag!

## Check je begrip

1. Wat betekent FPS en waarom is 60 FPS standaard?
2. Hoe voeg je zwaartekracht toe aan je speler?
3. Hoe implementeer je springen?
4. Wat doet `op_grond`?
5. Waarom kan de speler alleen springen als hij op grond staat?
6. Hoe detecteer je of een speler op een platform landt?

## Opdrachten

1. **Zwaartekracht implementeren**

   <ol type='a'>
   <li>Voeg `ySnelheid` en `zwaartekracht = 0.6` toe aan je Speler-klasse.</li>
   <li>Zorg dat je speler valt als hij in de lucht is.</li>
   <li>Maak minstens twee platforms en zorg dat de speler op de grond landt.</li>
   </ol>

2. **Springen implementeren**

   <ol type='a'>
   <li>Voeg een `spring()` methode toe.</li>
   <li>Zorg dat je speler omhoog springt met SPACE.</li>
   <li>Zorg dat de speler niet meerdere keren in lucht kan springen.</li>
   </ol>

3. **Landingsdetectie**

   <ol type='a'>
   <li>Schrijf een `controleer_landing()` functie.</li>
   <li>Zorg dat `op_grond` True is als de speler op platform staat.</li>
   <li>Test: kan je spelen op elk platform springen?</li>
   </ol>

4. **Zwaartekracht tunen**

   <ol type='a'>
   <li>Verander `zwaartekracht` naar 0.4 of 0.8 en voel het verschil.</li>
   <li>Verander `kracht_spring` en zie hoe hoger/lager de speler springt.</li>
   <li>Wat voel je als meer realistisch?</li>
   </ol>

### Inzichtsvragen

1. Waarom is een constante zwaartekracht belangrijker dan vaste afstanden?
2. Waarom springt een speler niet oneindig hoog?
3. Hoe hangt de hoogte van je sprong af van `kracht_spring`?
4. Waarom kan je niet springen terwijl je al in de lucht bent?
