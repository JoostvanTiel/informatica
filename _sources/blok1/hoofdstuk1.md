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

![Afbeelding niet gevonden][img/toestandsdiagram1.png]
