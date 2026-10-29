# 🎮 PYGAME PROGRESSIE - WEEK-PER-WEEK OVERZICHT

## WEEK 1: Klassen & Canvas (Hst 1)
```
┌─────────────────────────────┐
│   STICK HERO'S QUEST        │
│                             │
│           🟥              │  <- Speler (statisch)
│                             │
│  Leren: Klassen, objecten   │
│  draw() methode             │
└─────────────────────────────┘
```
**Concept:** Visueel maken wat OOP is
**Code:** Speler-klasse, canvas-setup
**Huiswerk:** Meerdere spelers tekenen

---

## WEEK 2: Game-Loop & Beweging (Hst 2)
```
┌─────────────────────────────┐
│   STICK HERO'S QUEST        │
│                             │
│   🟥 → → →                │  <- Speler beweegt!
│                             │
│  Leren: Game-loop, events   │
│  Toetsenbordbesturing       │
└─────────────────────────────┘

INPUT → UPDATE → RENDER → WAIT (60 FPS)
```
**Concept:** Hoe games werken (interactief)
**Code:** Game-loop, keypress handling
**Huiswerk:** Speler in alle richtingen

---

## WEEK 3: Platforms & Level-Design (Hst 3)
```
┌─────────────────────────────┐
│   STICK HERO'S QUEST        │
│                      🟥    │
│       🟨🟨🟨        🟨      │  <- Munten!
│   🟥        🟨🟨🟨         │
│ ═══════════════════════════ │
│  Leren: Lijsten, for-loop   │
│  Level design als data      │
└─────────────────────────────┘
```
**Concept:** Programmeren met datastructuren
**Code:** Platform-klasse, level-functies
**Huiswerk:** Eigen niveau ontwerpen

---

## WEEK 4: Zwaartekracht & Springen (Hst 4)
```
┌─────────────────────────────┐
│   STICK HERO'S QUEST        │
│           🟥↑↑             │  <- Springt!
│       🟨    ↓              │
│   🟥  ↓    🟨              │
│ ═══════════════════════════ │
│  Leren: Fysica, realism     │
│  Springen, vallen           │
└─────────────────────────────┘

ySnelheid += zwaartekracht
Springen = negatieve initiële snelheid
```
**Concept:** Physics in games
**Code:** Zwaartekracht-konstante, jump-kracht
**Huiswerk:** Physics-waarden tunen

---

## WEEK 5: Collision & Score (Hst 5)
```
┌─────────────────────────────┐
│   STICK HERO'S QUEST        │
│                             │
│           🟥 💛💛💛        │  <- SCORE: 30
│       🟨    ↓               │
│   🟥    + 10 voor munt!     │
│ ═══════════════════════════ │
│  Leren: Collision detection │
│  AABB, score-systeem        │
└─────────────────────────────┘

if rechthoeken_botsen():
    score += 10
```
**Concept:** Game interactie, feedback
**Code:** AABB collision, HUD-tekst
**Huiswerk:** Munten-typen toevoegen

---

## WEEK 6: State Machine & Menus (Hst 6)
```
┌─────────────────────────────┐
│   STARTSCHERM               │
│   STICK HERO'S QUEST        │
│   Druk SPACE om te starten  │
│                             │
│ SPACE →→→→→→→→→→→          │
└─────────────────────────────┘
                   ↓
┌─────────────────────────────┐
│   IN SPEL (SCORE: 30)       │
│                             │
│   🟥 → → →                 │
│ ═══════════════════════════ │
│                             │
└─────────────────────────────┘
                   ↓
          (Vallen uit scherm)
                   ↓
┌─────────────────────────────┐
│   GAME OVER!                │
│   Final Score: 30           │
│   Druk SPACE voor MENU      │
└─────────────────────────────┘

STATE_MENU → STATE_PLAYING → STATE_GAME_OVER → STATE_MENU
```
**Concept:** State machine, game-flow
**Code:** State constants, transitions
**Huiswerk:** Werkend spel afleveren!

---

## 📈 PROGRESSIE CURVE

```
COMPLEXITEIT & FEATURES
        │
   100% │                    ███ Complete Game!
        │                   ██
    80% │                  ██
        │                 ██
    60% │                ██ State Machine + Menus
        │               ██
    40% │              ██  Collision + Score
        │             ██
    20% │            ██   Physics + Jumping
        │           ██    Platforms
        │          ██     Game-Loop
        │         ██      Canvas
        └────────────────────────
           W1  W2  W3  W4  W5  W6
```

---

## 🎯 DIDACTISCH STAPPENPLAN

| Week | Hst | Concept | Game-Feature | Leerling-Ervaring |
|------|-----|---------|--------------|-------------------|
| 1 | 1 | Klassen | Speler op scherm | "Wow, mijn code is zichtbaar!" |
| 2 | 2 | Methoden | Speler beweegt | "Ik kan het controleren!" |
| 3 | 3 | Lijsten | Platforms | "Ik maak een wereld!" |
| 4 | 4 | FPS/Zwaartekracht | Realistische beweging | "Dit voelt echt!" |
| 5 | 5 | Collision | Punten verzamelen | "Mijn spel geeft feedback!" |
| 6 | 6 | Game States | Menu's & Flow | "Ik maak een ECHT spel!" |

---

