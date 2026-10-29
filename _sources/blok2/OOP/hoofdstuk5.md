# Objectgeoriënteerd Programmeren Hoofdstuk 5: Collectibles, Score en Botsingsdetectie

## Leerdoelen

Een spel is leuker als je punten kunt verzamelen en duidelijke feedback krijgt. Nu gaan we **interactie** tussen verschillende objecten implementeren: speler raakt munten, speler raakt platforms, speler valt uit beeld.

Je leert:

- hoe je score kunt bijhouden;
- hoe je levens/health bijhoudt;
- hoe je **botsingsdetectie** implementeert (AABB collision);
- hoe je **collectibles** (munten) laat werken;
- hoe je een score op het scherm laat zien;
- hoe je game-over detecteert;
- hoe objecten met elkaar **interacteren**.

Aan het einde van dit hoofdstuk heb je een werkende game met munten, score, en game-over!

---

## Score en Levens bijhouden

Een score is een getal dat bijhoudt hoeveel punten je hebt.

```python
punten = 0
```

Als je iets goed doet, kun je punten optellen:

```python
punten = punten + 10
```

Levens geven aan hoe vaak iets fout kan gaan:

```python
levens = 3

if vijand_raakt_speler:
    levens = levens - 1
    if levens <= 0:
        game_over()
```

---

## Score en Levens in een klasse

In een game zijn score en levens niet zomaar losse variabelen. Ze horen bij je speler of je game:

```python
class Speler:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        # ... andere attributes ...
        
        # NIEUW: Game stats
        self.score = 0
        self.levens = 3
    
    def verdien_punten(self, aantal):
        self.score += aantal
    
    def verlies_leven(self):
        self.levens -= 1
        if self.levens <= 0:
            return False  # Game Over
        return True
```

---

## Collectibles: Munten die je kunt pakken

Nu willen we **munten** toevoegen die de speler kan verzamelen voor punten.

### Munt-klasse

```python
class Munt:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.radius = 8
        self.kleur = (255, 255, 0)  # Geel
    
    def draw(self, screen):
        pygame.draw.circle(screen, self.kleur, [int(self.x), int(self.y)], self.radius)
    
    @property
    def links(self):
        return self.x - self.radius
    
    @property
    def rechts(self):
        return self.x + self.radius
    
    @property
    def boven(self):
        return self.y - self.radius
    
    @property
    def onder(self):
        return self.y + self.radius
```

### Munten in je level plaatsen

```python
def maak_level_1_munten():
    munten = [
        Munt(200, 400),      # Op platform 2
        Munt(550, 300),      # Op platform 3
        Munt(700, 450),      # Ergens hangende
    ]
    return munten

# In je game:
munten = maak_level_1_munten()
```

---

## Botsingsdetectie: AABB Collision

**AABB** staat voor "Axis-Aligned Bounding Box". Dit is de simplest manier om botsingen te checken.

Het principe: beschouw elk object als een rechthoek. Als twee rechthoeken overlappen, botsen ze.

### AABB Formule

```python
def rechthoeken_botsen(rect1, rect2):
    return (rect1.rechts > rect2.links and
            rect1.links < rect2.rechts and
            rect1.onder > rect2.boven and
            rect1.boven < rect2.onder)
```

Dit checkt of de rechthoeken overlappen in zowel X als Y richting.

### Voorbeeld: Speler raakt munt

```python
def controleer_munten(speler, munten):
    """Check of speler munten heeft geraakt, voeg toe aan score."""
    munten_om_te_verwijderen = []
    
    for munt in munten:
        if rechthoeken_botsen(speler, munt):
            speler.verdien_punten(10)
            munten_om_te_verwijderen.append(munt)
    
    # Verwijder verzamelde munten
    for munt in munten_om_te_verwijderen:
        munten.remove(munt)

# In game-loop:
while running:
    # ...
    speler.move()
    controleer_landing(speler, platforms)
    controleer_munten(speler, munten)  # NIEUW
    # ...
```

---

## Tekst op het scherm: Score en Levens tonen

Je kunt score en levens op het scherm laten zien met `pygame.font`.

```python
# Maak een font
font = pygame.font.Font(None, 36)  # None = default font, 36 = grootte

# Maak tekst
score_tekst = font.render(f"Score: {speler.score}", True, (255, 255, 255))
levens_tekst = font.render(f"Levens: {speler.levens}", True, (255, 0, 0))

# Teken op scherm
screen.blit(score_tekst, [10, 10])           # Linksboven
screen.blit(levens_tekst, [10, 50])          # Onder score
```

**Wat gebeurt hier?**
- `font.render()` maakt een afbeelding van tekst
- `f"Score: {speler.score}"` is een formatted string (voegt waarde in)
- `screen.blit()` plakt de tekst op het scherm op coördinaten [10, 10]

---

## Game Over Detectie

Je game is voorbij als:
1. De speler valt uit beeld (y > HOOGTE)
2. De speler 0 levens heeft

