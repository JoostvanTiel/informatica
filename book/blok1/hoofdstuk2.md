# Hoofdstuk 2: Algoritmen & beslissingen

## Leerdoelen

In het vorige hoofdstuk heb je geleerd hoe je een systeem kunt beschrijven met **toestanden**, **inputs** en **overgangen**. Je hebt gezien dat een toestandsdiagram een model kan zijn van het gedrag van een systeem.

In dit hoofdstuk maken we de stap van zo'n model naar een **algoritme**.

Je leert:

- wat een algoritme is;
- hoe je een probleem eerst analyseert voordat je gaat programmeren;
- hoe je beslissingen in een algoritme beschrijft;
- hoe je beslissingen weergeeft met een stroomdiagram;
- hoe je een algoritme vertaalt naar Python;
- hoe je met `if`, `elif` en `else` verschillende situaties kunt afhandelen;
- hoe je een algoritme systematisch kunt testen;
- hoe je fouten in een algoritme kunt vinden en verbeteren.

Aan het einde van dit hoofdstuk kun je een eenvoudig probleem analyseren, een algoritme ontwerpen en dat algoritme vertalen naar Python.

---

# 1. Van toestandsautomaat naar algoritme

In het vorige hoofdstuk gebruikten we toestandsautomaten om het gedrag van systemen te beschrijven.

Bijvoorbeeld een automatische deur:

```text
DICHT --openen--> OPEN
OPEN  --sluiten--> DICHT
```

De automaat beschrijft **wat er gebeurt wanneer een bepaalde input binnenkomt**.

Bij programmeren komen we hetzelfde idee voortdurend tegen.

Een programma krijgt informatie binnen en moet vervolgens bepalen wat het moet doen.

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

Een algoritme beschrijft stap voor stap hoe die beslissing moet worden genomen.

---

# 2. Wat is een algoritme?

Een **algoritme** is een eindige, eenduidige reeks stappen waarmee je een probleem oplost of een taak uitvoert.

Een algoritme lijkt dus op een recept.

Bij een recept staan bijvoorbeeld:

1. Pak een kom.
2. Doe bloem in de kom.
3. Voeg melk toe.
4. Roer het mengsel.
5. Bak het beslag.

Bij een computerprogramma werkt het hetzelfde.

Een algoritme moet duidelijk zijn.

Als er staat:

> Maak het getal groot.

weet een computer niet wat hij moet doen.

Maar:

> Vermenigvuldig het getal met 2.

is wel een duidelijke instructie.

Een goed algoritme heeft daarom onder andere:

- een duidelijk begin;
- duidelijke stappen;
- zo weinig mogelijk onduidelijkheid;
- een duidelijk resultaat;
- een eindpunt.

---

# 3. Een probleem eerst begrijpen

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

Programmeren is dus niet hetzelfde als een algoritme ontwerpen.

Python is slechts de taal waarin je het algoritme uiteindelijk opschrijft.

---

# 4. Input, verwerking en output

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

Hier zit een beslissing in het algoritme.

---

# 5. Beslissingen

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
 JA ─────→ neem paraplu mee
  |
 NEE
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

---

# 6. Stroomdiagrammen

Een algoritme kun je beschrijven met tekst, maar je kunt het ook tekenen.

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
        ┌─────────────────┐
        │ Lees temperatuur│
        └────────┬────────┘
                 │
                 v
           ┌───────────┐
           │ < 10 °C ? │
           └─────┬─────┘
              ja │ nee
                 │
        ┌────────┘ └─────────┐
        v                    v
┌─────────────────┐   ┌──────────────┐
│ Neem een jas    │   │ Geen jas     │
│ mee             │   │ nodig        │
└────────┬────────┘   └──────┬───────┘
         │                   │
         └─────────┬─────────┘
                   v
             ┌──────────┐
             │   EINDE  │
             └──────────┘