## ✅ CHECKPOINTS PER WEEK

### Week 1 - Canvas
- [ ] Pygame init en window
- [ ] Speler-klasse met draw()
- [ ] Rood vierkantje op scherm
- [ ] 3+ spelers tegelijk tekenen

### Week 2 - Game-Loop
- [ ] Game-loop werkend (60 FPS)
- [ ] Keyboard input
- [ ] Speler beweegt links/rechts
- [ ] Vloeiende beweging (niet hakkerig)

### Week 3 - Platforms
- [ ] Platform-klasse
- [ ] For-loop alle platforms tekenen
- [ ] Munt-klasse
- [ ] 2 levels met eigen data

### Week 4 - Physics
- [ ] Zwaartekracht werkt (vallen)
- [ ] Springen met SPACE
- [ ] Landing op platform
- [ ] Niet in platform "steken"

### Week 5 - Interactie
- [ ] Munten verzamelen
- [ ] Score teller werkt
- [ ] HUD toont score
- [ ] Game-over bij scherm-rand

### Week 6 - States
- [ ] Startscherm verschijnt
- [ ] SPACE → naar spel
- [ ] Game-over scherm
- [ ] Volledig werkend spel
- [ ] Reset tussen runs

---

## 🚀 DEMO-VOLGORDE

**Voor docent:**
1. Run `voorbeeld_complete_game.py`
2. Toon startscherm (SPACE om te starten)
3. Beweeg speler (pijltjes, SPACE om te springen)
4. Verzamel munten (score omhoog!)
5. Vallen uit scherm (GAME OVER)
6. SPACE → terug naar menu

**Wat leerlingen zien:**
- Week 1: Rood blokje → Week 6: Speelbaar platformspel
- Progressie is ZICHTBAAR
- Eindresultaat is INDRUKWEKKEND

---

## 💡 TIPS VOOR SUCCES

### Voor Docent
- ✅ Test zelf eerste (instaleer pygame)
- ✅ Zet Week 1-2 klassikaal op
- ✅ Laat leerlingen elke week hun .py-file backuppen
- ✅ Week 5: Veel vragen over collision (voorbereiding!)
- ✅ Week 6: Viering! Ze hebben een SPEL gemaakt!

### Voor Leerlingen
- 📌 Bewaar elke week je code
- 📌 Test elke change ("Did I break it?")
- 📌 Voeg comments toe (volgende week snap je het!")
- 📌 Wees creatief Week 3 (eigen levels = motivatie)
- 📌 Debug samen (nobody manages collision solo)

### Problemen & Oplossingen
| Probleem | Oorzaak | Oplossing |
|----------|---------|----------|
| FPS > 60 | Zwaartekracht te hoog | Waarde lager (bijv. 0.5) |
| Speler "springt niet" | `on_grond = False` niet correct | Print debug-waarden |
| Munten verdwijnen niet | `remove()` vs `pop()` | Controleer loop-order |
| Speler loopt door platform | AABB niet werkend | Draw hitboxes als test |
| Game-loop hakkerig | Clock.tick() ontbreekt | Zorg `clock.tick(60)` in loop |

---

## 📊 GRADING RUBRIC

### Criteria per Week

**Week 1-2 (Canvas & Game-Loop)** → Max 10 punten
- Speler tekent correct (3 pnt)
- Game-loop werkend (3 pnt)
- Toetsenbord-input werkt (2 pnt)
- Code netjes (2 pnt)

**Week 3 (Platforms)** → Max 10 punten
- Platform-klasse (2 pnt)
- For-loop rendering (2 pnt)
- Eigen niveau (3 pnt)
- Munt-klasse (3 pnt)

**Week 4 (Physics)** → Max 10 punten
- Zwaartekracht correct (3 pnt)
- Springen werkend (3 pnt)
- Landing-detectie (2 pnt)
- Grenzen checken (2 pnt)

**Week 5 (Collision)** → Max 10 punten
- AABB formule begrijpen (2 pnt)
- Munten verzamelen (3 pnt)
- Score weergegeven (3 pnt)
- Game-over detectie (2 pnt)

**Week 6 (States)** → Max 10 punten
- State machine (3 pnt)
- Menu werkend (2 pnt)
- Game-over screen (2 pnt)
- Alles integreert (3 pnt)

**Bonus** (+5 punten maximaal):
- Eigen power-ups
- Extra levels
- Sound/muziek
- Spectaculaire graphics
- Leaderboard

---

## 🎓 EINDOPDRACHT

**STICK HERO'S QUEST - COMPLETE GAME**

Maak een **werkend platformer-spel** waarin:
- Speler kan bewegen en springen ✅
- Minstens 2 platforms ✅
- Minstens 3 munten ✅
- Score-teller ✅
- Game-over scherm ✅
- Menu scherm ✅

**Inleveren:**
- Python-bestand (.py) dat runt
- max 600 lines code
- Minimaal 3 comments
- Persoonlijke aanpassingen (kleuren/levels/features)

**Beoordeling:**
- Werkend (50%) → Speelt tot einde zonder crash
- Code-kwaliteit (30%) → OOP-principes, geen duplication
- Creativiteit (20%) → Eigen features/levels/design

---

**🏆 EN DAN HETZELFDE VOLGENDE JAAR OPNIEUW, MAAR NOG BETER! 🏆**

