# Informatie Digitaal Hoofdstuk 1: Digitale afbeeldingen, pixels en kleur

## Leerdoelen

In dit hoofdstuk leer je hoe een computer een afbeelding opslaat. Een foto, een logo of een gamebeeld bestaat uit heel veel kleine elementen. Die kleine elementen heten **pixels**.

Je leert:

- wat een pixel is;
- hoe een computer kleur opslaat;
- wat een pixelafbeelding is;
- waarom beeldkwaliteit afhangt van het aantal pixels;
- hoe een afbeelding in een programma kan worden opgebouwd.

Aan het einde van dit hoofdstuk kun je uitleggen hoe een digitale afbeelding in een computer is opgeslagen en waarom een kleine tekening uit duizenden kleine kleurpunten bestaat.

---

## Wat is een pixel?

Een digitale afbeelding is geen continue tekening zoals op papier. Een computer werkt met getallen. Daarom moet een afbeelding worden opgesplitst in kleine vierkantjes.

Elk zo'n vierkantje is een **pixel**.

Het woord pixel komt van:

- **pic** = beeld
- **sel** = element

Een pixel is dus een klein beeld-element.

Hieronder zie je een afbeelding met een grootte van 8 bij 8 pixels. Deze afbeelding bestaat uit 64 kleine vakjes. Elke vakje heeft een kleur. Samen vormen de vakjes het beeld van een pokeball.

![8 bij 8 afbeelding van een pokeball](img/2.1_pokeball.png)

```text
8 x 8 pixels = 64 kleine kleurvlakken
```

Als een afbeelding groter is, dan heeft het meer pixels en meestal een hogere kwaliteit.

---

## Een afbeelding bestaat uit veel kleine vakjes

Een gewone foto is niet één groot blok kleur. In een computer wordt elke pixel apart opgeslagen.

Bijvoorbeeld:

```text
[ ] [ ] [ ] [ ]
[ ] [x] [x] [ ]
[ ] [x] [x] [ ]
[ ] [ ] [ ] [ ]
```

Hier zie je een heel simpel zwart-wit voorbeeld. De `x`-tekens zijn pixels die donker zijn. De `[]`-tekens zijn pixels die licht zijn.

Als je een afbeelding van 1000 x 1000 pixels hebt, dan heb je al 1.000.000 pixels. Dat is veel informatie!

---

## Kleur opslaan

Een computer kan niet gewoon "rood" of "blauw" opslaan zoals wij dat zeggen. Een computer werkt met getallen.

Meestal gebruikt een computer **RGB-kleur**.

- R = red = rood
- G = green = groen
- B = blue = blauw

Iedere kleur wordt opgeslagen als een combinatie van deze drie kleuren.

Bijvoorbeeld:

- wit = (255, 255, 255)
- zwart = (0, 0, 0)
- rood = (255, 0, 0)
- groen = (0, 255, 0)
- blauw = (0, 0, 255)

Elke waarde ligt tussen 0 en 255.

Dus:

```text
kleur = (R, G, B)
```

Voorbeeld:

```text
(255, 0, 0) = rood
(0, 255, 0) = groen
(128, 128, 128) = grijs
```

De combinatie van 3 getallen levert dus een kleur op.
Met de onderstaande tool kun je kijken welke RGB-waardes horen bij verschillende kleuren:

<input type="color">

---

## Hoeveel informatie zit in een pixel?

Een pixel kan niet alleen zwart of wit zijn. Hij kan ook een kleur hebben.

Als je een pixel in 256 verschillende tinten rood, groen en blauw wilt kunnen opslaan, dan heb je 3 waarden nodig.

Dat betekent:

- 256 mogelijkheden voor rood
- 256 mogelijkheden voor groen
- 256 mogelijkheden voor blauw

Samen kun je dan miljoenen kleuren maken.

```text
256 x 256 x 256 = 16.777.216 kleuren
```

Dat is het aantal kleuren dat een gewone RGB-afbeelding kan hebben.

---

## Resolutie

De kwaliteit van een afbeelding hangt af van de **resolutie**.

Dat is het aantal pixels in de afbeelding.

Bijvoorbeeld:

- 640 x 480 pixels
- 1920 x 1080 pixels
- 3840 x 2160 pixels

Hoe meer pixels, hoe scherper de afbeelding meestal is.

Maar hoe meer pixels, hoe meer opslagruimte nodig is.

```text
meer pixels = scherpere foto = meer geheugen
```

---

## Voorbeeld: een kleine afbeelding

Stel je voor dat je een 4 x 4 pixelafbeelding hebt.

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,0,0)     (255,0,0)     (255,255,255)
(255,255,255) (255,0,0)     (255,0,0)     (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

De rode pixels vormen samen een klein vierkantje op een witte achtergrond.

Zo kunnen eenvoudige plaatjes worden gemaakt met pixels.

---

## Samenvatting

- Een afbeelding bestaat uit veel kleine pixels.
- Elke pixel heeft een kleur.
- Kleur wordt vaak opgeslagen als RGB.
- Een pixel is dus eigenlijk een getal of een combinatie van getallen.
- Hoe meer pixels, hoe scherper en ook vaak groter het bestand.

## Check je begrip

1. Wat is een pixel?
2. Waarom kun je een afbeelding niet als één getal opslaan?
3. Wat betekent RGB?
4. Wat gebeurt er met de kwaliteit van een afbeelding als je meer pixels gebruikt?

## Opdrachten

1. Pixeltekening maken

   a. Teken een 5x5-pixelbeeld op papier. Gebruik alleen zwart en wit. Laat in het midden een klein vierkantje zien.

   b. Geef voor 5 pixels aan welke kleur die pixel heeft. Gebruik hierbij de letters `W` (wit) en `Z` (zwart).

   c. Leg uit waarom een computer een foto niet als één grote kleur opslaat, maar als veel kleine vakjes.

2. Kleurcodes

   a. Schrijf drie verschillende RGB-kleuren op en leg uit wat elk getal betekent.

   b. Welke kleur krijg je bij `(255, 0, 0)`? En bij `(0, 255, 0)`? En bij `(0, 0, 255)`?

   c. Welke kleur heeft de RGB-code `(160, 160, 20)`? Controleer je antwoord met [de tool in de paragraaf](#kleur-opslaan)

   d. Noem een manier om een afbeelding scherper te maken zonder de afbeelding te vergroten.

3. Toepassingsvraag

   Een game laat een karakter op het scherm bewegen. Het beeld lijkt schokkend en wazig.

   a. Waarom kan een hogere resolutie ervoor zorgen dat het beeld beter uitziet?

   b. Waarom heeft een game met veel pixels vaak meer geheugen nodig?

   c. Welk effect heeft het als je een afbeelding verkleint? Noem één voordeel en één nadeel.

4. Ontwerp je game-karakter

   a. Ga naar [deze website](https://www.pixilart.com/draw) en maak een nieuwe afbeelding met een grootte van 16 bij 16 pixels.

   b. Teken een karakter dat je in je game wil gaan gebruiken. Zorg dat het karakter naar rechts kijkt en dat elke pixel een kleur heeft.

   c. Sla de tekening op en download de afbeelding als '.png'.

   c. Maak nog een tekening waarbij het karakter naar links kijkt. Sla ook deze afbeelding op en download hem als '.png'.

   d. Extra: Maak nog twee tekening, één waarbij het karakter omhoog kijkt en één waarbij het karakter omlaag kijkt.