```

De ruit stelt de beslissing voor.

Er zijn twee uitgangen:

```text
JA
```

en:

```text
NEE
```

Dit is vergelijkbaar met een toestandsdiagram.

Bij een toestandsdiagram beschrijven we:

> In welke toestand zit het systeem en naar welke toestand gaat het?

Bij een stroomdiagram beschrijven we:

> Welke stap voert het algoritme nu uit en welke stap komt daarna?

---

# 7. Toestandsdiagram of stroomdiagram?

De twee diagrammen lijken op elkaar, maar hebben een ander doel.

Een **toestandsdiagram** beschrijft het gedrag van een systeem dat tussen toestanden kan wisselen.

Een **stroomdiagram** beschrijft de stappen en beslissingen van een algoritme.

Bijvoorbeeld:

```text
TOESTANDSAUTOMAAT

DICHT --openen--> OPEN
OPEN  --sluiten--> DICHT
```

Dit zegt vooral iets over de toestand van de deur.

Een stroomdiagram kan vervolgens beschrijven hoe een programma beslist wat er met een deur moet gebeuren:

```text
              START
                |
                v
        Is er iemand bij de deur?
             /                  ja         nee
           /                     v             v
      Open deur     Sluit deur
           \           /
            \         /
              v     v
                EINDE
```

Een goede programmeur kan beide manieren van denken gebruiken.

---

# 8. Van stroomdiagram naar Python

In het vorige hoofdstuk heb je `if`, `elif` en `else` al leren kennen.

We herhalen ze hier kort.

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

# 9. Een algoritme ontwerpen: eerst in gewone taal

Stel dat je een programma wilt maken dat controleert of iemand korting krijgt.

De regel is:

> Mensen jonger dan 12 jaar krijgen korting.

Begin dan niet met Python.

Schrijf eerst het algoritme:

```text
1. Vraag de leeftijd.
2. Controleer of de leeftijd kleiner is dan 12.
3. Als dat zo is, geef aan dat er korting is.
4. Anders geef aan dat er geen korting is.
```

Daarna kun je een stroomdiagram maken:

```text
START
  |
  v
Vraag leeftijd
  |
  v
Is leeftijd < 12?
   /        ja         nee
 |           |
 v           v
Korting    Geen korting
 |           |
 └─────┬─────┘
       v
     EINDE
```

En pas daarna schrijf je Python:

```python
leeftijd = 15

if leeftijd < 12:
    print("Je krijgt korting.")
else:
    print("Je krijgt geen korting.")
```

---

# 10. Oefening — temperatuur

Ontwerp een algoritme dat een temperatuur beoordeelt.

Gebruik deze regels:

- onder 0 °C: `Het vriest.`
- van 0 °C tot en met 15 °C: `Het is koud.`
- boven 15 °C: `Het is niet koud.`

## Opdracht 1

Schrijf het algoritme eerst in gewone taal.

Gebruik nog geen Python.

## Opdracht 2

Teken een stroomdiagram.

Je hebt meerdere beslissingen nodig.

## Opdracht 3

Schrijf daarna het algoritme in Python.

Gebruik `if` en `elif`.

Een mogelijke structuur is:

```python
temperatuur = 8

if ...:
    print(...)
elif ...:
    print(...)
else:
    print(...)
```

Vul de voorwaarden en uitvoer zelf in.

## Opdracht 4

Test je programma met:

```text
-5
0
8
15
16
30
```

Maak een tabel:

| Temperatuur | Verwachte uitvoer | Uitvoer programma | Goed? |
| ----------: | ----------------- | ----------------- | ----- |
|          -5 |                   |                   |       |
|           0 |                   |                   |       |
|           8 |                   |                   |       |
|          15 |                   |                   |       |
|          16 |                   |                   |       |
|          30 |                   |                   |       |

---

# 11. Beslissingen stapelen

Soms is één beslissing niet genoeg.

Stel dat een game drie verschillende situaties kent:

```text
score < 10
score van 10 t/m 19
score ≥ 20
```

Een stroomdiagram kan er bijvoorbeeld zo uitzien:

```text
                START
                  |
                  v
             Lees score
                  |
                  v
            score < 10?
             /                  ja         nee
           |           |
           v           v
        Beginner   score < 20?
                     /                         ja        nee
                   |          |
                   v          v
               Gevorderd    Expert
                   \          /
                    \        /
                      v    v
                       EINDE
```

In Python kan dit bijvoorbeeld:

```python
score = 17

if score < 10:
    print("Beginner")
elif score < 20:
    print("Gevorderd")
else:
    print("Expert")
