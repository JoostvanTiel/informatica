# Hoofdstuk 1: Toestanden en automaten

## Leerdoelen

Computers en digitale systemen reageren voortdurend op wat er gebeurt. Een verkeerslicht reageert op tijd, een pinautomaat reageert op een ingevoerde pincode en een game reageert op de toetsen die je indrukt.

Om zulke systemen te begrijpen, gebruiken informatici het begrip **toestand**.

In dit hoofdstuk leer je:

- wat een toestand is;
- hoe je het gedrag van een systeem kunt beschrijven met toestanden;
- wat een **toestandsdiagram** is;
- wat een **eindige automaat** is;
- hoe gebeurtenissen ervoor zorgen dat een systeem van toestand verandert;
- hoe je een automaat kunt uitvoeren;
- hoe je een eenvoudige toestandmachine in Python maakt.

Aan het einde van het hoofdstuk kun je een eenvoudig systeem beschrijven als een verzameling toestanden en overgangen. Je kunt ook een eenvoudig Python-programma schrijven dat zo'n systeem uitvoert.

---

## Wat is een toestand?

```{image} img/stoplicht.png
:alt: Stoplicht
:width: 200px
:align: right
```

Stel dat je naar een verkeerslicht kijkt.

Op een bepaald moment staat het verkeerslicht bijvoorbeeld op:

**rood**

Een paar seconden later kan het op:

**groen**

En daarna:

**oranje**

Het verkeerslicht kan dus verschillende toestanden hebben.

Een **toestand** beschrijft hoe een systeem er op een bepaald moment voor staat.

Een toestand is dus geen actie. Het is een beschrijving van de situatie waarin het systeem zich bevindt.

Bijvoorbeeld:

| Systeem       | Mogelijke toestanden                                |
| ------------- | --------------------------------------------------- |
| Verkeerslicht | rood, groen, oranje                                 |
| Deur          | open, dicht                                         |
| Pinautomaat   | wacht op kaart, wacht op pincode, transactie, klaar |
| Lift          | stil, omhoog, omlaag                                |
| Gamepersonage | normaal, geraakt, dood                              |
| Telefoon      | vergrendeld, ontgrendeld                            |

Een belangrijk idee is:

> Een systeem bevindt zich op ieder moment in een bepaalde toestand.

---

## Toestanden veranderen

Een systeem blijft niet altijd in dezelfde toestand.

Er gebeurt iets waardoor het systeem naar een andere toestand gaat.

Zo'n gebeurtenis noemen we een **input**.

Bij een deur kan dat bijvoorbeeld zijn:

- iemand opent de deur;
- iemand sluit de deur.

We kunnen het gedrag dan zo beschrijven:

```text
DEUR DICHT
    |
    | input: iemand opent de deur
    v
DEUR OPEN
    |
    | input: iemand sluit de deur
    v
DEUR DICHT
```

De toestand verandert dus door een input.

We noemen de verandering van de ene toestand naar een andere toestand een overgang.

De belangrijkste begrippen zijn:

toestand — de situatie waarin het systeem zich bevindt;
input — iets waardoor het systeem kan reageren;
overgang — de verandering van de ene toestand naar een andere toestand.

## Toestandsdiagrammen

We kunnen een systeem overzichtelijker tekenen met een toestandsdiagram.

Een toestand tekenen we als een cirkel.
Een overgang tekenen we als een pijl.

Bijvoorbeeld een deur:

![Afbeelding niet gevonden][img/toestandsdiagram.png]

Bij de pijl staat waardoor de overgang plaatsvindt.

Een andere manier om hetzelfde weer te geven is:

```text
DICHT --openen--> OPEN
OPEN  --sluiten--> DICHT
```

Dat is vaak handig als je een systeem eerst op papier wilt ontwerpen.

---

# Oefening: de deur

Een automatische deur heeft twee toestanden:

- DICHT
- OPEN

De deur reageert op twee gebeurtenissen:

- iemand loopt naar de deur;
- niemand staat meer bij de deur.

## Opdracht 1

Teken een toestandsdiagram voor de deur.

Gebruik twee cirkels:

```text
DICHT

OPEN
```

Teken de pijlen en zet op iedere pijl de gebeurtenis waardoor de overgang plaatsvindt.

