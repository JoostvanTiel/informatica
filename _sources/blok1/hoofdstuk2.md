# Hoofdstuk 2: Algoritmen en beslissingen

## Leerdoelen

In het vorige hoofdstuk heb je geleerd hoe een systeem kan worden beschreven met **toestanden**, **gebeurtenissen** en **overgangen**. Je hebt gezien dat een toestandsdiagram een model kan zijn van het gedrag van een systeem.

In dit hoofdstuk maken we de stap van zo'n model naar een **algoritme**. Een algoritme is een reeks duidelijke stappen waarmee je een probleem oplost. Je gaat leren hoe je een probleem eerst begrijpt, voordat je gaat programmeren.

Je leert:

- wat een algoritme is;
- hoe je een probleem analyseert voordat je code schrijft;
- hoe je een beslissing in een algoritme kunt modelleren;
- hoe je beslissingen met een stroomdiagram weergeeft;
- hoe je een algoritme vertaalt naar Python;
- hoe je met `if`, `elif` en `else` verschillende situaties kunt afhandelen;
- hoe je een algoritme systematisch test;
- hoe je fouten in een algoritme vindt en verbetert.

Aan het einde van dit hoofdstuk kun je een eenvoudig probleem analyseren, een algoritme opzetten en dat algoritme vertalen naar Python.

---

## Van toestand naar algoritme

In het vorige hoofdstuk gebruikten we toestandsautomaten om het gedrag van een systeem te beschrijven.

Bijvoorbeeld een automatische deur:

```text
DICHT --openen--> OPEN
OPEN  --sluiten--> DICHT
```

Een automaat vertelt ons **welke toestand** een systeem heeft en **welke input** nodig is om naar een andere toestand te gaan.

Bij programmeren zien we een soortgelijk idee terug. Een programma krijgt invoer, verwerkt die informatie en moet daarna bepalen wat het moet doen.

Bijvoorbeeld:

```text
Temperatuur: 7 °C

Is de temperatuur lager dan 10 °C?
       |
       ja
       |
       v
"Neem een jas mee."
```

De computer moet hier een **beslissing** nemen.

Een algoritme beschrijft precies welke stappen daarna volgen.

---

## Wat is een algoritme?

Een **algoritme** is een eindige, eenduidige reeks stappen waarmee je een probleem oplost of een taak uitvoert.

Een algoritme lijkt op een recept.

Bij een recept staan bijvoorbeeld:

1. Pak een kom.
2. Doe bloem in de kom.
3. Voeg melk toe.
4. Roer het mengsel.
5. Bak het beslag.

Een computerprogramma werkt op dezelfde manier. De computer volgt stap voor stap wat je hebt bedacht.

Een goed algoritme heeft daarom onder andere:

- een duidelijk begin;
- duidelijke stappen;
- weinig of geen onduidelijkheid;
- een duidelijk resultaat;
- een einde.

Een algoritme moet niet alleen werken, maar ook begrijpelijk zijn.

Als iemand schrijft:

> Maak het getal groot.

dan weet een computer niet precies wat hij moet doen.

Maar als iemand schrijft:

> Vermenigvuldig het getal met 2.

is dat veel duidelijker.

---

## Een probleem eerst begrijpen

Een veelgemaakte fout bij programmeren is meteen beginnen met typen.

Een betere aanpak is:

```text
probleem
   ↓
begrijpen
   ↓
gegevens bepalen
   ↓
beslissingen bepalen
   ↓
algoritme ontwerpen
   ↓
algoritme testen
   ↓
programmeren
   ↓
programma testen
```

Programmeren is dus niet hetzelfde als een algoritme bedenken.

Python is alleen de taal waarin je het algoritme uiteindelijk opschrijft.

---

## Input, verwerking en output

Een handig model bij het ontwerpen van algoritmen is:

```text
INPUT → VERWERKING → OUTPUT
```

De **input** is de informatie die het algoritme binnenkrijgt.

De **verwerking** is wat het algoritme met die informatie doet.

De **output** is het resultaat.

Bijvoorbeeld een programma dat bepaalt of iemand oud genoeg is om 16+ films te bekijken:

```text
INPUT
leeftijd
   ↓
VERWERKING
is leeftijd ≥ 16?
   ↓
OUTPUT
"Je mag deze film bekijken."
of
"Je mag deze film niet bekijken."
```

