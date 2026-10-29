# Objectgeoriënteerd Programmeren Hoofdstuk 1: Klassen en Objecten

## Leerdoelen

In deze lessen ga je werken met **klassen** en **objecten**. Dat is het begin van object-georiënteerd programmeren.

Je leert:

- **Wat een klasse is** (blauwdruk voor objecten)
- **Wat een object is** (instantie van een klasse)
- **Eigenschappen** (data die een object heeft)
- **Hoe je objecten maakt** (`__init__`)
- **Waarom klassen handig zijn** (herbruikbaarheid, organisatie)
- **Meerdere objecten van dezelfde klasse**

⚠️ **BELANGRIJK:** In dit hoofstuk **GEEN pygame of grafische output**! We starten zuiver met OOP-concepten. Je leert hoe klassen werken, en vervolgens hoe je ze op het scherm zichtbaar maakt in Hoofstuk 2.

Aan het einde van dit hoofstuk kun je:
- Een klasse definiëren met eigenschappen
- Meerdere objecten aanmaken
- Objecteigenschappen lezen en schrijven

---

## Wat is een Klasse?

Een **klasse** is een **blauwdruk** voor objecten.

Net zoals een blauwdruk van een huis beschrijft hoe je een huis bouwt, beschrijft een klasse hoe je een object maakt.

### Voorbeeld: De klasse "Speler"

```python
class Speler:
    def __init__(self, naam, x, y):
        self.naam = naam
        self.x = x
        self.y = y
        self.levens = 3
```

Dit zegt:
- Klasse heet `Speler`
- Een Speler **heeft** een naam
- Een Speler **heeft** een x-positie
- Een Speler **heeft** een y-positie  
- Een Speler **heeft** 3 levens

### Wat is `__init__`?

`__init__` is de **constructor** (konstruktor). Dit is een speciale methode die wordt **aangeroepen wanneer je een object aanmaakt**.

De `__init__` zet alle **eigenschappen** van het object op beginwaarden.

`self` betekent "dit object".

---

## Een Object Aanmaken

Wanneer je een object aanmaakt, zeg je:

```python
mijn_speler = Speler("Mario", 100, 200)
```

Dit doet:
1. Maak een NIEUW object van klasse Speler
2. Noem het `mijn_speler`
3. Geef `naam="Mario"`, `x=100`, `y=200` aan
4. `__init__` zet `levens=3`

Nu bestaat `mijn_speler` met die waarden!

### Eigenschappen gebruiken

Je kunt eigenschappen **uitlezen** met `.`:

```python
print(mijn_speler.naam)      # Output: Mario
print(mijn_speler.x)         # Output: 100
print(mijn_speler.levens)    # Output: 3
```

Je kunt eigenschappen ook **veranderen**:

```python
mijn_speler.levens = 2       # Speler verliest een leven
print(mijn_speler.levens)    # Output: 2
```

---

## Meerdere Objecten van Dezelfde Klasse

**Kracht van klassen:** Je kunt **veel objecten** van dezelfde klasse maken!

```python
class Speler:
    def __init__(self, naam, x, y):
        self.naam = naam
        self.x = x
        self.y = y
        self.levens = 3

# Maak DRIE verschillende spelers
speler1 = Speler("Mario", 100, 200)
speler2 = Speler("Luigi", 300, 200)
speler3 = Speler("Toad", 500, 400)

# Elk object is APART
print(speler1.naam)      # Mario
print(speler2.naam)      # Luigi
print(speler3.naam)      # Toad

# Ze kunnen verschillen
print(speler1.levens)    # 3
speler2.levens = 1       # Luigi heeft minder levens
print(speler2.levens)    # 1

# Andere spelers veranderen niet!
print(speler1.levens)    # Nog steeds 3
```

Zie je? **Dezelfde klasse, maar verschillende objecten met verschillende data.**

Dit is het **voordeel van klassen**: je schrijft de code **één keer**, maar je kunt er **honderd objecten** mee maken.

---

## Praktijk 1: Platform-Klasse

In ons spel hebben we ook platforms (rotsen waar je op springt).

Maak een `Platform`-klasse:

```python
class Platform:
    def __init__(self, x, y, breedte, hoogte):
        self.x = x
        self.y = y
        self.breedte = breedte
        self.hoogte = hoogte
```

Nu kun je platforms aanmaken:

```python
grond = Platform(0, 550, 800, 50)
platform1 = Platform(100, 450, 200, 25)
platform2 = Platform(450, 300, 250, 25)
```

Elk platform is apart. Ze kunnen verschillende afmetingen hebben!

Test je begrip:
```python
print(grond.breedte)        # 800
print(platform1.x)          # 100
print(platform2.hoogte)     # 25
```

---

## Praktijk 2: Munt-Klasse

Munten zijn collectibles in ons spel. Een munt heeft positie en waarde:

```python
class Munt:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.waarde = 10
```

Aanmaken:

```python
munt1 = Munt(200, 400)
munt2 = Munt(575, 300)
munt3 = Munt(275, 200)

# Munten hebben dezelfde waarde
print(munt1.waarde)   # 10
print(munt2.waarde)   # 10

# Maar verschillende posities
print(munt1.x)        # 200
print(munt2.x)        # 575
```

---

## Eigenschappen: Lezen en Schrijven

### Lezen (uitlezen)

```python
speler = Speler("Mario", 50, 100)

x_positie = speler.x
print(x_positie)              # 50

print(speler.naam)            # Mario
print(speler.levens)          # 3
```

### Schrijven (veranderen)

```python
speler.x = 75                 # Speler gaat naar x=75
speler.levens = speler.levens - 1  # Verlies een leven
speler.levens -= 1            # Korter geschreven

print(speler.x)               # 75
print(speler.levens)          # 2
```

