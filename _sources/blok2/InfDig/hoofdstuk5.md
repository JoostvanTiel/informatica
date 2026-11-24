# Informatie Digitaal Hoofdstuk 5: Afbeeldingen, audio en video

## Leerdoelen

Niet alleen foto's en tekst zijn digitale informatie. Ook geluid en video bestaan uit data die een computer opslaat.

Je leert:

- hoe een digitale foto wordt opgeslagen;
- hoe geluid digitaal wordt gemaakt;
- wat een videoframes is;
- wat compressie betekent;
- waarom grote bestanden snel veel ruimte innemen.

Aan het einde van dit hoofdstuk kun je uitleggen dat afbeeldingen, audio en video allemaal gebaseerd zijn op data die in bitvorm wordt opgeslagen.

---

## Afbeeldingen

Een digitale foto is ook een verzameling pixels. Hoe meer pixels en hoe hoger de kleurkwaliteit, hoe groter het bestand.

Bij een foto geldt vaak:

- resolutie: aantal pixels;
- kleurdiepte: hoeveel kleuren kunnen worden opgeslagen;
- compressie: hoe compact het bestand is.

Bijvoorbeeld: een foto van 4000 x 3000 pixels heeft veel meer pixels dan een foto van 100 x 100 pixels.

---

## Audio: geluid als getallen

Geluidsfragmenten bestaan uit geluidsgolven.

Een computer kan dat niet echt als "geluid" opslaan, maar als een reeks metingen.

Dat heet **digitale audio**.

Belangrijk is:

- bemonsteringsfrequentie: hoeveel metingen per seconde;
- bits per sample: hoe precies het geluid is opgeslagen.

Hoe hoger deze waarden, hoe beter het geluid kan klinken, maar ook hoe groter het bestand wordt.

---

## Video: een reeks afbeeldingen

Video is niets meer dan veel stilstaande afbeeldingen achter elkaar.

Elk beeld heet een **frame**.

Bij 30 fps betekent dat:

```text
30 beelden per seconde
```

Als je 60 frames per seconde hebt, lijkt de beweging vloeiender.

Video combineert dus:

- veel beelden;
- kleurinformatie;
- geluidsinformatie;
- compressie.

---

## Compressie

Veel bestanden worden gecomprimeerd om kleiner te maken. De techniek zoekt patronen en verwijdert of vereenvoudigt informatie die minder belangrijk is.

Er zijn twee belangrijke soorten:

- **Verliesvrij**: alle oorspronkelijke gegevens kunnen weer worden hersteld.
- **Verliesgevoelig**: een deel van de gegevens gaat verloren. De verkleining is meestal groter.

Voorbeelden:

- PNG: vaak verliesvrij voor afbeeldingen;
- JPG: vaak met verlies voor foto's;
- MP3: compressie van audio;
- MP4: compressie van video.

Compressie is handig, omdat grote bestanden anders veel te veel ruimte zouden innemen. Soms is een klein kwaliteitsverlies merkbaar, maar soms is het verschil nauwelijks te zien of horen.

---

## Hoe werkt compressie bij een afbeelding?

Een verliesvrije afbeelding zoekt herhalende gegevens. Stel dat een rij van twaalf pixels allemaal blauw is:

```text
blauw blauw blauw blauw blauw blauw blauw blauw blauw blauw blauw blauw
```

Dat kan in een vereenvoudigde notatie worden opgeslagen als:

```text
12 x blauw
```

Er is geen informatie kwijt: alle twaalf pixels kunnen later precies hetzelfde worden gemaakt. PNG gebruikt hiervoor onder andere filters en patrooncompressie.

Bij een JPG kan met verlies worden gecomprimeerd. Kleine verschillen in kleuren kunnen worden samengevoegd. Een rij met:

```text
lichtblauw - lichtblauw - bijna lichtblauw - lichtblauw
```

kan daardoor bijna overal als dezelfde blauwe tint worden opgeslagen. Het oog ziet de kleine kleurverschillen nauwelijks. Sla je het bestand opnieuw op en weer met compressie, dan kan er nog meer informatie verloren gaan.

---

## Hoe werkt compressie bij audio?

Digitale audio bestaat uit veel meetwaarden. Zonder compressie bevat een mono-opname met een bemonsteringsfrequentie van 44.100 Hz en 16 bits per sample:

```text
44.100 samples per seconde x 16 bits x 10 seconden
= 7.056.000 bits
= 882.000 bytes
= ongeveer 861 KB
```

Bij MP3 met een bitrate van 128 kilobit per seconde bevat dezelfde tien seconden:

```text
128.000 bits per seconde x 10 seconden
= 1.280.000 bits
= 160.000 bytes
= ongeveer 156 KB
```

De MP3 is in dit vereenvoudigde voorbeeld ongeveer vijf keer kleiner.

MP3 laat vooral informatie weg die mensen moeilijk kunnen horen, bijvoorbeeld heel zachte geluiden vlak naast een veel harder geluid. Hierdoor kan het kwaliteitsverschil merkbaar zijn bij audioliefhebbers, maar is het geluid voor de meeste luisteraars goed genoeg.

---

## Hoe werkt compressie bij video?