```

Let op dat de tweede voorwaarde alleen wordt bekeken als de eerste voorwaarde niet waar was.

---

# 12. Oefening — game-score

Maak een programma dat een score van een speler beoordeelt.

Gebruik:

```text
0 t/m 99       → Beginner
100 t/m 499    → Gevorderd
500 of hoger   → Expert
```

## Opdracht 5

Maak eerst een stroomdiagram.

## Opdracht 6

Schrijf het algoritme in gewone taal.

## Opdracht 7

Schrijf het programma in Python.

## Opdracht 8

Test met:

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

# 13. Een beslissing kan ook een berekening bevatten

Voorwaarden hoeven niet alleen vaste waarden te controleren.

Je kunt eerst iets berekenen en daarna een beslissing nemen.

Bijvoorbeeld:

> Een leerling heeft drie cijfers. Bereken het gemiddelde en bepaal daarna of de leerling gemiddeld een voldoende heeft.

Het algoritme:

```text
1. Lees drie cijfers.
2. Bereken het gemiddelde.
3. Als het gemiddelde 5,5 of hoger is:
       geef "voldoende".
4. Anders:
       geef "onvoldoende".
```

In Python:

```python
cijfer1 = 7
cijfer2 = 6
cijfer3 = 5

gemiddelde = (cijfer1 + cijfer2 + cijfer3) / 3

if gemiddelde >= 5.5:
    print("Voldoende")
else:
    print("Onvoldoende")
```

Hier zie je iets belangrijks:

```text
input
  ↓
berekening
  ↓
beslissing
  ↓
output
```

---

# 14. Oefening — voldoende of onvoldoende?

Schrijf een programma dat drie cijfers krijgt en bepaalt of het gemiddelde voldoende is.

Gebruik:

```text
gemiddelde ≥ 5,5 → voldoende
gemiddelde < 5,5 → onvoldoende
```

## Opdracht 9

Schrijf eerst het algoritme in gewone taal.

## Opdracht 10

Maak een stroomdiagram.

## Opdracht 11

Schrijf de Python-code.

## Opdracht 12

Test met minstens vijf verschillende combinaties van cijfers.

Let daarbij op grensgevallen.

Test bijvoorbeeld ook:

```text
5.5
```

Waarom is een grensgeval belangrijk?

---

# 15. Grenswaarden

Een algoritme kan er op het eerste gezicht goed uitzien, maar toch fouten bevatten.

Stel dat je schrijft:

```python
if leeftijd > 18:
    print("Volwassen")
else:
    print("Niet volwassen")
```

Wat gebeurt er bij:

```text
18
```

Als je bedoelt dat iemand vanaf 18 jaar volwassen is, klopt het algoritme niet.

Je had dan moeten schrijven:

```python
if leeftijd >= 18:
    print("Volwassen")
else:
    print("Niet volwassen")
```

Het verschil tussen:

```text
>
```

en:

```text
>=
```

kan dus belangrijk zijn.

Andere vergelijkingsoperatoren zijn:

| Operator | Betekenis                 |
| -------- | ------------------------- |
| `==`     | gelijk aan                |
| `!=`     | niet gelijk aan           |
| `<`      | kleiner dan               |
| `>`      | groter dan                |
| `<=`     | kleiner dan of gelijk aan |
| `>=`     | groter dan of gelijk aan  |

---

# 16. Oefening — waar zit de fout?

Bekijk dit programma:

```python
leeftijd = 18

if leeftijd > 18:
    print("Je bent volwassen.")
else:
    print("Je bent niet volwassen.")
```

## Opdracht 13

Wat print het programma?

## Opdracht 14

Is dat volgens jou correct?

## Opdracht 15

Verbeter het programma.

## Opdracht 16

Bedenk zelf drie testwaarden waarmee je kunt controleren of je verbetering goed werkt.

---

# 17. Meerdere voorwaarden

Soms moet een beslissing afhankelijk zijn van meerdere voorwaarden.

Bijvoorbeeld:

> Je mag een bepaalde attractie in als je minimaal 140 cm lang bent én minimaal 10 jaar oud bent.

In Python:

```python
lengte = 145
leeftijd = 12

if lengte >= 140 and leeftijd >= 10:
    print("Je mag in de attractie.")
else:
    print("Je mag niet in de attractie.")
