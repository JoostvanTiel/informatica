# 📋 WIJZIGINGEN SAMENVATTING - Didactische Hervorming

## 🎯 Wat Is Veranderd?

Je feedback was volledig terecht: **cognitive overload voorkomen** is essentieel!

---

## ✅ HUIDIG LESPLAN (Optimaal)

### **Week 1: Hoofstuk 1 - Pure OOP**
```
LEERLING ZIET:
- Console output (print statements)
- Geen pygame, geen graphics

LEERT:
- Klasses (blauwdruk)
- Objecten (instanties)
- Eigenschappen (data)
- __init__ (constructor)

WHY:
✓ No cognitive overload
✓ Focus op fundamentals
✓ Alles werkt op elke computer (geen pygame nodig)
✓ Stevige basis voor visuele week
```

**Voorbeeld Hst 1 output:**
```
Speler Mario staat op (100, 200)
Levens: 3, Score: 0
```

---

### **Week 2: Hoofstuk 2 - Pygame + Sprites**
```
LEERLING ZIET:
- Speler-sprite op scherm (EIGEN pixelart!)
- Platforms (groene rechthoeken)
- Munten (gele cirkels)
- Speler beweegt met pijltjes

LEERT:
- Methoden (what objects can DO)
- Game-loop (INPUT→UPDATE→RENDER)
- Pygame basics (window, events, clock)
- SPRITE LADEN (pygame.image.load)
- draw() voor andere objecten
- Toetsenbordbesturing

WHY:
✓ Pygame nu clear (niet in Hst 1)
✓ Spelers = SPRITES (leerlingen maken zelf)
✓ Rest = draw() (platforms/munten/HUD)
✓ Leren BEIDE rendering technieken
✓ Week 1 basis voorkomi overload

TAAK:
- Leerlingen maken 32x48 pixelart (Piskel/Paint)
- Laden in eigen code
- Zien hun eigen sprite bewegen!
```

---

### **Week 3-6: Hoofstuk 3-6**
Ongewijzigd!
- Hst 3: Lijsten van platforms
- Hst 4: Physics (gravity, jumping)
- Hst 5: Collision + score
- Hst 6: State machine + menus

---

## 📊 VOORDELEN NIEUWE OPBOUW

| Aspect | Vorig Plan | Nieuw Plan |
|--------|-----------|-----------|
| **Hst 1 Focus** | OOP + Pygame tegelijk | Pure OOP (basis eerst) |
| **Leerling Cognitief** | Overload (begrip ÷ graphics) | Clear (één ding tegelijk) |
| **Speler-Weergave** | Rode rechthoek | EIGEN SPRITE! |
| **Sprites** | Niet behandeld | Hoofstuk 2 intro |
| **Graphics** | start Week 1 | start Week 2 |
| **Basis-begrip** | Zwak door haast | Sterk door focus |

---

## 🎨 SPRITE INTEGRATIE

### Speler (Week 2+)
```python
speler = Speler(50, 500, "speler.png")
# Laadt leerlings eigen pixelart!
```

**Wat leerlingen krijgen:**
1. **Handleiding**: HANDLEIDING_SPRITE_MAKEN.md
   - Piskel online tool
   - Stap-voor-stap
   - Troubleshooting

2. **Standaard**:
   - 32x48 pixels (platformer-grootte)
   - PNG format (transparantie)
   - Fallback: rood vierkantje als sprite ontbreekt

### Rest van Game (Week 2+)
```python
# Platforms: getekend via draw()
for platform in platforms:
    platform.draw(screen)  # pygame.draw.rect()

# Munten: getekend via draw()
for munt in munten:
    munt.draw(screen)      # pygame.draw.circle()

# HUD: getekend via draw()
font = pygame.font.Font(None, 36)
tekst = font.render(f"Score: {score}", True, ZWART)
screen.blit(tekst, [10, 10])
```

**Voordeel:** Leerlingen leren beide technieken!
- Sprites (pygame.image.load + blit)
- Primitieven (draw.rect, draw.circle, font.render)

---

## 📁 NIEUWE BESTANDEN

```
book/blok2/OOP/
├── HANDLEIDING_SPRITE_MAKEN.md  ← Voor leerlingen!
│   └─ Piskel tutorial
│   └─ Troubleshooting
│
├── Hst1: Pure OOP
├── Hst2: Pygame + Sprites
├── Hst3-6: Ongewijzigd
```

---

## 🧪 TESTING

Voorbeeld-spel (`voorbeeld_complete_game.py`) werkt nu:
```python
class Speler:
    def __init__(self, x, y, sprite_path="speler.png"):
        # Laadt sprite; fallback rood vierkantje
        try:
            self.afbeelding = pygame.image.load(sprite_path)
        except:
            self.afbeelding = pygame.Surface((32, 48))
            self.afbeelding.fill((255, 0, 0))
```

✓ Geen crashes als `speler.png` ontbreekt  
✓ Werkt met of zonder sprite  
✓ Leerlingen kunnen testen zonder sprite af te hebben  

---

## 🎯 WEEK-PER-WEEK NIEUW LESPLAN

### **Week 1: Hst 1 - OOP Fundamentals**
- Duur: 1 week
- Output: Console (print)
- Doelen: Klasses, objecten, eigenschappen
- Huiswerk: Eigen klasse + 3 objecten

### **Week 2: Hst 2 - Pygame + Sprites**
- Duur: 1 week
- Output: Speelbar spel (sprite + platforms)
- Doelen: Methoden, game-loop, sprites, toetsenbordbesturing
- Huiswerk: Eigen sprite maken + inladen

### **Week 3-6: Hst 3-6 - Game Uitbouwen**
- Ongewijzigd van vorige plan
- Zwaartekracht, collision, score, states

---

## ✨ DIDACTISCHE VOORDELEN

✅ **Cognitive Load Reduction**
- Week 1: ALLEEN OOP (geen pygame)
- Week 2+: OOP + Graphics (basis al zit)

✅ **Intrinsic Motivation**
- Week 2: "Mijn sprite beweegt!"
- Leerlingen zien meteen resultaat

✅ **Praktische Vaardigheden**
- Leerlingen maken eigen pixelart
- Portfolio-waarde (kunstwerk + code)

✅ **Dual Rendering Techniques**
- Sprites voor karakter
- Primitieven voor rest
- Beide essentieel in game-dev

✅ **Herhaalbaar & Schaalbaar**
- Volgend jaar: exact zelfde progressie
- Goed voor evaluatie
- Makkelijk aan te passen

---

## 🚀 VOLGENDE STAPPEN (VOOR JOU)

1. **Lees Hst 1 & 2** - Zorg dat je begrijpt de scheiding
2. **Test sprite-handleiding** - Maak zelf een sprite met Piskel
3. **Run voorbeeld-spel** - Zien dat het werkt (met fallback)
4. **Week 1 voorbereiding** - Hst 1 lesplan klaar maken

---

## 💬 FEEDBACK?

Deze opbouw is nu:
- ✅ Didactisch verantwoord (cognitive load)
- ✅ Praktisch werkend (geen blockers)
- ✅ Professioneel (beide teknieken)
- ✅ Intrinsiek motiverend (eigen art + code)

**Status: Klaar voor klassikaal gebruik!**

Veel sterkte met Week 1! 🎓