## Opdracht 2

Beantwoord de volgende vragen.

1. In welke toestand begint de deur?
2. Wat gebeurt er als iemand naar de deur loopt?
3. Wat gebeurt er als niemand meer bij de deur staat?
4. Kan de deur vanuit OPEN direct naar OPEN gaan?
5. Kan de deur vanuit DICHT direct naar DICHT gaan?

## Opdracht 3

Bedenk zelf een derde toestand voor de deur.

Bijvoorbeeld:

> De deur is aan het openen.

Pas je toestandsdiagram aan zodat deze toestand ook wordt gebruikt.

---

# 5. Een automaat

Een systeem dat op basis van input van toestand kan veranderen, kunnen we modelleren als een **toestandsmachine**.

Een veelgebruikte vorm hiervan is een **eindige automaat**.

"Eindig" betekent hier dat de automaat een eindig aantal toestanden heeft.

Een eenvoudige automaat bestaat uit:

1. een verzameling toestanden;
2. input/gebeurtenissen;
3. overgangen tussen toestanden;
4. een begin-toestand.

Bijvoorbeeld:

```text
Toestanden:
- DICHT
- OPEN

Begin:
- DICHT

Gebeurtenissen:
- OPENEN
- SLUITEN
```

Met de overgangen:

```text
DICHT --OPENEN--> OPEN
OPEN  --SLUITEN--> DICHT
```

De automaat vertelt dus precies welk gedrag het systeem heeft.

---

# 6. Een automaat uitvoeren

Stel dat we de volgende gebeurtenissen krijgen:

```text
OPENEN
SLUITEN
OPENEN
OPENEN
SLUITEN
```

We beginnen in toestand:

```text
DICHT
```

Nu voeren we de gebeurtenissen één voor één uit.

| Gebeurtenis | Oude toestand | Nieuwe toestand |
| ----------- | ------------- | --------------- |
| OPENEN      | DICHT         | OPEN            |
| SLUITEN     | OPEN          | DICHT           |
| OPENEN      | DICHT         | OPEN            |
| OPENEN      | OPEN          | OPEN            |
| SLUITEN     | OPEN          | DICHT           |

Let op de vierde regel.

De deur is al OPEN en krijgt opnieuw de gebeurtenis OPENEN.

Er verandert dan niets.

Dit is belangrijk: **een automaat moet voor iedere mogelijke situatie bepalen wat er gebeurt.**

---

# 7. Oefening: een toegangssysteem

Een gebouw heeft een eenvoudig toegangssysteem.

Het systeem heeft drie toestanden:

- **VERGRENDELD**
- **TOEGANG**
- **ALARM**

De regels zijn:

- Bij een correcte code gaat het systeem van VERGRENDELD naar TOEGANG.
- Bij een verkeerde code blijft het systeem VERGRENDELD.
- Na drie verkeerde codes gaat het systeem naar ALARM.
- Vanuit TOEGANG kan de deur worden gesloten en gaat het systeem terug naar VERGRENDELD.
- Vanuit ALARM kan het systeem alleen door een beheerder worden gereset.

## Opdracht 4

Teken een toestandsdiagram.

Denk goed na over de gebeurtenissen.

Je hebt bijvoorbeeld gebeurtenissen nodig zoals:

```text
correcte code
verkeerde code
deur sluiten
reset
```

## Opdracht 5

Voer de volgende gebeurtenissen uit.

Het systeem begint in:

```text
VERGRENDELD
```

Gebeurtenissen:

```text
verkeerde code
verkeerde code
correcte code
deur sluiten
verkeerde code
verkeerde code
verkeerde code
```

Maak een tabel waarin je na iedere gebeurtenis de toestand noteert.

## Opdracht 6 — denk verder

Waarom is **"aantal verkeerde pogingen"** eigenlijk ook informatie die het systeem moet onthouden?

Is dat zelf een toestand?

Of is het iets anders?

Bespreek je antwoord met een klasgenoot.

---

# 8. Toestanden in een game

Ook games zitten vol met toestanden.

Stel dat je een eenvoudig ruimtespel maakt.

Een ruimteschip kan bijvoorbeeld de volgende toestanden hebben:

```text
NORMAAL
GERAAKT
VERNIETIGD
```

Bijvoorbeeld:

```text
              botsing
      ┌─────────────────────┐
      │                     v
┌──────────┐            ┌─────────┐
│ NORMAAL  │            │ GERAAKT │
└──────────┘            └─────────┘
      ^                     │
      │                     │ nog een botsing
      │                     v
      │                ┌────────────┐
      └────────────────│ VERNIETIGD │
                       └────────────┘
```

Je kunt nu al nadenken als een programmeur:

> Welke informatie moet mijn programma bijhouden om te weten wat het ruimteschip moet doen?

Het antwoord kan bijvoorbeeld zijn:

```text
toestand = NORMAAL
```

Als het schip wordt geraakt, verandert die toestand.

---

# Python

## 9. Van toestand naar Python

Tot nu toe hebben we systemen beschreven zonder te programmeren.

Nu gaan we een computer vertellen hoe zo'n systeem moet werken.

We gebruiken daarvoor **Python**.

Python is een programmeertaal. Met Python kunnen we instructies schrijven die een computer kan uitvoeren.

Je hoeft nog niets van Python te weten.

We beginnen met één heel belangrijk idee:

> Een programma bestaat uit instructies die de computer één voor één uitvoert.

---

# 10. Je eerste Python-programma

Een computer kan tekst laten zien met `print()`.

```python
print("Hallo!")
```

`print` betekent ongeveer:

> laat iets zien op het scherm.

De tekst tussen aanhalingstekens is de tekst die we willen laten zien.

Probeer:

```python
print("Ik leer Python")
print("Dit is mijn eerste programma")
```

De computer voert de regels van boven naar beneden uit.

De uitvoer is:

```text
Ik leer Python
Dit is mijn eerste programma
```

## Opdracht 7

Schrijf een programma dat de volgende drie regels op het scherm laat zien:

```text
Ik ben een programmeur.
Ik werk met toestanden.
Mijn computer kan een automaat uitvoeren.
```

---

# 11. Informatie onthouden: variabelen

Een automaat moet onthouden in welke toestand hij zich bevindt.

In Python kunnen we informatie bewaren in een **variabele**.

Bijvoorbeeld:

```python
toestand = "DICHT"
```

Hiermee zeggen we:

> Bewaar de tekst `"DICHT"` in de variabele `toestand`.

Je kunt daarna de waarde bekijken:

```python
toestand = "DICHT"

print(toestand)
```

De uitvoer is:

```text
DICHT
```

Je kunt de toestand veranderen:

```python
toestand = "DICHT"
print(toestand)

toestand = "OPEN"
print(toestand)
```

De uitvoer:

```text
DICHT
OPEN
```

De variabele `toestand` werkt dus als het geheugen van onze eenvoudige automaat.

---

# 12. Een eerste automaat in Python

We kunnen nu onze deur maken.

```python
toestand = "DICHT"

print(toestand)

toestand = "OPEN"

print(toestand)

toestand = "DICHT"

print(toestand)
```

De computer voert dit uit als:

```text
DICHT
OPEN
DICHT
```

We hebben zojuist een automaat gesimuleerd.

Maar er is nog iets niet goed.

De computer verandert de toestand nu omdat **wij dat letterlijk in het programma hebben opgeschreven**.

We willen eigenlijk dat de computer zelf kan reageren op gebeurtenissen.

---

# 13. Een computer laten kiezen

Daarvoor gebruiken we `if`.

`if` betekent:

> als dit waar is, doe dan dit.

Bijvoorbeeld:

```python
toestand = "DICHT"

if toestand == "DICHT":
    print("De deur is dicht.")
```

Hier gebeurt iets nieuws.

```python
toestand == "DICHT"
```

betekent:

> Is de toestand gelijk aan `"DICHT"`?

Let goed op het verschil:

```python
toestand = "DICHT"
```

betekent:

> geef de variabele `toestand` de waarde `"DICHT"`.

Terwijl:

```python
toestand == "DICHT"
```

betekent:

> controleer of `toestand` gelijk is aan `"DICHT"`.

---

# 14. Twee mogelijke situaties

Onze deur kan OPEN of DICHT zijn.

We kunnen de computer laten reageren:

```python
toestand = "DICHT"

if toestand == "DICHT":
    print("De deur is dicht.")
else:
    print("De deur is open.")
```