```python
def check_game_over(speler, HOOGTE):
    # Speler is te ver gevallen
    if speler.y > HOOGTE:
        return True, "Je bent gevallen!"
    
    # Speler is geen levens meer
    if speler.levens <= 0:
        return True, "Game Over! Geen levens meer."
    
    # Game loopt nog
    return False, ""

# In game-loop:
while running:
    # ...
    game_over, bericht = check_game_over(speler, HOOGTE)
    
    if game_over:
        print(bericht)
        # Naar game-over scherm (Hoofdstuk 6)
        running = False
```

---

## Volledig voorbeeld: Munten en Score werken

```python
import pygame

pygame.init()

BREEDTE = 800
HOOGTE = 600
screen = pygame.display.set_mode((BREEDTE, HOOGTE))
clock = pygame.time.Clock()
font = pygame.font.Font(None, 36)

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
        
        # NIEUW: Game stats
        self.score = 0
        self.levens = 3
    
    def verdien_punten(self, aantal):
        self.score += aantal
    
    def move(self):
        self.x += self.xSnelheid
        self.ySnelheid += self.zwaartekracht
        self.y += self.ySnelheid
        
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

class Munt:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.radius = 8
    
    def draw(self, screen):
        pygame.draw.circle(screen, (255, 255, 0), [int(self.x), int(self.y)], self.radius)
    
    @property
    def links(self):
        return self.x - self.radius
    
    @property
    def rechts(self):
        return self.x + self.radius
    
    @property
    def boven(self):
        return self.y - self.radius
    
    @property
    def onder(self):
        return self.y + self.radius

def rechthoeken_botsen(obj1, obj2):
    return (obj1.rechts > obj2.links and
            obj1.links < obj2.rechts and
            obj1.onder > obj2.boven and
            obj1.boven < obj2.onder)

# Level
platforms = [
    Platform(0, 550, 800, 50),
    Platform(100, 450, 200, 25),
    Platform(450, 350, 250, 25),
]

munten = [
    Munt(200, 400),
    Munt(575, 300),
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

def controleer_munten(speler, munten):
    munten_om_te_verwijderen = []
    
    for munt in munten:
        if rechthoeken_botsen(speler, munt):
            speler.verdien_punten(10)
            munten_om_te_verwijderen.append(munt)
    
    for munt in munten_om_te_verwijderen:
        munten.remove(munt)

# Game loop
running = True
game_over = False

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
    controleer_munten(speler, munten)
    
    # Game Over check
    if speler.y > HOOGTE or speler.levens <= 0:
        game_over = True
        print("Game Over! Score:", speler.score)
        running = False
    
    # RENDER
    screen.fill((150, 150, 150))
    
    for platform in platforms:
        platform.draw(screen)
    
    for munt in munten:
        munt.draw(screen)
    
    speler.draw(screen)
    
    # Toon score en levens
    score_tekst = font.render(f"Score: {speler.score}", True, (255, 255, 255))
    levens_tekst = font.render(f"Levens: {speler.levens}", True, (255, 0, 0))
    screen.blit(score_tekst, [10, 10])
    screen.blit(levens_tekst, [10, 50])
    
    pygame.display.flip()
    clock.tick(60)

pygame.quit()
```

---

## Samenvatting

- **Score en Levens** horen bij de Speler-klasse
- **AABB Collision** is de simpelste manier om botsingen te checken
- **Collectibles** (munten) kunnen verzameld worden voor punten
- **Font rendering** toont tekst op het scherm
- **Game Over** check werkt op vallen of levens op 0
- Objecten kunnen met elkaar **interacteren**!

## Check je begrip

1. Hoe werk je score bij?
2. Hoe detecteer je of speler en munt botsen?
3. Hoe toon je tekst op het scherm?
4. Wat is AABB collision?
5. Hoe werkt game-over detectie?

## Opdrachten

1. **Munten toevoegen**

   <ol type='a'>
   <li>Maak een Munt-klasse met draw() methode.</li>
   <li>Plaats 5 munten in je level op verschillende posities.</li>
   <li>Zorg dat munten verdwijnen als je ze raakt.</li>
   </ol>

2. **Score bijhouden**

   <ol type='a'>
   <li>Voeg score attributen toe aan Speler.</li>
   <li>Zorg dat score +10 gaat als je een munt verzamelt.</li>
   <li>Toon score op het scherm links-boven.</li>
   </ol>

3. **Botsingsdetectie debuggen**

   <ol type='a'>
   <li>Print de botsings-waarden om te controleren of je functies werken.</li>
   <li>Test: botsen munten correct?</li>
   <li>Test: botsen platforms correct?</li>
   </ol>

4. **Game-over implementeren**

   <ol type='a'>
   <li>Zorg dat het spel eindigt als speler in gat valt.</li>
   <li>Print de eindscherm (Score en bericht).</li>
   <li>Bonus: maak levens-verlies als speler in gat valt (i.p.v. direct game-over).</li>
   </ol>

### Inzichtsvragen

1. Waarom is AABB collision handig?
2. Hoe weet je of twee objecten botsen?
3. Waarom hebben alle objecten links/rechts/boven/onder properties nodig?
4. Waarom toon je score en levens op het scherm?
