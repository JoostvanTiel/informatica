# 🎮 OOP + Pygame: Stick Hero's Quest

**Compleet geintegreerd curriculum voor Blok 2 - Object Oriented Programming met game-building**

---

## 📚 Wat Is Dit?

Dit is een **6-wekse OOP-cursus** waarin leerlingen:
- ✅ OOP-concepten leren (klassen, objecten, methoden, lijsten)
- ✅ Elke week een werkend pygame-programma bouwen
- ✅ **Uiteindelijk een compleet, speelbaar platformer-spel maken**

Geen abstracte voorbeelden. Geen "wacht tot het praktijkdeel". **Direct visueel feedback.**

---

## 🚀 Quick Start

### Voor Docent

1. **Pygame installeren:**
   ```bash
   pip install pygame
   ```

2. **Test het voorbeeld:**
   ```bash
   python voorbeeld_complete_game.py
   ```
   - Druk SPACE in menu
   - Pijltjes = bewegen
   - SPACE = springen
   - Geel = punten
   - Vallen = game over

3. **Lees de bestanden:**
   - `IMPLEMENTATIE_VOLTOOID.md` → Volledige overview
   - `PROGRESSIE_WEEK_PER_WEEK.md` → Didactisch plan
   - `hoofdstuk1.md` t/m `hoofdstuk6.md` → Lesmateriaal

### Voor Leerlingen

Volg je docent stap-voor-stap Week 1-6. Elk week:
- 📖 Theorie lezen in Jupyter Book
- 💻 Code-voorbeelden typen
- 🎮 Je spel zien groeien
- 🏠 Huiswerk toevoegen

---

## 📁 Bestandsstructuur

```
book/blok2/OOP/
│
├── 📖 LESMATERIAAL (6 hoofstukken)
│   ├── hoofdstuk1.md          → Klassen & Canvas
│   ├── hoofdstuk2.md          → Game-Loop & Beweging
│   ├── hoofdstuk3.md          → Lijsten & Platforms
│   ├── hoofdstuk4.md          → Zwaartekracht & Springen
│   ├── hoofdstuk5.md          → Collision & Score
│   └── hoofdstuk6.md          → States & Complete Game
│
├── 🎮 WERKENDE VOORBEELDEN
│   └── voorbeeld_complete_game.py  → Volledig werkend spel
│
└── 📋 DOCUMENTATIE
    ├── README.md (dit bestand)
    ├── IMPLEMENTATIE_VOLTOOID.md     → Wat er is aangepast
    ├── PROGRESSIE_WEEK_PER_WEEK.md   → Didactisch plan met checkpoints
    └── index.md                      → TOC voor Jupyter Book
```

---

## 🎯 Week-per-Week Overzicht

| Week | Hst | Concept | Game-Feature | Onderwerp |
|------|-----|---------|--------------|-----------|
| **1** | 1 | Klassen & Objects | Speler op canvas | Tekenen met `draw()` |
| **2** | 2 | Methoden & Game-Loop | Beweging | Interactie: INPUT → UPDATE → RENDER |
| **3** | 3 | Lijsten & Datastructuren | Platforms | Level-design als data |
| **4** | 4 | FPS & Physics | Gravity + Jumping | Realistische beweging |
| **5** | 5 | Collision & Interactie | Munten & Score | AABB collision + HUD |
| **6** | 6 | Game States | Menu's & Flow | State machine + Complete game |

---

## 🎮 What Students Build

### Week 1 - Static Sprite
```python
speler = Speler(50, 500)
speler.draw(screen)
```
**Result:** Rood vierkantje op scherm

### Week 2 - Interactive Movement
```python
speler.set_x_snelheid(7)  # Pijltjes gebruiken
speler.move()
```
**Result:** Speler beweegt links-rechts

### Week 3 - Level Design
```python
platforms = [
    Platform(0, 550, 800, 50),    # Grond
    Platform(100, 450, 200, 25),  # Level element
]
```
**Result:** Wereld met platforms

### Week 4 - Physics & Jumping
```python
speler.ySnelheid += zwaartekracht  # Vallen
speler.spring()                     # SPACE om te springen
```
**Result:** Realistisch springend karakter

### Week 5 - Collectibles & Scoring
```python
if rechthoeken_botsen(speler, munt):
    speler.verdien_punten(10)
    munten.remove(munt)
```
**Result:** Werkende score-systeem

### Week 6 - Complete Game
```python
if state == STATE_PLAYING:
    update_game()  # Physics & collision
    draw_game()    # Render alles
elif state == STATE_GAME_OVER:
    draw_game_over()  # Eindscore
```
**Result:** Professioneel werkend spel!

---

## 🛠️ Installation Checklist

### Stap 1: Python & Pygame
```bash
# Check Python versie (3.8+)
python --version

# Install pygame
pip install pygame
```

### Stap 2: Test Installation
```bash
# Navigate naar deze map
cd "book/blok2/OOP"

# Run voorbeeld-spel
python voorbeeld_complete_game.py
```

### Stap 3: Jupyter Book (optioneel, voor lesmateriaal)
```bash
# In repository root
pip install -r requirements.txt
jupyter-book build book/
```

---

## 📖 Hoe Gebruik Je Dit Lesmateriaal?

### Option A: Met Jupyter Book (Aanbevolen)
```bash
jupyter-book build book/
# Open book/_build/html/blok2/OOP/index.html
```
Leerlingen lezen theorie + code-voorbeelden interactief.

### Option B: Direct Markdown Lezen
Open `.md`-bestanden direct in:
- GitHub (web)
- VS Code (met preview)
- Jupyter Notebook
- Elke markdown-viewer

### Option C: Geprint Handout
Download/print de `.md`-bestanden als werkboek.

---

## ✅ Didactische Aanpak

