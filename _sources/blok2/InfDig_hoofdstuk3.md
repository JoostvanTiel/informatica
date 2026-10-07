# Informatie Digitaal Hoofdstuk 3: Talstelsels

## Leerdoelen

Computers gebruiken niet alleen het decimale stelsel zoals wij in het dagelijks leven doen. Ze gebruiken vooral het **binaire** en soms ook het **hexadecimale** stelsel.

Je leert:

- wat een talstelsel is;
- hoe het decimale stelsel werkt;
- hoe het binaire stelsel werkt;
- hoe je binair naar decimaal omzet;
- waarom hexadecimaal handig is bij computers.

Aan het einde van dit hoofdstuk kun je een binair getal omzetten naar een decimaal getal en begrijpen waarom informatica vaak met verschillende talstelsels werkt.

---

## Wat is een talstelsel?

Een **talstelsel** is een manier om getallen te schrijven.

Wij gebruiken meestal het **decimale stelsel**.

Dat heeft 10 cijfers:

```text
0, 1, 2, 3, 4, 5, 6, 7, 8, 9
```

Het woord decimaal komt van "tien".

Het getal 345 betekent:

```text
3 x 100 + 4 x 10 + 5 x 1
```

Dus iedere plek heeft een andere waarde.

---

## Decimaal: basis 10

In het decimale stelsel is de basis 10.

Dus bij elk cijfer geldt:

```text
... 10^2 10^1 10^0
```

Bijvoorbeeld het getal 237:

```text
2 x 100 + 3 x 10 + 7 x 1 = 237
```

De plaats van een cijfer bepaalt de waarde.

---

## Binair: basis 2

In het binaire stelsel heeft een computer maar twee cijfers:

```text
0 en 1
```

Dus is de basis 2.

Bij elke plaats hoort een macht van 2:

```text
... 2^5 2^4 2^3 2^2 2^1 2^0
```

Voorbeeld:

```text
1011 binair
= 1 x 8 + 0 x 4 + 1 x 2 + 1 x 1
= 8 + 2 + 1
= 11
```

Dus:

```text
1011₂ = 11₁₀
```

Het kleine 2 en 10 geven aan in welk stelsel je werkt.

---

## Van binair naar decimaal

Neem het binaire getal:

```text
1101
```

Bereken eerst de waarden per plaats:

```text
1 x 8 = 8
1 x 4 = 4
0 x 2 = 0
1 x 1 = 1
```

Tel alles op:

```text
8 + 4 + 0 + 1 = 13
```

Dus:

```text
1101₂ = 13₁₀
```

---

## Van decimaal naar binair

Neem het decimale getal 13.

We delen steeds door 2 en schrijven de rest op:

```text
13 : 2 = 6 rest 1
6  : 2 = 3 rest 0
3  : 2 = 1 rest 1
1  : 2 = 0 rest 1
```

Van onder naar boven lees je:

```text
1101
```

Dus:

```text
13₁₀ = 1101₂
```

---

## Hexadecimaal: basis 16

Het hexadecimale stelsel gebruikt 16 symbolen:

```text
0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F
```

Het is handig omdat 16 = 2^4.

Een binair getal van 4 bits kan gemakkelijk als één hexadecimaal teken worden geschreven.

Voorbeeld:

```text
1010₂ = A₁₆
1111₂ = F₁₆
```

Computers gebruiken hexadecimaal vaak bij kleuren, adressen en geheugen.

---

## Waarom zijn verschillende talstelsels handig?

Voor mensen is decimaal natuurlijk.

Voor computers is binair logisch.

Voor programmeurs en hardware-ontwerpers is hexadecimaal handig omdat het korter is.

Bijvoorbeeld:

```text
binair: 1011010111101100
hex:    B5EC
```

Die hex-code is veel overzichtelijker.

---

## Samenvatting

- Het decimale stelsel werkt met basis 10.
- Het binaire stelsel werkt met basis 2.
- Een computer gebruikt bits: 0 en 1.
- Hexadecimaal werkt met basis 16 en is compact.
- Talstelsels helpen ons om informatie op een juiste manier te interpreteren.

## Check je begrip

1. Wat is het verschil tussen decimaal en binair?
2. Hoe zet je het binaire getal 1010 om naar decimaal?
3. Waarom is hexadecimaal handig voor computers?
4. Wat betekent het getal 2^4?

## Afbeeldingen en bronnen

- Zelf maken: maak een tabel met decimale, binaire en hexadecimale waarden van 0 tot 15.
- Online zoeken: [Talstelsels uitleg](https://www.youtube.com/results?search_query=talstelsels+binair+hexadecimaal)
- Online zoeken: [Wikipedia: binair talstelsel](https://nl.wikipedia.org/wiki/Binair_talstelsel)
- Online zoeken: [Wikipedia: hexadecimaal talstelsel](https://nl.wikipedia.org/wiki/Hexadecimaal_talstelsel)

# Opdrachten

**Kernroute (verplicht):** opdracht 1 en 2. **Plusroute:** opdracht 3.

1. Decimaal en binair

   a. Zet het decimale getal 13 om naar binair.
   b. Zet het binaire getal `1011` om naar decimaal.
   c. Leg uit waarom je bij het omrekenen van binair naar decimaal steeds met machten van 2 werkt.

2. Hexadecimaal

   a. Schrijf de waarden van 0 tot 15 op in het hexadecimale stelsel.
   b. Welke hexadecimale code hoort bij het binaire getal `1010`?
   c. Waarom is hexadecimaal handiger dan binair voor mensen?

3. Toepassingsvraag

   In een game worden kleuren vaak in hexadecimale codes opgeslagen.

   a. Waarom is een kleurcode in hexadecimaal korter dan dezelfde kleur in binair?
   b. Hoe zou jij een kleur als `#FF0000` uitleggen aan een klasgenoot?
   c. Noem een situatie waarin een computer liever werkt met hexadecimaal dan met decimaal.

### Inzichtsvragen

1. Wat is het verschil tussen basis 10 en basis 2?
2. Waarom kun je een binair getal ook als een reeks van bits zien?
3. Waarom is het logisch dat computers vaak in hexadecimaal werken?