---

## Praktijk 3: Score Bijhouden

Laten we een klasse maken die score bijhoudt:

```python
class GameState:
    def __init__(self):
        self.score = 0
        self.level = 1

# Aanmaken
game = GameState()

# Lezen
print(game.score)              # 0

# Veranderen
game.score = game.score + 10   # Score omhoog
game.score += 20               # Nog meer
game.level = 2                 # Volgende level

print(game.score)              # 30
print(game.level)              # 2
```

---

## Praktijk 4: Eigen Klasse Aanmaken

Laat ons een **complete klasse** voor ons spel maken met vele eigenschappen:

```python
class Speler:
    def __init__(self, naam, start_x, start_y):
        # Identiteit
        self.naam = naam
        
        # Positie
        self.x = start_x
        self.y = start_y
        
        # Afmetingen (pixel-art wordt later ingeladen)
        self.breedte = 32
        self.hoogte = 48
        
        # Game-stats
        self.levens = 3
        self.score = 0
        self.op_grond = False  # Staat speler op een platform?
        
        # Snelheden (voor beweging in Hst 2)
        self.x_snelheid = 0
        self.y_snelheid = 0

# Gebruik
held = Speler("Mario", 50, 500)

print(f"Speler {held.naam} staat op ({held.x}, {held.y})")
print(f"Levens: {held.levens}, Score: {held.score}")

# Verandering
held.score += 50
held.levens = 2

print(f"Na actie: {held.levens} levens, {held.score} punten")
```

---

## 🎯 Huiswerk Hst 1

### Opgave 1: Eigen Klasse Ontwerpen

Ontwerp een klasse voor **iets uit JOUW leven**. Bijvoorbeeld:

**Optie A - Huisdier:**
```python
class Huisdier:
    def __init__(self, naam, soort, leeftijd):
        self.naam = naam
        self.soort = soort
        self.leeftijd = leeftijd
        self.energie = 100
        self.honger = 0
```

**Optie B - Auto:**
```python
class Auto:
    def __init__(self, merk, model, bouwjaar):
        self.merk = merk
        self.model = model
        self.bouwjaar = bouwjaar
        self.benzine = 100
        self.snelheid = 0
```

**Optie C - Persoon (in RPG-spel):**
```python
class Persoon:
    def __init__(self, naam, klasse):
        self.naam = naam
        self.klasse = klasse
        self.hp = 100
        self.mana = 50
        self.level = 1
```

**Maak 2-3 objecten van jouw klasse en verander wat waarden.**

### Opgave 2: Level Data

Maak 4 platforms voor ons spel met realistische getallen:

```python
class Platform:
    def __init__(self, x, y, breedte, hoogte):
        self.x = x
        self.y = y
        self.breedte = breedte
        self.hoogte = hoogte

# JOUW platforms:
grond = Platform(0, 550, 800, 50)      # Bodem
p1 = Platform(100, 450, 200, 20)
p2 = Platform(400, 350, 200, 20)
p3 = Platform(200, 200, 150, 20)

# Print info
print(f"Grond: x={grond.x}, breedte={grond.breedte}")
print(f"Platform 1: y={p1.y}, hoogte={p1.hoogte}")
```

### Opgave 3: Munten Verzamelen

Maak 5 munten met verschillende posities. Bereken de TOTALE waarde:

```python
class Munt:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.waarde = 10

# 5 munten
munt1 = Munt(100, 150)
munt2 = Munt(200, 200)
munt3 = Munt(300, 100)
munt4 = Munt(150, 300)
munt5 = Munt(500, 250)

# Totale waarde berekenen:
totaal = munt1.waarde + munt2.waarde + munt3.waarde + munt4.waarde + munt5.waarde
print(f"Totale munt-waarde: {totaal}")  # 50
```

### Opgave 4: Game State

Maak een GameState-klasse en simuleer een spel:

```python
class GameState:
    def __init__(self):
        self.score = 0
        self.levens = 3
        self.level = 1
        self.munten_verzameld = 0

game = GameState()

# Simulatie
print(f"Start: Score={game.score}, Levens={game.levens}")

game.munten_verzameld += 3
game.score += 30
print(f"Na munten: Score={game.score}")

game.levens -= 1
print(f"Tegen hindernis: Levens={game.levens}")

game.level = 2
print(f"Volgende level: Level={game.level}")
```

---

## 💡 Samenvatting

| Concept | Uitleg |
|---------|--------|
| **Klasse** | Blauwdruk voor objecten |
| **Object** | Instantie van een klasse (concrete versie) |
| **Eigenschap/Attribuut** | Data die een object heeft (self.naam) |
| **`__init__`** | Constructor - zet beginwaarden op |
| **`self`** | Verwijzing naar "dit object" |
| **Aanmaken** | `obj = Klasse(waarden)` |
| **Lezen** | `obj.eigenschap` |
| **Schrijven** | `obj.eigenschap = waarde` |

---

## Checklist: Begrijp je dit?

- [ ] Wat is het verschil tussen een klasse en een object?
- [ ] Waarom heet het `__init__` en niet `init`?
- [ ] Wat betekent `self`?
- [ ] Kun je een klasse met 5+ eigenschappen schrijven?
- [ ] Kun je 3 verschillende objecten van dezelfde klasse maken?
- [ ] Kun je eigenschappen uitlezen EN veranderen?
- [ ] Begrijp je waarom klassen handig zijn in games?

---

## ✅ Volgende Stap

**Hoofstuk 2:** Nu gaan we:
- **Methoden** leren (wat objecten kunnen **doen**)
- **Pygame** introduceren (objecten zichtbaar maken)
- De **speler-sprite** inladen
- Andere objecten met `draw()` tekenen
