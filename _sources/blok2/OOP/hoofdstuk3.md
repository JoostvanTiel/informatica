# Objectgeoriënteerd Programmeren Hoofdstuk 3: Lijsten van objecten en Level-ontwerp

## Leerdoelen

In een spel heb je vaak meerdere objecten tegelijk: vijanden, kogels, **platforms**, muren en spelers. Die kun je handig in een lijst bewaren.

Je leert:

- hoe je meerdere objecten in een lijst zet;
- hoe je over een lijst van objecten kunt lopen;
- hoe je objecten kunt toevoegen en verwijderen;
- waarom lijsten handig zijn in een game;
- hoe je een **niveau ontwerpt** met platforms;
- hoe je alle platforms tegelijk **tekent** in je game-loop.

Aan het einde van dit hoofdstuk heb je een speelwereld met meerdere platforms waar je speler overheen kan springen!

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

**In een platformer:** We willen meerdere platforms hebben.

```python
platforms = []

class Platform:
    def __init__(self, x, y, breedte, hoogte):
        self.x = x
        self.y = y
        self.breedte = breedte
        self.hoogte = hoogte
    
    def draw(self, screen):
        pygame.draw.rect(screen, (0, 200, 0), [self.x, self.y, self.breedte, self.hoogte])

# Maak platforms
platforms.append(Platform(0, 550, 800, 50))      # Grond
platforms.append(Platform(150, 450, 200, 25))    # Platform 2
platforms.append(Platform(450, 350, 250, 25))    # Platform 3
```

Nu hebben we een **nivel** gemaakt!

---

## Over een lijst lopen

Met een `for`-lus kun je door een lijst van objecten heen gaan.

```python
for platform in platforms:
    platform.draw(screen)
```

Zo kun je voor elk object dezelfde actie uitvoeren.

Dit is **krachtig**: schrijf je code eenmaal, en het werkt voor alle objecten in je lijst.

### Praktijkvoorbeeld in de game-loop

```python
# In je game-loop:
while running:
    # Events verwerken...
    
    # UPDATE
    speler.move()
    
    # RENDER
    screen.fill((150, 150, 150))
    
    # Teken ALLE platforms
    for platform in platforms:
        platform.draw(screen)
    
    # Teken speler
    speler.draw(screen)
    
    pygame.display.flip()
```

---

## Een niveau als data: Level-ontwerp

In plaats van platforms hardcoded in te toefen, kun je een niveau als **data** beschrijven:

```python
def maak_level_1():
    platforms = [
        Platform(0, 550, 800, 50, (100, 200, 100)),      # Grond
        Platform(100, 450, 200, 25, (0, 150, 255)),      # Platform blauw
        Platform(350, 350, 250, 25, (255, 100, 0)),      # Platform oranje
        Platform(600, 450, 150, 25, (200, 100, 255)),    # Platform paars
    ]
    return platforms

def maak_level_2():
    platforms = [
        Platform(0, 550, 800, 50, (100, 200, 100)),
        Platform(50, 450, 100, 25, (0, 150, 255)),
        Platform(200, 380, 100, 25, (255, 100, 0)),
        Platform(350, 300, 150, 25, (200, 100, 255)),
        Platform(550, 380, 100, 25, (255, 100, 0)),
        Platform(700, 450, 100, 25, (0, 150, 255)),
    ]
    return platforms

# In je game:
level = 1
if level == 1:
    platforms = maak_level_1()
elif level == 2:
    platforms = maak_level_2()
```

**Voordeel:** Je kunt levels gemakkelijk ontwerpen en veranderen zonder code te herschrijven!

---

## Objecten toevoegen

Je kunt nieuwe objecten aan een lijst toevoegen met `append()`.

```python
vijanden.append(Vijand("Enemy 3"))
```

Dat is handig als nieuwe enemies ontstaan in de game.

### Voorbeeld: kogels schieten