`else` betekent:

> anders.

De computer kijkt dus:

```text
Is toestand DICHT?
       |
      ja
       |
       v
"De deur is dicht."

       nee
       |
       v
"De deur is open."
```

Dit is een eerste voorbeeld van **beslissen** in een programma.

---

# 15. Van beslissing naar overgang

Nu kunnen we een overgang maken.

```python
toestand = "DICHT"

gebeurtenis = "openen"

if gebeurtenis == "openen":
    toestand = "OPEN"

print(toestand)
```

De uitvoer is:

```text
OPEN
```

De computer heeft nu hetzelfde gedaan als onze automaat:

```text
DICHT --openen--> OPEN
```

We hebben dus de stap gemaakt van:

**toestandsdiagram**

naar:

**Python-programma**

---

# 16. De eerste echte automaat

We kunnen het voorbeeld uitbreiden.

```python
toestand = "DICHT"
gebeurtenis = "openen"

if toestand == "DICHT" and gebeurtenis == "openen":
    toestand = "OPEN"

print(toestand)
```

Hier controleren we twee dingen:

```python
toestand == "DICHT"
```

en:

```python
gebeurtenis == "openen"
```

Allebei moeten waar zijn.

Het woord `and` betekent:

> beide voorwaarden moeten waar zijn.

---

# 17. Oefening: bouw je eigen deurautomaat

Maak een Python-programma met:

```python
toestand = "DICHT"
```

en:

```python
gebeurtenis = "openen"
```

Zorg ervoor dat de computer de toestand verandert naar `"OPEN"` als de gebeurtenis `"openen"` is.

Laat daarna de toestand printen.

Je programma moet bijvoorbeeld dit kunnen opleveren:

```text
OPEN
```

## Extra uitdaging

Voeg ook de gebeurtenis `"sluiten"` toe.

Je programma moet dan bijvoorbeeld deze overgang kunnen uitvoeren:

```text
OPEN --sluiten--> DICHT
```

Denk eerst na over het toestandsdiagram voordat je gaat programmeren.

---

# 18. Een automaat met meerdere toestanden

Nu maken we een verkeerslicht.

Het verkeerslicht heeft drie toestanden:

```text
ROOD
GROEN
ORANJE
```

We spreken af:

```text
ROOD → GROEN
GROEN → ORANJE
ORANJE → ROOD
```

In Python kunnen we bijvoorbeeld schrijven:

```python
toestand = "ROOD"
gebeurtenis = "volgende"

if toestand == "ROOD":
    toestand = "GROEN"

elif toestand == "GROEN":
    toestand = "ORANJE"

elif toestand == "ORANJE":
    toestand = "ROOD"

print(toestand)
```

`elif` betekent ongeveer:

> als het vorige niet waar was, controleer dan deze andere mogelijkheid.

We hebben nu dus:

```text
if
elif
elif
```

Dat correspondeert met verschillende mogelijke toestanden.

---

# 19. Oefening: voorspel de uitvoer

Zonder het programma uit te voeren: wat wordt er geprint?

```python
toestand = "GROEN"

if toestand == "ROOD":
    toestand = "GROEN"

elif toestand == "GROEN":
    toestand = "ORANJE"

elif toestand == "ORANJE":
    toestand = "ROOD"

print(toestand)
```

Schrijf eerst je antwoord op.

Voer daarna het programma uit.

## Vraag

Waarom wordt er niet eerst `GROEN` en daarna `ORANJE` geprint?

---

# 20. Een belangrijk idee: de toestand verandert tijdens het uitvoeren

Kijk nog eens naar:

```python
toestand = "GROEN"

if toestand == "GROEN":
    toestand = "ORANJE"
```

Voor de `if` is de toestand:

```text
GROEN
```

Na de opdracht:

```python
toestand = "ORANJE"
```

is de toestand:

```text
ORANJE
```

De toestand is dus informatie die tijdens het uitvoeren van het programma kan veranderen.

Dat is precies wat we met een toestandmachine bedoelen.

---

# 21. Oefening: teken → programmeer → test

Kies één van deze systemen:

- een verkeerslicht;
- een automatische deur;
- een lift;
- een pinautomaat;
- een gamepersonage;
- een fietsverhuurstation.