De sleutel is dat een algoritme niet alleen iets uitrekent, maar ook keuzes maakt.

---

## Beslissingen

Een beslissing heeft meestal de vorm:

> Als een voorwaarde waar is, doe dan iets.

Bijvoorbeeld:

```text
Als het regent:
    neem een paraplu mee.
```

Er zijn hier twee mogelijke situaties:

```text
regent
   ↓
   ja ─────→ neem paraplu mee
   |
   nee
   ↓
doe niets
```

In een algoritme noemen we `regent` een **voorwaarde**.

Een voorwaarde heeft een uitkomst die waar of onwaar kan zijn.

Bijvoorbeeld:

```text
temperatuur < 10
```

Deze voorwaarde kan waar zijn:

```text
7 < 10 → WAAR
```

maar ook onwaar:

```text
15 < 10 → ONWAAR
```

Als de voorwaarde waar is, wordt een bepaalde actie uitgevoerd. Als de voorwaarde niet waar is, gebeurt iets anders.

---

## Stroomdiagrammen

Een algoritme kun je niet alleen in woorden beschrijven, maar ook tekenen.

Een veelgebruikte manier is een **stroomdiagram**.

In een eenvoudig stroomdiagram gebruiken we onder andere:

- rechthoeken voor opdrachten;
- ruiten voor beslissingen;
- pijlen om de volgorde aan te geven.

Bijvoorbeeld:

```text
          ┌─────────────┐
          │   START     │
          └──────┬──────┘
                 │
                 v
        ┌────────────────┐
        │ Lees temperatuur │
        └────────┬───────┘
                 │
                 v
           ┌───────────┐
           │ < 10 °C ? │
           └─────┬─────┘
             ja │ nee
               │
      ┌────────┘ └────────┐
      v                    v
┌────────────────┐   ┌────────────────┐
│ Neem een jas  │   │ Geen jas      │
│ mee           │   │ nodig         │
└───────┬──────┘   └──────┬────────┘
        │                   │
        └───────────┬───────┘
                    v
              ┌──────────┐
              │   EINDE  │
              └──────────┘
```

De ruit stelt de beslissing voor.

Er zijn twee mogelijke uitgangen:

```text
JA
```

en:

```text
NEE
```

Dit is vergelijkbaar met een toestandsdiagram, maar het doel is anders.

Bij een toestandsdiagram beschrijven we:

> In welke toestand zit het systeem en naar welke toestand gaat het?

Bij een stroomdiagram beschrijven we:

> Welke stap voert het algoritme nu uit en welke stap komt daarna?

---

## Toestandsdiagram of stroomdiagram?

De twee diagrammen lijken op elkaar, maar hebben een ander doel.

Een **toestandsdiagram** beschrijft het gedrag van een systeem dat tussen toestanden kan wisselen.

Een **stroomdiagram** beschrijft de stap-voor-stap volgorde van een algoritme.

Bijvoorbeeld een deur:

```text
DICHT --openen--> OPEN
OPEN  --sluiten--> DICHT
```

Dit zegt iets over de toestand van de deur.

Een stroomdiagram kan daarna laten zien wat een programma doet als de deur open of dicht is:

```text
              START
                |
                v
        Is de deur dicht?
         /             \
       ja              nee
        |               |
        v               v
   Open de deur   Sluit de deur
        |               |
        └───────┬───────┘
                v
              EINDE
```

Een goede programmeur kan beide manieren van denken gebruiken.

---

## Van stroomdiagram naar Python

In het vorige hoofdstuk heb je `if`, `elif` en `else` al geleerd. We herhalen ze hier kort.

Een eenvoudige beslissing ziet er in Python zo uit:

```python
temperatuur = 7

if temperatuur < 10:
    print("Neem een jas mee.")
else:
    print("Je hebt waarschijnlijk geen jas nodig.")
```

Het algoritme is:

```text
Lees temperatuur.
Als temperatuur kleiner is dan 10:
    zeg "Neem een jas mee."
Anders:
    zeg "Je hebt waarschijnlijk geen jas nodig."
```

De Python-code is dus een vertaling van het algoritme.

---

## Een algoritme ontwerpen: eerst in gewone taal

Stel dat je een programma wilt maken dat controleert of iemand korting krijgt.

