# ============================================================================
# STICK HERO'S QUEST - COMPLETE GAME
# OOP + Pygame integratie - Alle 6 Hofdstukken samengebracht
#
# Dit is een volledig werkend platformer spel met:
# - Speler met beweging, springen en zwaartekracht (H2, H4)
# - Multiple platforms en level-design (H3)
# - Munten verzamelen voor score (H5)
# - AABB collision detection (H5)
# - Complete state machine (H6)
# - Start- en game-over schermen (H6)
# ============================================================================

import pygame

pygame.init()

# Constants
BREEDTE = 800
HOOGTE = 600
FPS = 60

# Kleuren
WIT = (255, 255, 255)
ZWART = (0, 0, 0)
GRIJS = (150, 150, 150)
DONKER_GRIJS = (50, 50, 50)
DONKER_ROOD = (50, 0, 0)
GROEN = (100, 200, 100)
ROOD = (255, 0, 0)
GEEL = (255, 255, 0)
BLAUW = (0, 150, 255)

# Game States
STATE_MENU = "menu"
STATE_PLAYING = "playing"
STATE_GAME_OVER = "game_over"

# ============================================================================
# KLASSE 1: SPELER (H1, H2, H4, H5)
# ============================================================================

class Speler:
    """
    Speelbare karakter met beweging, springen en score.
    """
    
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.breedte = 40
        self.hoogte = 50
        self.kleur = (255, 0, 0)
        
        # Beweging (H2)
        self.xSnelheid = 0
        self.ySnelheid = 0
        
        # Zwaartekracht en springen (H4)
        self.zwaartekracht = 0.6
        self.kracht_spring = -15
        self.op_grond = False
        
        # Score (H5)
        self.score = 0
        self.levens = 3
    
    def verdien_punten(self, aantal):
        self.score += aantal
    
    def move(self):
        """Update positie met snelheid en zwaartekracht."""
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
        """Springen (alleen als op grond)."""
        if self.op_grond:
            self.ySnelheid = self.kracht_spring
            self.op_grond = False
    
    def set_x_snelheid(self, snelheid):
        self.xSnelheid = snelheid
    
    def draw(self, screen):
        """Teken de speler."""
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


# ============================================================================
# KLASSE 2: PLATFORM (H1, H3)
# ============================================================================

class Platform:
    """
    Statisch platform waarop speler kan staan/springen.
    """
    
    def __init__(self, x, y, breedte, hoogte, kleur=GROEN):
        self.x = x
        self.y = y
        self.breedte = breedte
        self.hoogte = hoogte
        self.kleur = kleur
    
    def draw(self, screen):
        pygame.draw.rect(screen, self.kleur, [self.x, self.y, self.breedte, self.hoogte])
        pygame.draw.rect(screen, ZWART, [self.x, self.y, self.breedte, self.hoogte], 2)
    
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


# ============================================================================
# KLASSE 3: MUNT (H3, H5)
# ============================================================================

class Munt:
    """
    Collectible die je kunt verzamelen voor punten.
    """
    
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.radius = 8
    
    def draw(self, screen):
        pygame.draw.circle(screen, GEEL, [int(self.x), int(self.y)], self.radius)
    
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


# ============================================================================
# FUNCTIES: Game Logic
# ============================================================================

def rechthoeken_botsen(obj1, obj2):
    """Check AABB collision tussen twee rechthoeken."""
    return (obj1.rechts > obj2.links and
            obj1.links < obj2.rechts and
            obj1.onder > obj2.boven and
            obj1.boven < obj2.onder)


def maak_level_1():
    """Maak niveau 1."""
    platforms = [
        Platform(0, 550, 800, 50, GROEN),
        Platform(100, 450, 200, 25, BLAUW),
        Platform(450, 350, 250, 25, BLAUW),
        Platform(200, 250, 150, 25, BLAUW),
    ]
    
    munten = [
        Munt(200, 400),
        Munt(575, 300),
        Munt(275, 200),
    ]
    
    return platforms, munten


def init_game():
    """Maak een nieuw spel."""
    speler = Speler(50, 500)
    platforms, munten = maak_level_1()
    return speler, platforms, munten


def controleer_landing(speler, platforms):
    """Check of speler op platform landt."""
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
    """Check of speler munten verzamelt."""
    munten_om_te_verwijderen = []
    
    for munt in munten:
        if rechthoeken_botsen(speler, munt):
            speler.verdien_punten(10)
            munten_om_te_verwijderen.append(munt)
    
    for munt in munten_om_te_verwijderen:
        munten.remove(munt)