```

Het woord `and` betekent:

> beide voorwaarden moeten waar zijn.

Je kunt ook `or` gebruiken.

Bijvoorbeeld:

> Je krijgt een melding als het hard regent of als er storm wordt verwacht.

```python
regen = True
storm = False

if regen or storm:
    print("Let op het weer.")
```

Bij `or` is het voldoende als één van de voorwaarden waar is.

---

# 18. Oefening — attractie

Ontwerp een programma voor een attractie.

De voorwaarden zijn:

- minimaal 140 cm lang;
- én minimaal 10 jaar oud.

## Opdracht 17

Maak eerst een stroomdiagram.

## Opdracht 18

Schrijf het algoritme in gewone taal.

## Opdracht 19

Schrijf de Python-code.

## Opdracht 20

Test alle combinaties van:

```text
lengte: 130 cm of 150 cm
leeftijd: 8 jaar of 12 jaar
```

Je krijgt dus vier situaties.

Maak hiervan een tabel:

| Lengte | Leeftijd | Verwacht |
| -----: | -------: | -------- |
|    130 |        8 |          |
|    130 |       12 |          |
|    150 |        8 |          |
|    150 |       12 |          |

---

# 19. Van algoritme naar programma

We kunnen nu een vaste werkwijze gebruiken.

Als je een programmeerprobleem krijgt, werk dan volgens deze stappen:

```text
1. Begrijp het probleem.
        ↓
2. Bepaal de input.
        ↓
3. Bepaal de output.
        ↓
4. Bepaal welke beslissingen nodig zijn.
        ↓
5. Schrijf het algoritme in gewone taal.
        ↓
6. Maak eventueel een stroomdiagram.
        ↓
7. Vertaal het algoritme naar Python.
        ↓
8. Test het programma.
        ↓
9. Verbeter fouten.
```

Deze werkwijze voorkomt dat je zomaar code gaat schrijven zonder te weten wat je eigenlijk wilt programmeren.

---

# 20. Oefening — wat moet de computer beslissen?

Voor elk probleem hieronder bepaal je eerst:

1. Welke input is nodig?
2. Welke output moet het programma geven?
3. Welke beslissing(en) moet het programma nemen?
4. Schrijf het algoritme in gewone taal.
5. Teken een stroomdiagram.

Je hoeft bij deze oefening nog geen Python te schrijven.

## Probleem A — korting

Een bioscoop geeft korting aan bezoekers jonger dan 12 jaar.

Bepaal of iemand korting krijgt.

## Probleem B — positief of negatief

Een gebruiker voert een getal in.

Bepaal of het getal:

- positief;
- nul;
- negatief

is.

## Probleem C — even of oneven

Een gebruiker voert een geheel getal in.

Bepaal of het getal even of oneven is.

## Probleem D — wachtwoord

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

# 21. Van toestandsautomaat naar algoritme

We gaan terug naar het vorige hoofdstuk.

Stel dat een deurautomaat twee toestanden heeft:

```text
DICHT
OPEN
```

en twee inputs:

```text
openen
sluiten
```

Het toestandsdiagram:

```text
DICHT --openen--> OPEN
OPEN  --sluiten--> DICHT
```

Je kunt dit vertalen naar een algoritme:

```text
Als de toestand DICHT is:
    als de input openen is:
        verander toestand naar OPEN

Als de toestand OPEN is:
    als de input sluiten is:
        verander toestand naar DICHT
```

En vervolgens naar Python:

```python
toestand = "DICHT"
gebeurtenis = "openen"

if toestand == "DICHT" and gebeurtenis == "openen":
    toestand = "OPEN"

elif toestand == "OPEN" and gebeurtenis == "sluiten":
    toestand = "DICHT"

print(toestand)
```

Je ziet hier een belangrijk verband:

```text
toestandsdiagram
       ↓
algoritme
       ↓