Een frame van 1920 x 1080 pixels met 24 bits per pixel gebruikt onbewerkt:

```text
1920 x 1080 x 24 bits
= 49.766.400 bits
= ongeveer 6,22 MB per frame
```

Bij 30 fps duurt één seconde dus 30 x 6,22 MB = ongeveer 186,6 MB. Tien seconden onbewerkte video zou dus ongeveer 1,87 GB gebruiken.

Een MP4-bestand comprimeert die beelden op twee manieren:

1. **Binnen één frame:** kleine kleurverschillen en details worden vereenvoudigd.
2. **Tussen verschillende frames:** de achtergrond die hetzelfde blijft hoeft niet steeds opnieuw te worden opgeslagen.

Bijvoorbeeld: in een game verandert alleen de spelerpositie, terwijl de rest van de achtergrond gelijk blijft. In plaats van elke hele frame opnieuw op te slaan, bewaart de compressor de verandering en de positie van de speler.

Bij een bitrate van 5 megabit per seconde duurt tien seconden video ongeveer:

```text
5.000.000 bits per seconde x 10 seconden
= 50.000.000 bits
= 6,25 MB
```

Dat is veel kleiner dan de berekende onbewerkte versie.

Een snelle bewegende actie, veel details en 60 fps geven meer veranderingen per seconde. Dan is meer informatie nodig en wordt het gecomprimeerde bestand groter dan bij een stilstaande achtergrond met 24 fps.

---

## Vergelijking

| Soort bestand | Compressiemethode | Wat gebeurt er?                                                            | Voorbeeld                                                      |
| ------------- | ----------------- | -------------------------------------------------------------------------- | -------------------------------------------------------------- |
| PNG           | Vaak verliesvrij  | Patronen worden compact opgeslagen                                         | Twaalf blauwe pixels: `12 x blauw`                             |
| JPG           | Verliesgevoelig   | Kleine details en kleurverschillen worden samengevoegd                     | Een tekstlogo kan waziger worden                               |
| MP3           | Verliesgevoelig   | Moeilijk hoorbare geluiden worden weggelaten                               | Een liedje wordt enkele megabytes kleiner                      |
| MP4           | Verliesgevoelig   | Gelijkaardige beelden en bewegingen worden niet telkens opnieuw opgeslagen | Een onveranderde gameachtergrond wordt maar eenmaal opgeslagen |

---

## Samenvatting

- Afbeeldingen bestaan uit pixels.
- Audio bestaat uit digitale metingen van geluid.
- Video bestaat uit een reeks frames.
- Compressie maakt bestanden kleiner.
- Digitale media zijn allemaal gebaseerd op getallen.

## Check je begrip

1. Wat is een frame in een video?
2. Wat is compressie?
3. Waarom is een video vaak veel groter dan een foto?
4. Waarin verschillen JPG en PNG?

## Opdrachten

1. Afbeelding, geluid en video vergelijken

   <ol type='a'>
   <li>Noem één kenmerk van een digitale foto, één van geluid en één van video.</li>
   <li>Leg uit waarom een video vaak veel meer ruimte inneemt dan een foto.</li>
   <li>Welke combinatie van factoren maakt een video meestal groot?</li>
   </ol>

2. Compressie

   <ol type='a'>
   <li>Noem het verschil tussen verliesvrij en verliesgevoelig comprimeren.</li>
   <li>Geef een voorbeeld van een bestandstype dat vaak verliesvrij wordt gecomprimeerd.</li>
   <li>Geef een voorbeeld van een bestandstype dat vaak met verlies wordt gecomprimeerd.</li>
   </ol>

3. Toepassingsvraag

   Je wilt een korte gamevideo met muziek uploaden, maar de app geeft aan dat het bestand te groot is.

   <ol type='a'>
   <li>Wat kun je doen om het bestand kleiner te maken?</li>
   <li>Welke informatie mag eventueel verloren gaan zonder dat het filmpje onbruikbaar wordt?</li>
   <li>Waarom is compressie nodig bij digitale media?</li>
   </ol>

4. Denk na over een filmpje

   <ol type='a'>
   <li>Noem twee dingen die een gamevideo groter maken dan een gewone foto.</li>
   <li>Waarom kunnen beelden per seconde (fps) invloed hebben op het bestand?</li>
   <li>Kies een bestandstype en leg uit waarom je dat type bij een gamevideo zou gebruiken.</li>
   </ol>

### Inzichtsvragen

1. Wat is een frame in een video?
2. Waarom is een foto niet hetzelfde als een video?
3. Hoe kun je het begrip `compressie` in één zin uitleggen?

[//]: # ## Afbeeldingen en bronnen
[//]: # - Zelf maken: maak een korte reeks van 5 verschillende plaatjes die een simpele beweging laten zien.
[//]: # - Online zoeken: [Video compressie uitleg](https://www.youtube.com/results?search_query=video+compressie+uitleg)
[//]: # - Online zoeken: [Wikipedia: digitale audio](https://nl.wikipedia.org/wiki/Digitale_audio)
[//]: # - Online zoeken: [Wikipedia: MPEG-4](https://nl.wikipedia.org/wiki/MPEG-4)