def update_game(speler, platforms, munten):
    """Update het spel."""
    speler.move()
    controleer_landing(speler, platforms)
    controleer_munten(speler, munten)
    
    # Game Over check
    if speler.y > HOOGTE:
        return False  # Game is voorbij
    
    return True  # Spel loopt nog


# ============================================================================
# RENDERING FUNCTIES
# ============================================================================

def draw_menu(screen, font_big, font_small):
    """Teken startscherm."""
    screen.fill(DONKER_GRIJS)
    
    title = font_big.render("STICK HERO'S QUEST", True, (255, 200, 0))
    title_rect = title.get_rect(center=(BREEDTE // 2, HOOGTE // 4))
    screen.blit(title, title_rect)
    
    instr1 = font_small.render("Pijlen: Bewegen | SPACE: Springen", True, WIT)
    start = font_small.render("Druk SPACE om te STARTEN", True, (0, 255, 0))
    
    screen.blit(instr1, [BREEDTE // 2 - 250, HOOGTE // 2])
    screen.blit(start, [BREEDTE // 2 - 200, HOOGTE // 2 + 60])
    
    pygame.display.flip()


def draw_game_over(screen, font_big, font_small, speler):
    """Teken game-over scherm."""
    screen.fill(DONKER_ROOD)
    
    text = font_big.render("GAME OVER", True, ROOD)
    text_rect = text.get_rect(center=(BREEDTE // 2, HOOGTE // 3))
    screen.blit(text, text_rect)
    
    score_text = font_small.render(f"Final Score: {speler.score}", True, WIT)
    restart_text = font_small.render("Druk SPACE voor MENU", True, (0, 255, 0))
    
    screen.blit(score_text, [BREEDTE // 2 - 100, HOOGTE // 2])
    screen.blit(restart_text, [BREEDTE // 2 - 150, HOOGTE // 2 + 60])
    
    pygame.display.flip()


def draw_game(screen, font_small, speler, platforms, munten):
    """Teken het spel."""
    screen.fill(GRIJS)
    
    for platform in platforms:
        platform.draw(screen)
    
    for munt in munten:
        munt.draw(screen)
    
    speler.draw(screen)
    
    # HUD
    score_text = font_small.render(f"Score: {speler.score}", True, ZWART)
    screen.blit(score_text, [10, 10])
    
    pygame.display.flip()


# ============================================================================
# MAIN GAME LOOP
# ============================================================================

def main():
    screen = pygame.display.set_mode((BREEDTE, HOOGTE))
    pygame.display.set_caption("Stick Hero's Quest")
    clock = pygame.time.Clock()
    
    font_big = pygame.font.Font(None, 72)
    font_small = pygame.font.Font(None, 36)
    
    # Game state
    state = STATE_MENU
    speler = None
    platforms = None
    munten = None
    running = True
    
    while running:
        # INPUT
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
            
            elif event.type == pygame.KEYDOWN:
                if state == STATE_MENU:
                    if event.key == pygame.K_SPACE:
                        state = STATE_PLAYING
                        speler, platforms, munten = init_game()
                
                elif state == STATE_PLAYING:
                    if event.key == pygame.K_LEFT:
                        speler.set_x_snelheid(-7)
                    elif event.key == pygame.K_RIGHT:
                        speler.set_x_snelheid(7)
                    elif event.key == pygame.K_SPACE:
                        speler.spring()
                
                elif state == STATE_GAME_OVER:
                    if event.key == pygame.K_SPACE:
                        state = STATE_MENU
            
            elif event.type == pygame.KEYUP:
                if state == STATE_PLAYING:
                    if event.key in [pygame.K_LEFT, pygame.K_RIGHT]:
                        speler.set_x_snelheid(0)
        
        # UPDATE & RENDER
        if state == STATE_MENU:
            draw_menu(screen, font_big, font_small)
        
        elif state == STATE_PLAYING:
            game_running = update_game(speler, platforms, munten)
            draw_game(screen, font_small, speler, platforms, munten)
            
            if not game_running:
                state = STATE_GAME_OVER
        
        elif state == STATE_GAME_OVER:
            draw_game_over(screen, font_big, font_small, speler)
        
        clock.tick(FPS)
    
    pygame.quit()


if __name__ == "__main__":
    main()