De regel is:

> Mensen jonger dan 12 jaar krijgen korting.

Begin dan niet meteen met Python. Schrijf eerst het algoritme in gewone taal:

```text
1. Vraag de leeftijd.
2. Controleer of de leeftijd kleiner is dan 12.
3. Als dat zo is, geef aan dat er korting is.
4. Anders geef aan dat er geen korting is.
```

Daarna kun je een stroomdiagram maken.

```text
START
  |
  v
Vraag leeftijd
  |
  v
Is leeftijd < 12?
   /          ja         nee
  |             |           |
  v             v           v
Korting      Geen korting
   \             |
    \____________|
          |
          v
        EINDE
```

Pas daarna schrijf je Python:

```python
leeftijd = 15

if leeftijd < 12:
    print("Je krijgt korting.")
else:
    print("Je krijgt geen korting.")
```

De volgorde is dus:

```text
probleem
   ↓
model
   ↓
algoritme
   ↓
programma
   ↓
testen
```

Niet: "direct typen zonder nadenken".

---

## Programma's ontwerpen

Je zou kunnen denken:

> Waarom tekenen we eerst allemaal diagrammen? Waarom gaan we niet meteen programmeren?

Dat is precies de verkeerde volgorde.

Als je direct begint met code schrijven, kun je gemakkelijk iets maken dat toevallig werkt, maar niet echt goed is. Je weet dan niet altijd waarom het werkt.

Bij informatica willen we eerst het probleem begrijpen.

Daarom gebruiken we een vaste aanpak:

```text
probleem
   ↓
begrijpen
   ↓
gegevens vastleggen
   ↓
beslissingen bepalen
   ↓
algoritme ontwerpen
   ↓
stroomdiagram tekenen
   ↓
programma schrijven
   ↓
testen
```

Een stroomdiagram is dus een **model** van het gedrag van een algoritme.

Python is vervolgens een manier om dat model door een computer te laten uitvoeren.

---

## Begrippenlijst

Aan het einde van deze week moet je de volgende begrippen kunnen uitleggen:

**Algoritme**  
Een eindige, eenduidige reeks stappen om een probleem op te lossen.

**Input**  
De informatie die het algoritme binnenkrijgt.

**Verwerking**  
Wat het algoritme met de input doet.

**Output**  
Het resultaat dat het algoritme geeft.

**Voorwaarde**  
Een vergelijking of check die waar of onwaar is.

**Beslissing**  
Het kiezen tussen verschillende acties op basis van een voorwaarde.

**Stroomdiagram**  
Een diagram dat de stappen en beslissingen van een algoritme laat zien.

**Variabele**  
Een naam waarmee een programma informatie kan onthouden.

**`if`**  
Een Python-constructie waarmee een programma een keuze kan maken.

**`elif`**  
Een extra voorwaarde die wordt gecontroleerd als een eerdere voorwaarde niet waar was.

**`else`**  
Geeft aan wat er gebeurt als geen van de eerdere voorwaarden waar is.

---

# Opdrachten

1. Temperatuur beoordelen

   Een programma moet een temperatuur beoordelen.

   Gebruik deze regels:
   - onder 0 °C: `Het vriest.`
   - van 0 °C tot en met 15 °C: `Het is koud.`
   - boven 15 °C: `Het is niet koud.`

   a. Schrijf het algoritme in gewone taal.

   b. Teken een stroomdiagram.

   c. Schrijf daarna de Python-code. Gebruik `if`, `elif` en `else`.

   d. Test je programma met de waarden:

   ```text
   -5
   0
   8
   15
   16
   30
   ```

   Maak een tabel met de verwachte uitvoer en de echte uitvoer.

---

2. Game-score

   Maak een programma dat een score van een speler beoordeelt.

   Gebruik:

   ```text
   0 t/m 99       → Beginner
   100 t/m 499    → Gevorderd
   500 of hoger   → Expert
   ```

   a. Maak eerst een stroomdiagram.

   b. Schrijf het algoritme in gewone taal.

   c. Schrijf het programma in Python.

   d. Test met deze waarden:

   ```text
   0
   50
   99
   100
   250
   499
   500
   1000
   ```

   Controleer of je programma voor alle waarden het juiste resultaat geeft.

---