Python
```

Het programmeren is dus niet het bedenken van de oplossing. Het is het **vertalen van een oplossing naar een programmeertaal**.

---

# 22. Oefening — verbeter de automaat

We breiden de deur uit.

De deur heeft nu drie toestanden:

```text
DICHT
OPENEN
OPEN
```

De inputs zijn:

```text
openen
geopend
sluiten
```

De regels zijn:

```text
DICHT + openen → OPENEN
OPENEN + geopend → OPEN
OPEN + sluiten → DICHT
```

## Opdracht 21

Teken het toestandsdiagram.

## Opdracht 22

Schrijf het algoritme in gewone taal.

## Opdracht 23

Vertaal het algoritme naar Python.

## Opdracht 24

Test de volgende reeks:

```text
openen
geopend
sluiten
```

Noteer na iedere input de toestand.

## Opdracht 25 — fout zoeken

Wat zou er volgens jouw automaat moeten gebeuren als de deur in toestand `OPEN` de input `openen` krijgt?

Bedenk een goede oplossing.

Je kunt bijvoorbeeld:

- niets doen;
- een foutmelding geven;
- de toestand `OPEN` behouden.

Leg uit waarom je voor jouw oplossing kiest.

---

# 23. Algoritmen testen

Een programma dat zonder foutmelding draait, hoeft nog niet correct te zijn.

Je moet controleren of het programma voor verschillende inputs het juiste resultaat geeft.

Daarvoor gebruik je **testgevallen**.

Een testgeval bestaat bijvoorbeeld uit:

```text
input → verwachte output
```

Bij het programma:

```python
if leeftijd >= 18:
    print("Volwassen")
else:
    print("Niet volwassen")
```

zijn goede testgevallen:

```text
17 → Niet volwassen
18 → Volwassen
19 → Volwassen
```

Waarom is 18 belangrijk?

Omdat 18 precies de grens is.

---

# 24. Testen met normale gevallen en grensgevallen

Bij het testen van een algoritme wil je niet alleen willekeurige waarden gebruiken.

Gebruik bijvoorbeeld:

**Normale waarden**

```text
25
40
60
```

**Grenswaarden**

```text
17
18
19
```

**Onverwachte waarden**

Bijvoorbeeld:

```text
0
-5
1000
```

Welke testgevallen je nodig hebt, hangt af van het probleem.

Het doel is:

> zo veel mogelijk verschillende situaties controleren waarin het algoritme zich anders zou kunnen gedragen.

---

# 25. Oefening — test een algoritme

Het volgende programma bepaalt het niveau van een speler:

```python
score = 100

if score < 100:
    print("Beginner")
elif score < 500:
    print("Gevorderd")
else:
    print("Expert")
```

## Opdracht 26

Maak een testplan met minimaal zeven testgevallen.

Gebruik in ieder geval:

```text
99
100
101
499
500
501
```

Voeg zelf nog één testgeval toe.

## Opdracht 27

Voorspel eerst de uitvoer.

## Opdracht 28

Voer daarna het programma uit.

## Opdracht 29

Kloppen alle uitkomsten met de bedoeling van het algoritme?

---

# 26. Een algoritme kan meerdere correcte oplossingen hebben

Voor een probleem bestaat niet altijd maar één goed algoritme.

Stel:

> Bepaal of een getal positief, nul of negatief is.

Een oplossing kan zijn:

```text
Als getal > 0:
    positief
Anders als getal < 0:
    negatief
Anders:
    nul
```

Maar je kunt de volgorde ook anders kiezen:

```text
Als getal == 0:
    nul
Anders als getal > 0:
    positief
Anders:
    negatief