Werk steeds in deze volgorde.

### Stap 1 — Bedenk de toestanden

Welke verschillende situaties kunnen voorkomen?

### Stap 2 — Bedenk de gebeurtenissen

Waardoor kan de toestand veranderen?

### Stap 3 — Teken het toestandsdiagram

Teken alle toestanden en overgangen.

### Stap 4 — Schrijf het algoritme

Beschrijf in gewone taal wat de computer moet doen.

Bijvoorbeeld:

```text
Als de toestand DICHT is en iemand opent de deur,
dan wordt de toestand OPEN.
```

### Stap 5 — Programmeer

Vertaal je algoritme naar Python.

### Stap 6 — Test

Probeer verschillende gebeurtenissen.

Vraag jezelf af:

> Doet mijn programma altijd wat het toestandsdiagram zegt?

---

# 22. Waarom doen we dit?

Je zou kunnen denken:

> Waarom tekenen we eerst al die toestanden? We kunnen toch gewoon Python schrijven?

Dat is precies de verkeerde volgorde.

Als je direct begint te programmeren, kun je gemakkelijk code schrijven die toevallig werkt. Maar je weet dan niet altijd waarom.

Bij informatica willen we eerst het probleem begrijpen.

Daarom gebruiken we:

```text
probleem
   ↓
model
   ↓
toestanden
   ↓
toestandsdiagram
   ↓
algoritme
   ↓
programma
   ↓
testen
```

Een toestandsdiagram is dus een **model** van het gedrag van een systeem.

Python is vervolgens een manier om dat model door een computer te laten uitvoeren.

---

# 23. Eindopdracht — ontwerp een automaat

Ontwerp een eenvoudige automaat voor een systeem naar keuze.

Je mag kiezen uit:

- een verkeerslicht;
- een deur;
- een lift;
- een pinautomaat;
- een gamepersonage;
- een wachtwoordbeveiliging;
- een eigen idee.

Je ontwerp moet minimaal bevatten:

- 3 toestanden;
- minimaal 4 mogelijke gebeurtenissen;
- een duidelijke begin-toestand;
- overgangen tussen de toestanden;
- minimaal één situatie waarin de toestand niet verandert;
- een toestandsdiagram;
- een Python-programma dat een deel van de automaat uitvoert.

## Je levert in

### 1. Toestandsdiagram

Het diagram moet duidelijk maken:

- welke toestanden bestaan;
- welke gebeurtenissen er zijn;
- welke overgang plaatsvindt.

### 2. Uitleg

Leg in je eigen woorden uit hoe jouw automaat werkt.

### 3. Python-programma

Je programma moet minimaal gebruikmaken van:

```python
print()
```

een variabele voor de toestand:

```python
toestand = ...
```

en beslissingen met:

```python
if
```

en eventueel:

```python
elif
else
```

### 4. Test

Laat minimaal drie verschillende situaties zien.

Bijvoorbeeld:

```text
Begintoestand: DICHT
Gebeurtenis: openen
Nieuwe toestand: OPEN
```

en:

```text
Begintoestand: OPEN
Gebeurtenis: sluiten
Nieuwe toestand: DICHT
```

---

# 24. Begrippen die je moet kennen

Aan het einde van deze week moet je de volgende begrippen kunnen uitleggen:

**Toestand**  
Een beschrijving van de situatie waarin een systeem zich op een bepaald moment bevindt.

**Gebeurtenis / input**  
Iets waarop een systeem kan reageren.

**Overgang**  
Een verandering van de ene toestand naar een andere toestand.

**Toestandsdiagram**  
Een diagram waarmee je toestanden en overgangen van een systeem beschrijft.

**Toestandsmachine**  
Een model van een systeem dat bestaat uit toestanden en overgangen tussen die toestanden.

**Eindige automaat**  
Een toestandsmachine met een eindig aantal toestanden.

**Variabele**  
Een naam waarmee een programma informatie kan bewaren.

**`if`**  
Een Python-constructie waarmee een programma afhankelijk van een voorwaarde een keuze kan maken.

**`elif`**  
Een extra voorwaarde die wordt gecontroleerd als een eerdere `if` of `elif` niet waar was.

**`else`**  
Geeft aan wat er gebeurt als de eerdere voorwaarden niet waar zijn.
