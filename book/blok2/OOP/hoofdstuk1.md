# Objectgeoriënteerd Programmeren Hoofdstuk 1: Klassen en objecten

## Leerdoelen

In deze lessen ga je werken met **klassen** en **objecten**. Dat is het begin van object-georiënteerd programmeren. 

Je leert niet alleen klassen in theorie te begrijpen, maar je gaat ze ook **visueel gebruiken in een spel**.

Je leert:

- wat een klasse is;
- wat een object is;
- hoe je een object maakt;
- waarom klassen handig zijn in een spel of programma;
- hoe een klasse verschillende objecten kan beschrijven;
- hoe je een klasse kunt **tekenen op het scherm** met Pygame.

Aan het einde van dit hoofdstuk kun je een eenvoudige klasse ontwerpen, objecten daarvan maken, en die objecten op het scherm zichtbaar maken.

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

## Ons eerste pygame-canvas: Klassen op het scherm

Tot nu toe hebben we klassen en objecten **alleen in tekst** gebruikt. Maar klassen worden heel krachtig als we ze **visueel** kunnen maken in een spel.

### Pygame installeren en starten

Pygame is een bibliotheek waarmee je eenvoudig graphics kunt tekenen.

Installeer het eerst:

```bash
pip install pygame
```

### Een pygame-venster openen

Hier is de basis om pygame te starten:

```python
import pygame

pygame.init()

# Schermafmetingen
BREEDTE = 800
HOOGTE = 600

# Maak een venster
screen = pygame.display.set_mode((BREEDTE, HOOGTE))
pygame.display.set_caption("Mijn eerste spel")

# Vul scherm met grijs
screen.fill((150, 150, 150))

# Ververs het scherm
pygame.display.flip()

# Houd het venster open
import time
time.sleep(3)

pygame.quit()
```

Dit programma opent een grijs venster van 800x600 pixels en sluit het na 3 seconden.

### Een Speler-klasse met `draw()` methode

Nu gaan we een **Speler-klasse** maken die zich zelf kan **tekenen** op het scherm.

```python
import pygame

class Speler:
    def __init__(self, x, y, kleur=(255, 0, 0)):
        """
        Maak een speler aan op positie (x, y).
        
        Attributen:
            x, y: positie op het scherm
            breedte, hoogte: grootte van de speler
            kleur: RGB tuple (rood, groen, blauw)
        """
        self.x = x
        self.y = y
        self.breedte = 40
        self.hoogte = 50
        self.kleur = kleur
    
    def draw(self, screen):
        """Teken de speler als een rechthoek op het scherm."""
        pygame.draw.rect(screen, self.kleur, [self.x, self.y, self.breedte, self.hoogte])
```

Zie je wat hier gebeurt?

- De klasse `Speler` beschrijft **wat** een speler is (een rechthoek op coördinaten)
- De methode `draw()` zegt **hoe** je een speler tekent
- Elk object van de klasse `Speler` kan zijn eigen `draw()` aanroepen

### Alles samenvoegen: speler op canvas

Nu gebruiken we de klasse in ons spel:

```python
import pygame

pygame.init()

BREEDTE = 800
HOOGTE = 600
screen = pygame.display.set_mode((BREEDTE, HOOGTE))
pygame.display.set_caption("Mijn eerste spel")

# Maak een speler-object
speler = Speler(100, 100, (255, 0, 0))  # Rood, op positie (100, 100)

# Teken alles
screen.fill((150, 150, 150))  # Grijze achtergrond
speler.draw(screen)           # Teken de speler

pygame.display.flip()

import time
time.sleep(3)
pygame.quit()
```

Als je dit draait, zie je een **rood vierkantje** op het scherm. Dat is je Speler-object in actie!

### Meerdere spelers tegelijk

Omdat we een klasse hebben, kunnen we nu heel makkelijk meerdere spelers maken:

```python
# Maak drie verschillende spelers
speler1 = Speler(50, 100, (255, 0, 0))     # Rood
speler2 = Speler(200, 150, (0, 255, 0))    # Groen
speler3 = Speler(350, 200, (0, 0, 255))    # Blauw

# Teken ze allemaal
screen.fill((150, 150, 150))
speler1.draw(screen)
speler2.draw(screen)
speler3.draw(screen)

pygame.display.flip()
```