```

Beide algoritmen kunnen correct zijn.

Bij algoritmen is dus niet alleen belangrijk:

> Werkt het?

Maar ook:

> Is het duidelijk, correct en goed te testen?

---

# 27. Eindopdracht — ontwerp je eigen beslisprogramma

Ontwerp een klein programma dat op basis van input één of meerdere beslissingen neemt.

Kies bijvoorbeeld:

- een programma dat bepaalt of iemand een bepaalde film mag zien;
- een programma dat een game-score beoordeelt;
- een programma dat bepaalt welk kledingadvies iemand krijgt op basis van temperatuur;
- een programma dat bepaalt of iemand een attractie in mag;
- een programma dat een getal classificeert;
- een programma dat een cijfer omzet naar een beoordeling;
- een eigen idee.

## Eisen

Je programma moet:

- minimaal twee verschillende invoergegevens gebruiken;
- minimaal drie mogelijke uitkomsten hebben;
- minimaal één `if` gebruiken;
- minimaal één `elif` of `else` gebruiken;
- minimaal één samengestelde voorwaarde met `and` of `or` bevatten;
- een duidelijk algoritme hebben;
- een stroomdiagram hebben;
- minimaal vijf testgevallen hebben;
- minimaal één grensgeval testen.

## Je werkt in deze volgorde

### Stap 1 — Beschrijf het probleem

Leg uit wat je programma moet doen.

### Stap 2 — Bepaal de input

Welke gegevens krijgt het programma?

### Stap 3 — Bepaal de output

Wat moet het programma uiteindelijk vertellen?

### Stap 4 — Ontwerp het algoritme

Schrijf de stappen in gewone taal.

### Stap 5 — Maak een stroomdiagram

Laat alle beslissingen en mogelijke routes zien.

### Stap 6 — Schrijf Python

Vertaal je algoritme naar Python.

### Stap 7 — Test

Maak minimaal vijf testgevallen.

Zorg ervoor dat je ten minste één grenswaarde test.

### Stap 8 — Evalueer

Beantwoord:

1. Werkt het programma voor alle testgevallen?
2. Zijn alle mogelijke situaties afgedekt?
3. Is je algoritme duidelijk?
4. Komt je Python-programma overeen met je algoritme?
5. Kun je je keuzes uitleggen?

---

# 28. Begrippenlijst

Aan het einde van dit hoofdstuk moet je de volgende begrippen kunnen uitleggen.

**Algoritme**  
Een eindige, eenduidige reeks stappen waarmee je een probleem oplost of een taak uitvoert.

**Input**  
Gegevens die een algoritme of programma binnenkrijgt.

**Output**  
Het resultaat dat een algoritme of programma oplevert.

**Voorwaarde**  
Een uitspraak die waar of onwaar kan zijn en waarmee een algoritme een beslissing kan nemen.

**Beslissing**  
Een keuze die een algoritme maakt op basis van een of meer voorwaarden.

**Stroomdiagram**  
Een diagram waarmee je de stappen en beslissingen van een algoritme kunt weergeven.

**Vergelijkingsoperator**  
Een operator waarmee je waarden met elkaar vergelijkt, zoals `==`, `<`, `>` en `>=`.

**`if`**  
Een Python-constructie waarmee een programma iets uitvoert als een voorwaarde waar is.

**`elif`**  
Een Python-constructie waarmee een volgende voorwaarde wordt gecontroleerd als eerdere voorwaarden niet waar waren.

**`else`**  
Een Python-constructie waarmee je beschrijft wat er gebeurt als geen van de eerdere voorwaarden waar was.

**`and`**  
Een logische operator waarbij beide voorwaarden waar moeten zijn.

**`or`**  
Een logische operator waarbij minimaal één van de voorwaarden waar moet zijn.

**Testgeval**  
Een specifieke invoer waarmee je controleert of een algoritme of programma correct werkt.

**Grensgeval**  
Een testgeval op of vlak rond een grens waarbij het gedrag van het algoritme kan veranderen.

**Toestandsdiagram**  
Een diagram waarmee je de toestanden en overgangen van een systeem beschrijft.

---

# 29. Samenvatting

In dit hoofdstuk heb je geleerd dat programmeren begint vóórdat je Python schrijft.

Een goede programmeur werkt eerst uit wat het probleem is.

Daarna ontwerp je een algoritme.

Bij problemen met beslissingen kun je dat algoritme bijvoorbeeld weergeven als een stroomdiagram.

De belangrijkste structuur is:

```text
probleem
   ↓
input en output bepalen
   ↓
beslissingen bepalen
   ↓
algoritme ontwerpen
   ↓
stroomdiagram maken
   ↓
Python-programma schrijven
   ↓
testen
   ↓
verbeteren
```

Je hebt ook gezien hoe dit aansluit op toestandsautomaten:

```text
TOESTANDSAUTOMAAT
toestanden + inputs + overgangen
            ↓
         algoritme
            ↓
          Python
```

Een toestandsdiagram en een stroomdiagram zijn niet hetzelfde, maar beide helpen je om vóór het programmeren na te denken over het gedrag van een systeem.

De belangrijkste vraag die je jezelf vanaf nu bij ieder programmeerprobleem moet stellen is:

> **Wat moet de computer precies doen, voor iedere mogelijke situatie?**
