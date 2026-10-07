# Informatie Digitaal Hoofdstuk 4: Digitale tekst

## Leerdoelen

Tekst is iets dat wij als mensen gewend zijn. Voor een computer is tekst alleen een reeks getallen. Daarom moeten letters en symbolen eerst worden omgezet naar een getalvorm.

Je leert:

- hoe tekst in een computer wordt opgeslagen;
- wat ASCII is;
- waarom Unicode belangrijk is;
- hoe een letter wordt omgerekend naar bytes;
- hoe emoji en vreemde tekens worden gecodeerd.

Aan het einde van dit hoofdstuk kun je uitleggen waarom een computer letters niet echt als letters opslaat, maar als getallen.

---

## Tekst is informatie

Een boek, een website of een opdracht in Thonny zijn allemaal vormen van tekst.

Voor een computer is tekst niets meer dan een serie van bits.

Bijvoorbeeld:

```text
H
i
```

Die letters worden vertaald naar bestanden met getallen. De computer weet dan welke letters op het scherm moeten verschijnen.

---

## ASCII

Een van de eerste standaardiseringen was **ASCII**.

ASCII staat voor:

- American Standard Code for Information Interchange

ASCII geeft elke letter, cijfer en leesteken een nummer.

Voorbeeld:

```text
A = 65
B = 66
a = 97
0 = 48
spatie = 32
```

Dat betekent dat een computer bijvoorbeeld de letter `A` opslaat als het getal 65.

```text
A -> 65
```

ASCII is handig, maar het werkt alleen voor een beperkt aantal tekens.

---

## Unicode

Tegenwoordig gebruiken computers vaak **Unicode**.

Unicode is een veel grotere standaard voor tekens. Het kan niet alleen letters uit het Engels opslaan, maar ook:

- letters uit het Nederlands;
- letters met accenten;
- Griekse letters;
- Arabische en Chinese tekens;
- emoji.

Bijvoorbeeld:

- `é` heeft een Unicode-code;
- `€` heeft een Unicode-code;
- 😀 heeft een Unicode-code.

Unicode maakt het mogelijk dat computers wereldwijd dezelfde tekst op dezelfde manier kunnen weergeven.

---

## Van tekst naar bits

Een computer zet een tekst om in bytes.

Bijvoorbeeld:

```text
A
```

kan worden opgeslagen als:

```text
01000001
```

Dat is 8 bits, dus 1 byte.

Een woord zoals:

```text
HI
```

kan in bits worden geschreven als:

```text
01001000 01001001
```

Zo weet de computer precies welke letters het scherm moet tonen.

---

## Waarom accenten en emoji lastig zijn

Een tekstbestand met alleen ASCII kan niet alle talen goed laten zien.

Daarom zijn er uitbreidingen nodig.

Een letter met een accent zoals `é` is niet hetzelfde als `e`.

En een emoji zoals 😀 is ook een speciaal teken met een unieke code.

Dat laat zien dat digitale tekst meer is dan een aantal letters in een document. Het is een systeem van codes en patronen.

---

## Tekst in programma's

In Python kun je tekst opslaan in een variabele:

```python
naam = "Joost"
```

Python slaat die tekst intern op als een reeks tekens, dat weer is opgebouwd uit codes.

```python
tekst = "Hallo"
print(tekst)
```

Het scherm kan die codes weer omzetten naar letters.

---

## Samenvatting

- Tekst bestaat uit tekens.
- Tekens worden door computers gecodeerd in getallen.
- ASCII is een beperkte standaard.
- Unicode is een veel grotere standaard en werkt voor veel talen en symbolen.
- Een computer slaat tekst dus niet als letters op, maar als codes.

## Check je begrip

1. Wat is ASCII?
2. Waarom is Unicode nodig?
3. Hoe kun je een letter in de computer opslaan?
4. Hoe komt een emoji op het scherm?

## Afbeeldingen en bronnen

- Zelf maken: zet je eigen naam om in ASCII of maak een kleine tabel met een paar letters en hun code.
- Online zoeken: [ASCII tabel](https://www.asciitable.com/)
- Online zoeken: [Unicode tabel](https://home.unicode.org/)
- Online zoeken: [Wikipedia: Unicode](https://nl.wikipedia.org/wiki/Unicode)

## Opdrachten

**Kernroute (verplicht):** opdracht 1 en 2. **Plusroute:** opdracht 3.

1. Tekst in codes

   a. Zet je eigen voornaam om in een kleine ASCII-tabel. Gebruik minimaal 4 letters.
   b. Wat is het verschil tussen ASCII en Unicode?
   c. Leg uit waarom een computer een letter als getal opslaat.

2. Codeer een boodschap

   a. Kies een korte zin, zoals `HI` of `CODE`.
   b. Schrijf uit hoe die tekst in bits kan worden opgeslagen.
   c. Waarom is een emoji niet hetzelfde als een gewone letter?

3. Toepassingsvraag

   Je opent een verhaal in een app en ziet vreemde tekens in plaats van de juiste letters.

   a. Welke oorzaak kan daar aan liggen?
   b. Waarom is Unicode een belangrijke verbetering ten opzichte van ASCII?
   c. Noem één voorbeeld van een teken dat alleen met Unicode goed werkt.

### Inzichtsvragen

1. Wat betekent het woord `coderen` in deze context?
2. Waarom kan een tekstbestand niet zomaar uit losse letters bestaan voor een computer?
3. Wat is het voordeel van Unicode voor mensen over de hele wereld?