### Per Lesson
1. **Theorie** (30 min) - Lees hoofdstuk + begrijp concept
2. **Samen coderen** (20 min) - Docent type, leerlingen kijken
3. **Zelf doen** (40 min) - Leerlingen typen eigen versie
4. **Testen** (10 min) - "Werkt het?"
5. **Huiswerk** (∞ min) - Uitbreiding van die week

### Evaluatie
Zie `PROGRESSIE_WEEK_PER_WEEK.md` voor:
- Weekly checkpoints
- Grading rubric
- Eindopdracht-criteria

---

## 🚨 Veelgestelde Problemen

### "Pygame installeert niet"
```bash
# Maak virtual env
python -m venv venv
# Activate
venv\Scripts\activate  # Windows
source venv/bin/activate  # Mac/Linux
# Install
pip install pygame
```

### "Mijn spel loopt niet"
Controleer:
- [ ] `pygame.init()` bovenaan
- [ ] `clock.tick(60)` in game-loop
- [ ] Events worden verwerkt
- [ ] Draw-functies worden aangeroepen

### "Speler valt niet"
```python
# Controleer zwaartekracht
print("ySnelheid:", speler.ySnelheid)
print("op_grond:", speler.op_grond)
```

### "Collision werkt niet"
```python
# Debug AABB collision
def rechthoeken_botsen(obj1, obj2):
    result = (obj1.rechts > obj2.links and ...)
    if result:
        print("BOTSING! objecten raken elkaar")
    return result
```

Zie ook: `PROGRESSIE_WEEK_PER_WEEK.md` → "Problemen & Oplossingen"

---

## 📚 Extra Resources

### Voor Docent
- **Game Design:** `game_design_stickherosquest.md` (in sessie-workspace)
- **Implementation Plan:** `pygame_integratieplan_OOP.md` (in sessie-workspace)
- **Python Docs:** https://docs.python.org/3/
- **Pygame Docs:** https://www.pygame.org/docs/

### Voor Leerlingen (Bonus)
- **Pygame Tutorials:** https://www.pygame.org/wiki/tutorials
- **Python OOP:** https://docs.python.org/3/tutorial/classes.html
- **Game Development:** YouTube "Pygame Tutorial"

---

## 🎓 Learning Outcomes

**Na deze 6 weken kan de leerling:**

✅ **OOP-concepten toepassen:**
- Klassen definiëren met eigenschappen en methoden
- Objecten instantiëren en gebruiken
- Methoden aanroepen en data manipuleren
- Lijsten van objecten beheren

✅ **Game-programmering begrijpen:**
- Game-loop (INPUT → UPDATE → RENDER) implementeren
- Toetsenbordbesturing verwerken
- Physics (gravity, velocity) simuleren
- Collision detection uitvoeren
- State machine patroon gebruiken

✅ **Praktisch programmeren:**
- Code debuggen en testen
- Visueel feedback geven (HUD, menus)
- Datastructuren voor level-design gebruiken
- Professionele game-flow implementeren

✅ **Reflectie & Iteratie:**
- Eigen code aanpassen en verbeteren
- Performance optimaliseren
- Eigen features toevoegen (bonus)

---

## 🏆 Eindproduct: STICK HERO'S QUEST

**Een speelbaar platformer-spel waar:**
- Speler kan bewegen (←→) en springen (SPACE)
- Platforms op scherm staan
- Munten verzamelen punten opleveren
- Score op HUD verschijnt
- Game eindigt bij vallen (GAME OVER)
- Menu-scherm start/herstart het spel
- Alles bij elkaar: ~400-600 regels Python-code

**Portfolio-klaar:** Leerlingen kunnen dit spel:
- Laten zien aan vrienden
- Op hun CV zetten
- Uitbreiden met features
- Hergebruiken als template

---

## 📝 Gegenereerde Documenten

Dit curriculum is gegenereerd met:
- ✅ Expert review van vorig jaar's materiaal (4HA periode 3)
- ✅ Analyse van huidige OOP-theorie (Blok 2)
- ✅ Didactische voorbereiding (progressie, checkpoints)
- ✅ Werkende code-voorbeelden
- ✅ Grading-criteria

**Status:** Klaar voor directe implementatie  
**Datum:** Oktober 2026  
**Auteur:** Copilot AI (onder begeleiding Joost van Tiel)

---

## 🤝 Feedback & Verbetering

Heb je suggesties? Log hier feedback:
1. **Code-voorbeelden:** Werken ze goed? Duidelijk?
2. **Moeilijkheidsniveau:** Gaat het te snel? Traag?
3. **Student-response:** Wat werkt goed? Wat niet?
4. **Features:** Wil je andere game-onderdelen?

**Meld issues in:** `... (je eigen tracking system)`

---

## 📞 Support

**Voor Docent-Vragen:**
- Check `IMPLEMENTATIE_VOLTOOID.md` → Veelgestelde vragen
- Check `PROGRESSIE_WEEK_PER_WEEK.md` → Troubleshooting

**Voor Leerling-Vragen:**
- Loop door stap-per-stap van het hoofdstuk
- Test je code regel-per-regel
- Print debug-waarden
- Vraag docent (dat is deel van leren!)

---

## ✨ Klaar?

```python
# Laat ons beginnen!
python voorbeeld_complete_game.py

# SPACE → START
# Pijltjes → BEWEGEN
# SPACE → SPRINGEN
# Geel → MUNTEN VERZAMELEN
# GAME OVER → TERUG NAAR MENU

# Week 1 → Week 6: Jij bouwt dit stap-voor-stap!
```

**Veel plezier met pygame! 🎮**

---

*Opgesteld door: Copilot Code Education*  
*Voor: Joost van Tiel - Informatica Educatie*  
*Status: ✅ Production Ready*
