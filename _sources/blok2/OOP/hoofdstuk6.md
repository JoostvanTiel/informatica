# Objectgeoriënteerd Programmeren Hoofdstuk 6: Game States, Menus en Complete Game Flow

## Leerdoelen

Een volledig spel bestaat uit meerdere **toestanden** (states): een startscherm, het eigenlijke spel, en een game-over scherm. Met behulp van **state management** zorg je dat je spel professioneel aanvoelt.

Je leert:

- hoe game-states werken (menu, spelen, game-over);
- hoe je een state machine bouwt;
- hoe je een startscherm maakt;
- hoe je een game-over scherm maakt;
- hoe je naar verschillende states overgaat;
- hoe je het spel reset en opnieuw start;
- hoe je een **complete, werkende game** bouwt.

Aan het einde van dit hoofdstuk heb je een volledige, spelbare platformer game!

---

## Waarom game-states?

De game hoeft niet altijd in dezelfde staat te zitten.

Je hebt bijvoorbeeld:

- **`"menu"`** - Startscherm, wacht op SPACE om te beginnen
- **`"playing"`** - Actief spel, speler bestuurt zijn karakter
- **`"game_over"`** - Game-over scherm, wacht op SPACE om terug naar menu

Deze toestanden kun je opslaan in een variabele:

```python
state = "menu"

if state == "menu":
    toon_startscherm()
elif state == "playing":
    update_en_teken_game()
elif state == "game_over":
    toon_game_over_scherm()
```

Het voordeel: je code is **duidelijker gestructureerd** en **makkelijker uit te breiden**.

---

## Een State Machine bouwen

Een **state machine** is een systeem dat toestanden beheert en overgangen tussen toestanden.

```python
STATE_MENU = "menu"
STATE_PLAYING = "playing"
STATE_GAME_OVER = "game_over"

class Game:
    def __init__(self):
        self.state = STATE_MENU
        self.score = 0
        self.level = 1
    
    def change_state(self, new_state):
        """Verander naar een ander state."""
        self.state = new_state
        
        if new_state == STATE_MENU:
            self.reset_game()
        elif new_state == STATE_PLAYING:
            self.start_game()
```

---

## Het Startscherm

Een startscherm toont:
- De gametitel
- Instructies (bv. "Druk SPACE om te starten")
- Eventueel besturingsknopjes

```python
def draw_menu(screen, font_big, font_small):
    """Teken het startscherm."""
    screen.fill((50, 50, 50))  # Donkergrijze achtergrond
    
    # Titel
    title = font_big.render("STICK HERO'S QUEST", True, (255, 200, 0))
    title_rect = title.get_rect(center=(BREEDTE // 2, HOOGTE // 4))
    screen.blit(title, title_rect)
    
    # Instructies
    instr1 = font_small.render("Pijlen: Bewegen", True, (255, 255, 255))
    instr2 = font_small.render("SPACE: Springen", True, (255, 255, 255))
    instr3 = font_small.render("Druk SPACE om te STARTEN", True, (0, 255, 0))
    
    screen.blit(instr1, [BREEDTE // 2 - 100, HOOGTE // 2])
    screen.blit(instr2, [BREEDTE // 2 - 100, HOOGTE // 2 + 40])
    screen.blit(instr3, [BREEDTE // 2 - 150, HOOGTE // 2 + 100])
    
    pygame.display.flip()
```

---

## Het Eindscherm (Game Over)

Een game-over scherm toont:
- "GAME OVER" boodschap
- Eindresultaat (score, level)
- Instructie voor herstarten

```python
def draw_game_over(screen, font_big, font_small, speler):
    """Teken het game-over scherm."""
    screen.fill((50, 0, 0))  # Donkerrood
    
    # Game Over tekst
    text = font_big.render("GAME OVER", True, (255, 0, 0))
    text_rect = text.get_rect(center=(BREEDTE // 2, HOOGTE // 3))
    screen.blit(text, text_rect)
    
    # Score info
    score_text = font_small.render(f"Final Score: {speler.score}", True, (255, 255, 255))
    restart_text = font_small.render("Druk SPACE om terug naar MENU", True, (0, 255, 0))
    
    screen.blit(score_text, [BREEDTE // 2 - 150, HOOGTE // 2])
    screen.blit(restart_text, [BREEDTE // 2 - 200, HOOGTE // 2 + 50])
    
    pygame.display.flip()
```

---

## Spel Resetten en Starten

Wanneer je naar "playing" gaat, moet je alles reset:

```python
def init_game():
    """Initialiseer een nieuw spel."""
    speler = Speler(50, 500)
    
    platforms = [
        Platform(0, 550, 800, 50),
        Platform(100, 450, 200, 25),
        Platform(450, 350, 250, 25),
    ]
    
    munten = [
        Munt(200, 400),
        Munt(575, 300),
    ]
    
    return speler, platforms, munten
```

---

## Hoe Game States werken: Diagram

```
┌─────────────┐
│    MENU     │ (wacht op SPACE)
└──────┬──────┘
       │ SPACE ingedrukt
       ↓
┌─────────────┐
│   PLAYING   │ (speler bestuurt, munten pakken)
└──────┬──────┘
       │ Speler valt/levens op 0
       ↓
┌─────────────┐
│  GAME OVER  │ (toon score, wacht op SPACE)
└──────┬──────┘
       │ SPACE ingedrukt
       ↓
    MENU
```

---

## Waarom een Startscherm?

Een startscherm is belangrijk voor:
- **Gebruikerservaring** - Spelers weten wanneer ze kunnen starten
- **Instructies** - Je kunt besturing uitleggen
- **Branding** - Je game voelt professioneel
- **Pauze-mogelijkheid** - Spelers kunnen teruggaan

---

## Volledig Voorbeeld: Complete Game met States

Zie de sessie-bestanden voor een volledig werkend voorbeeld (`voorbeeld_complete_game.py`).

De logica:

```python
def main():
    state = STATE_MENU
    running = True
    
    while running:
        # INPUT
        for event in pygame.event.get():
            if state == STATE_MENU and event.key == pygame.K_SPACE:
                state = STATE_PLAYING
                speler, platforms, munten = init_game()
            
            elif state == STATE_PLAYING:
                # ... speler input ...
            
            elif state == STATE_GAME_OVER and event.key == pygame.K_SPACE:
                state = STATE_MENU
        
        # UPDATE & RENDER
        if state == STATE_MENU:
            draw_menu()
        elif state == STATE_PLAYING:
            game_running = update_game(speler, platforms, munten)
            draw_game(speler, platforms, munten)
            if not game_running:
                state = STATE_GAME_OVER
        elif state == STATE_GAME_OVER:
            draw_game_over(speler)
        
        clock.tick(60)
    
    pygame.quit()
```

---

## Samenvatting

- **State Machine** bestuurt verschillende speltoestanden
- **STATE_MENU** = Startscherm
- **STATE_PLAYING** = Actief spel
- **STATE_GAME_OVER** = Eindscherm
- **Transities** gebeuren op basis van events (bijv. SPACE)
- **Reset** zorgt dat het spel opnieuw kan beginnen
- Met states is je game **professioneel gestructureerd**!

## Check je begrip

1. Wat is een state machine?
2. Welke drie states heeft je game?
3. Hoe ga je van menu naar playing?
4. Wat staat op het game-over scherm?
5. Waarom moet je het spel resetten?
6. Hoe structureert een state machine je code?

## Opdrachten

1. **Startscherm implementeren**

   <ol type='a'>
   <li>Maak een `draw_menu()` functie.</li>
   <li>Toon gametitel en instructies.</li>
   <li>Zorg dat SPACE naar playing gaat.</li>
   </ol>

2. **Game-over scherm**

   <ol type='a'>
   <li>Maak een `draw_game_over()` functie.</li>
   <li>Toon "GAME OVER" en de eindscore.</li>
   <li>SPACE gaat terug naar menu.</li>
   </ol>

3. **State machine**

   <ol type='a'>
   <li>Maak een `state` variabele met MENU, PLAYING, GAME_OVER.</li>
   <li>Voeg logica toe: if state == MENU, elif state == PLAYING, etc.</li>
   <li>Test alle transities.</li>
   </ol>

4. **Complete game**

   <ol type='a'>
   <li>Combineer alles: klasses, game-loop, states, menu's.</li>
   <li>Test: startscherm → spel → game-over → menu.</li>
   <li>Zorg dat munten en score werken.</li>
   </ol>

5. **Level upgrade (bonus)**

   <ol type='a'>
   <li>Maak een Level 2 met meer platforms en munten.</li>
   <li>Zorg dat je na Level 1 automatisch Level 2 speelt.</li>
   <li>Voeg een "Level Won" screen toe.</li>
   </ol>

### Inzichtsvragen

1. Waarom heb je een startscherm nodig?
2. Hoe helpt een state machine met het organiseren van je code?
3. Wat gebeurt er als je niet reset?
4. Hoe voelt een game met startscherm beter dan zonder?
5. Waarom is een game-over scherm beter dan direct afsluiten?