3. Voldoende of onvoldoende?

   Schrijf een programma dat drie cijfers krijgt en bepaalt of het gemiddelde voldoende is.

   Gebruik:

   ```text
   gemiddelde ≥ 5,5 → voldoende
   gemiddelde < 5,5 → onvoldoende
   ```

   a. Schrijf eerst het algoritme in gewone taal.

   b. Maak een stroomdiagram.

   c. Schrijf de Python-code.

   d. Test met minstens vijf verschillende combinaties van cijfers. Let hierbij op grensgevallen.

   e. Waarom is een grensgeval belangrijk?

---

4. Waar zit de fout?

   Bekijk dit programma:

   ```python
   leeftijd = 18

   if leeftijd > 18:
       print("Je bent volwassen.")
   else:
       print("Je bent niet volwassen.")
   ```

   a. Wat print het programma?

   b. Is dat volgens jou correct?

   c. Verbeter het programma.

   d. Bedenk zelf drie testwaarden waarmee je kunt controleren of de verbetering goed werkt.

---

5. Attractie

   Ontwerp een programma voor een attractie.

   De voorwaarden zijn:
   - minimaal 140 cm lang;
   - én minimaal 10 jaar oud.

   a. Maak eerst een stroomdiagram.

   b. Schrijf het algoritme in gewone taal.

   c. Schrijf de Python-code.

   d. Test alle combinaties van:

   ```text
   lengte: 130 cm of 150 cm
   leeftijd: 8 jaar of 12 jaar
   ```

   Maak hiervan een tabel.

---

6. Wat moet de computer beslissen?

   Voor elk van de volgende problemen bepaal je eerst:
   1. welke input nodig is;
   2. welke output het programma moet geven;
   3. welke beslissing(en) het programma moet nemen;
   4. het algoritme in gewone taal;
   5. een stroomdiagram.

   Je hoeft nog geen Python te schrijven.

   ### Probleem A — korting

   Een bioscoop geeft korting aan bezoekers jonger dan 12 jaar.

   Bepaal of iemand korting krijgt.

   ### Probleem B — positief, nul of negatief

   Een gebruiker voert een getal in.

   Bepaal of het getal positief, nul of negatief is.

   ### Probleem C — even of oneven

   Een gebruiker voert een geheel getal in.

   Bepaal of het getal even of oneven is.

   ### Probleem D — wachtwoord

   Een gebruiker voert een wachtwoord in.

   Als het wachtwoord correct is, geef:

   ```text
   Toegang toegestaan
   ```

   Anders:

   ```text
   Toegang geweigerd
   ```

---

7. Testen van algoritmen

   Een programma dat zonder foutmelding draait, hoeft nog niet correct te zijn.

   Je moet controleren of het programma voor verschillende waardes het juiste resultaat geeft.

   a. Maak een testplan voor het volgende programma:

   ```python
   score = 100

   if score < 100:
       print("Beginner")
   elif score < 500:
       print("Gevorderd")
   else:
       print("Expert")
   ```

   b. Gebruik minimaal zeven testgevallen.

   c. Voorspel eerst de uitvoer.

   d. Voer daarna het programma uit.

   e. Kloppen alle uitkomsten met de bedoeling van het algoritme?

---

8. Ontwerp een eigen algoritme

   Kies een probleem uit je eigen leven of uit een game, een app of een systeem in de school.

   a. Beschrijf het probleem.

   b. Bepaal de input en de output.

   c. Schrijf het algoritme in gewone taal.

   d. Teken een stroomdiagram.

   e. Schrijf de Python-code.

   f. Test je programma met minstens drie verschillende situaties.

   g. Verbeter je programma als je fouten tegenkomt.

---

## Afronding

In dit hoofdstuk heb je geleerd dat programmeren niet alleen gaat over het schrijven van code. Het begint met goed nadenken over een probleem en over de juiste beslissingen.

Een algoritme is een vaste, logische reeks van stappen. Door een probleem eerst te begrijpen, een stroomdiagram te maken en daarna pas code te schrijven, wordt het programmeren veel duidelijker en betrouwbaarder.

Een goede programmeur weet dus:

- wat de input is;
- wat de output moet zijn;
- welke beslissingen nodig zijn;
- hoe je een algoritme test;
- hoe je fouten verbetert.

Dat is precies de basis van goed programmeren.
