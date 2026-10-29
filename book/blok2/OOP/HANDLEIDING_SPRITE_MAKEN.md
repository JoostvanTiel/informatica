# 🎨 Handleiding: Maak Je Eigen Speler-Sprite

In dit hoofstuk leer je je eigen **pixelart-speler** te maken!

## Wat Is Een Sprite?

Een **sprite** is een eenvoudige afbeelding (meestal pixelart) van je speelfiguur.

Voorbeelden:
- Mario (Super Mario Bros)
- Link (Zelda)
- Jouw eigen poppetje!

**Voor ons spel:** 32x48 pixels (standaard platformer-grootte)

---

## Optie 1: Piskel (Makkelijk, Gratis, Online)

**Website:** https://www.piskelapp.com/

### Stappen:

1. **Open de website**
   - Ga naar piskelapp.com
   - Klik "Create a new Piskel"

2. **Maak een nieuwe sprite**
   - Canvas size: **32x48** pixels
   - Klik "Create"

3. **Teken je poppetje**
   - Klik kleur onderaan (bijv. rood)
   - Klik pixels op het canvas
   - Zorg voor contour (zwart) voor zichtbaarheid

**Voorbeeld:**
```
Simpel poppetje (3x3 grid als reference):
Head (rood):   ███
Body (rood):   ███
Legs (rood):   ███
Eyes (wit):    •••
```

4. **Exporteer als PNG**
   - Menu → "Export" 
   - Kies "PNG"
   - Sla op als `speler.png`

5. **Verplaats naar je project**
   - Zet `speler.png` in dezelfde map als je `.py`-bestand

---

## Optie 2: Aseprite (Professional, Betaald)

**Website:** https://www.aseprite.org/

Gaat veel verder dan Piskel, maar is niet gratis (~$20).

---

## Optie 3: Paint/GIMP (Wat moeilijker)

### Met Paint:

1. Maak nieuw bestand: 32x48 pixels
2. Zoom in (/klik "View" → "Zoom")
3. Teken pixel voor pixel
4. Sla op als PNG

### Met GIMP (gratis):

1. File → New → 32x48
2. Tools → Pencil
3. Teken je sprite
4. File → Export as → `speler.png`

---

## Sprite-Design Tips

### Kleurenschema

- **Lichaamskleur:** Kies 1 kleur (rood, blauw, groen)
- **Contour:** Donkerder of zwart rond figuur
- **Details:** Ogen, neus, mond (optioneel)

### Hoogtepunten

Dit werkt het best:
- Hoofd: 16x16 pixels
- Body: 16x24 pixels  
- Totaal: 32x48

### Bewegings-Animatie (Bonus)

Later kun je 3-4 frames maken (lopende beweging):
- Frame 1: linkerbeen voor
- Frame 2: rechterbeen voor
- Frame 3: linkerbeen voor (terug)
- etc.

Voor nu: **1 statisch figuur** is genoeg!

---

## Import in je Code

```python
class Speler:
    def __init__(self, x, y, sprite_path):
        self.x = x
        self.y = y
        
        # Laad je sprite
        self.afbeelding = pygame.image.load(sprite_path)
        self.rect = self.afbeelding.get_rect()
    
    def draw(self, screen):
        self.rect.x = self.x
        self.rect.y = self.y
        screen.blit(self.afbeelding, self.rect)

# Gebruik
speler = Speler(50, 500, "speler.png")  # Laadt je sprite
```

---

## Troubleshooting

### "FileNotFoundError: speler.png not found"

**Oorzaak:** PNG-bestand staat niet in dezelfde map als `.py`

**Oplossing:** 
```
C:\my_game\
├── mijn_spel.py
├── speler.png  ← HIER moet het staan!
```

### "Sprite is te groot/klein"

**Oorzaak:** Pixel-afmetingen zijn niet 32x48

**Oplossing:** 
- Piskel: Kies canvas 32x48
- Paint: File → Properties → 32x48
- GIMP: Image → Scale Image → 32x48

### "Sprite heeft witte achtergrond"

**Oorzaak:** PNG geëxporteerd als JPEG

**Oplossing:** 
- Piskel: Exporteer als "PNG" (niet JPEG)
- GIMP: File → Export as PNG (niet JPG)

---

## Galerij: Voorbeeld-Sprites

Zie `game_design_stickherosquest.md` voor inspiratie.

**Standaard Game-Sprites:**
- Super Mario: rood/blauw, 32x48
- Mega Man: blauw, 32x48
- Celeste: roze, 32x48

---

## Volgende Stap

Eenmaal je sprite klaar is:
1. Sla op als `speler.png`
2. Test in Code (Hst 2):
   ```python
   speler = Speler(50, 500, "speler.png")
   ```
3. Run! Je sprite verschijnt!

**Veel plezier met pixelart! 🎨**