Nu zie je **drie gekleurde rechthoeken** op het scherm!

Dit is het krachtigste van klassen: je schrijft de code **één keer**, en je kunt er **honderd objecten** mee maken.

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

In pygame voegen we er visuele attributen aan toe:

```python
class Speler:
    def __init__(self, x, y, kleur):
        self.x = x              # x-coördinaat
        self.y = y              # y-coördinaat
        self.breedte = 40       # breedte in pixels
        self.hoogte = 50        # hoogte in pixels
        self.kleur = kleur      # RGB kleur
```

---

## Voorbeeld: een spelpersonage in pygame

```python
import pygame

class SpelPersonage:
    def __init__(self, naam, x, y, hp):
        self.naam = naam
        self.x = x
        self.y = y
        self.hp = hp
        self.breedte = 50
        self.hoogte = 50
    
    def draw(self, screen):
        pygame.draw.rect(screen, (100, 200, 100), [self.x, self.y, self.breedte, self.hoogte])
        
        # Toon naam (optioneel - meer info in Hoofdstuk 5)
        # font = pygame.font.Font(None, 24)
        # tekst = font.render(self.naam, True, (0, 0, 0))
        # screen.blit(tekst, [self.x, self.y - 20])

# Maak twee personages
p1 = SpelPersonage("SuperTygo", 50, 100, 100)
p2 = SpelPersonage("SuperFinn", 200, 150, 80)

pygame.init()
screen = pygame.display.set_mode((800, 600))
screen.fill((150, 150, 150))

p1.draw(screen)
p2.draw(screen)

pygame.display.flip()

import time
time.sleep(3)
pygame.quit()
```

Nu zijn `p1` en `p2` twee verschillende objecten op het scherm, maar ze hebben dezelfde structuur.

---

## Samenvatting

- Een klasse is een blauwdruk.
- Een object is een concrete instantie van die blauwdruk.
- Attributen beschrijven een object.
- Met klassen kun je meerdere vergelijkbare objecten maken.
- In pygame kan elk object zichzelf **tekenen** met een `draw()` methode.

## Check je begrip

1. Wat is het verschil tussen een klasse en een object?
2. Wat is een attribuut?
3. Hoe maak je een object aan?
4. Waarom is een klasse handig in een spel?
5. Wat doet de `draw()` methode in pygame?
6. Waarom voeg je `self.x` en `self.y` toe aan een Speler-klasse?

## Opdrachten

1. **Klasse ontwerpen**

   <ol type='a'>
   <li>Maak een klasse `Vijand` met attributen `x`, `y`, `kleur`, `breedte` en `hoogte`.</li>
   <li>Voeg een `draw()` methode toe die de vijand als rechthoek tekent.</li>
   <li>Maak twee verschillende objecten van deze klasse en teken ze beide op het scherm.</li>
   </ol>

2. **Objecten in pygame**

   <ol type='a'>
   <li>Schrijf een klein pygame-programma waarin je minstens 3 spelers van dezelfde klasse hebt, maar op verschillende posities.</li>
   <li>Teken ze alle drie op het scherm.</li>
   <li>Verander de kleur van elk object (gebruik `self.kleur`).</li>
   </ol>

3. **Toepassingsvraag: Meerdere platforms**

   Je wilt een platformer-spel maken met meerdere platforms.

   <ol type='a'>
   <li>Waarom is een klasse `Platform` handig om platforms te modelleren?</li>
   <li>Noem vier attributen die een Platform-object zou moeten hebben.</li>
   <li>Noem twee voordelen van het gebruik van klassen in plaats van alles handmatig programmeren.</li>
   </ol>

### Inzichtsvragen

1. Wat is een blauwdruk in een programma?
2. Waarom is een object niet hetzelfde als een klasse?
3. Hoe kun je een klasse als 'bouwplan' uitleggen?
4. Waarom is het handig dat elke object zichzelf kan tekenen met `draw()`?