```python
kogels = []

def schiet_kogel(speler, kogels):
    """Voeg een nieuwe kogel toe waar de speler staat."""
    kogel = Kogel(speler.x + speler.breedte // 2, speler.y)
    kogels.append(kogel)

# In je game-loop:
if spacebar_ingedrukt:
    schiet_kogel(speler, kogels)
```

---

## Objecten verwijderen

Als een object verdwijnt, kun je het weer uit de lijst halen.

```python
vijanden.pop(0)  # Verwijder het eerste object
```

Of je kunt een object markeren en later verwijderen.

Dit is handig bij kogels, vijanden of munitie in een spel.

### Voorbeeld: kogels verdwijnen bij scherm-grens

```python
# In je game-loop UPDATE:
kogels_om_te_verwijderen = []

for kogel in kogels:
    kogel.move()
    
    # Kogel is uit beeld
    if kogel.x > BREEDTE:
        kogels_om_te_verwijderen.append(kogel)

# Verwijder kogels die uit beeld zijn
for kogel in kogels_om_te_verwijderen:
    kogels.remove(kogel)
```

---

## Voorbeeld: lijst met kogels

```python
kogels = []

class Kogel:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.snelheid = 10

    def move(self):
        self.x += self.snelheid
    
    def draw(self, screen):
        pygame.draw.circle(screen, (255, 255, 0), [int(self.x), int(self.y)], 5)

kogels.append(Kogel(10, 100))
kogels.append(Kogel(50, 200))

for kogel in kogels:
    kogel.move()
    kogel.draw(screen)
```

Nu beweegt elke kogel op zijn eigen manier.

---

## Samenvatting

- Lijsten kunnen meerdere objecten bevatten.
- Je kunt met een lus alle objecten verwerken.
- Nieuwe objecten kunnen worden toegevoegd met `append()`.
- Verwijderde objecten kunnen uit de lijst worden gehaald met `remove()` of `pop()`.
- **Niveaus kunnen als data worden beschreven**, makkelijk om te veranderen.

## Check je begrip

1. Waarom gebruik je een lijst voor meerdere objecten?
2. Hoe voeg je een object toe aan een lijst?
3. Hoe loop je over alle objecten in een lijst?
4. Waarom is dit handig in een game?
5. Hoe maak je een niveau-functie met platforms?
6. Wanneer verwijder je objecten uit een lijst?

## Opdrachten

1. **Lijst met platforms**

   <ol type='a'>
   <li>Maak een Platform-klasse met `x`, `y`, `breedte`, `hoogte` attributen.</li>
   <li>Voeg een `draw()` methode toe.</li>
   <li>Maak een lijst met 5 platforms op verschillende hoogte.</li>
   <li>Gebruik een `for`-lus om alle platforms te tekenen.</li>
   </ol>

2. **Niveau-ontwerp**

   <ol type='a'>
   <li>Schrijf een functie `maak_level_1()` die platforms retourneert.</li>
   <li>Schrijf een functie `maak_level_2()` met moeilijkere layout.</li>
   <li>Zorg dat je tussen levels kunt wisselen.</li>
   </ol>

3. **Toepassingsvraag: Kogels**

   <ol type='a'>
   <li>Maak een Kogel-klasse met `x`, `y`, `snelheid`.</li>
   <li>Maak een `schiet_kogel()` functie die kogels aan een lijst toevoegt.</li>
   <li>Zorg dat kogels verdwijnen als ze uit beeld gaan.</li>
   </ol>

4. **Meerdere object-types tegelijk**

   <ol type='a'>
   <li>Je hebt zowel platforms als vijanden in je game.</li>
   <li>Maak aparte lijsten: `platforms = []` en `vijanden = []`</li>
   <li>Teken beide soorten in je game-loop met aparte for-loops.</li>
   </ol>

### Inzichtsvragen

1. Wat is het voordeel van een lijst van objecten?
2. Waarom kun je met één lus meerdere objecten tegelijk bewerken?
3. Wat is het verschil tussen één object en een lijst van objecten?
4. Hoe helpt het beschrijven van een niveau als "data" je om makkelijker levels te bouwen?
