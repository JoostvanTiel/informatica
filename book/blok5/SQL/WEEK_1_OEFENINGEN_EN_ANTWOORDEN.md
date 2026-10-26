# WEEK 1: SELECT, WHERE, ORDER BY
## SQL Basis Oefeningen

---

## LES 1.1: SELECT Basis

### Oefening 1.1.1 - SELECT alle gebruikers
**Vraag:** Schrijf een query om alle gebruikers op te halen

```sql
SELECT * FROM gebruikers;
```

**Verwachte output:** 25 rijen met alle gebruikersinformatie

---

### Oefening 1.1.2 - SELECT specifieke kolommen
**Vraag:** Haal voornaam EN achternaam van alle gebruikers op

```sql
SELECT voornaam, achternaam FROM gebruikers;
```

**Verwachte output:** 25 rijen met alleen voornaam en achternaam

---

### Oefening 1.1.3 - SELECT één gebruiker
**Vraag:** Haal de gegevens van gebruiker met id=1 op

```sql
SELECT * FROM gebruikers WHERE id = 1;
```

**Verwachte output:** Emma (voornaam) NULL (tussenvoegsel) Jansen (achternaam) 14 (leeftijd) NH (regio)

---

## LES 1.2: WHERE & Filtering

### Oefening 1.2.1 - Ouder dan 18
**Vraag:** Vind alle gebruikers die OUDER dan 18 jaar zijn

```sql
SELECT voornaam, leeftijd FROM gebruikers WHERE leeftijd > 18;
```

**Verwachte output:** Lukas (25), Finn (35), Oscar (45), Liam (28), Noah (52), Elijah (31), Mason (42), Amelia (26), Benjamin (38), Alexander (22), Evelyn (48), Michael (29), James (17), Elizabeth (51)

**Aantal:** 14 gebruikers

---

### Oefening 1.2.2 - Uit regio NH EN jonger dan 20
**Vraag:** Welke gebruikers zijn uit NH en jonger dan 20 jaar?

```sql
SELECT voornaam, leeftijd, regio FROM gebruikers 
WHERE regio = 'NH' AND leeftijd < 20;
```

**Verwachte output:** Emma (14, NH), Mason (42, NH) - WACHT, Mason is 42, niet < 20

**Correctie - check data:**
- Emma: 14, NH ✓
- Mason: 42, NH (niet < 20)

**Antwoord:** Alleen Emma

---

### Oefening 1.2.3 - Series met kijkwijzer 12
**Vraag:** Welke series hebben kijkwijzer "12"?

```sql
SELECT titel, kijkwijzer FROM series WHERE kijkwijzer = '12';
```

**Verwachte output:**
- Stranger Things (12)
- The Umbrella Academy (12)
- Shadow and Bone (12)
- Chilling Adventures of Sabrina (12)
- Heartstopper (9) - NOPE
- Never Have I Ever (12) ✓
- The Summer I Turned Pretty (12) ✓
- Gossip Girl (16) - NOPE
- Sex Education (12) ✓
- Riverdale (16) - NOPE
- Pretty Little Liars (16) - NOPE
- You (16) - NOPE
- All American (12) ✓
- On My Block (12) ✓
- Skins (16) - NOPE
- The O.C. (12) ✓
- One Tree Hill (12) ✓
- iCarly (9) - NOPE
- Victorious (9) - NOPE
- Wednesday (12) ✓
- The Vampire Diaries (16) - NOPE
- Dawson's Creek (12) ✓

**Aantal:** 11 series

---

### Oefening 1.2.4 - Namen die met A beginnen
**Vraag:** Vind gebruikers waarvan voornaam MET 'A' BEGINT

```sql
SELECT voornaam FROM gebruikers WHERE voornaam LIKE 'A%';
```

**Verwachte output:** 
- Anna
- Ava
- Amelia
- Abigail
- Alexander

**Aantal:** 5 gebruikers

---

## LES 1.3: ORDER BY

### Oefening 1.3.1 - Top 5 oudste gebruikers
**Vraag:** Geef de 5 oudste gebruikers

```sql
SELECT voornaam, leeftijd FROM gebruikers 
ORDER BY leeftijd DESC 
LIMIT 5;
```

**Verwachte output:**
1. Elizabeth (51)
2. Noah (52)
3. Evelyn (48)
4. Oscar (45)
5. Mason (42)

---

### Oefening 1.3.2 - Series alfabetisch (A-Z)
**Vraag:** Geef alle series in alfabetische volgorde

```sql
SELECT titel FROM series ORDER BY titel ASC;
```

**Verwachte output:**
1. All American
2. Chilling Adventures of Sabrina
3. Dawson's Creek
4. Elite
5. Gossip Girl
6. Heartstopper
7. Never Have I Ever
8. On My Block
9. One Tree Hill
10. Outer Banks
11. Pretty Little Liars
12. Riverdale
13. Sex Education
14. Shadow and Bone
15. Skins
16. Stranger Things
17. The O.C.
18. The Summer I Turned Pretty
19. The Umbrella Academy
20. The Vampire Diaries
21. The Witcher
22. Wednesday
23. You
24. iCarly
25. Victorious

**Aantal:** 25 series

---

### Oefening 1.3.3 - Gebruikers per regio, alfabetisch
**Vraag:** Toon gebruikers gegroepeerd per regio, alphabetisch op voornaam

```sql
SELECT regio, voornaam, leeftijd FROM gebruikers 
ORDER BY regio ASC, voornaam ASC;
```

**Verwachte output (sample):**
BE: Benjamin (15), Elijah (31), Harper (38), ...
DE: James (17), Michael (29), ...
etc.

---

### Oefening 1.3.4 - 10 jongste gebruikers
**Vraag:** Wie zijn de 10 jongste gebruikers?

```sql
SELECT voornaam, leeftijd FROM gebruikers 
ORDER BY leeftijd ASC 
LIMIT 10;
```

**Verwachte output:**
1. Anna (12)
2. Mia (11)
3. Emma (14)
4. Olivia (13)
5. Benjamin (15)
6. Isabella (16)
7. James (17)
8. Ava (18)
9. Alexander (22)
10. Amelia (26)

---

## LES 1.4: Combinatie & Praktijk

### Oefening 1.4.1 - Profielen van user 1, alfabetisch
**Vraag:** Welke profielen hoort bij gebruiker 1, alfabetisch geordend?

```sql
SELECT profielnaam FROM profielen 
WHERE gebruiker_id = 1 
ORDER BY profielnaam ASC;
```

**Verwachte output:**
- Emma
- Ouder

---

### Oefening 1.4.2 - Actieve abonnementen
**Vraag:** Geef alle ACTIEVE abonnementen, gesorteerd op gebruiker_id

```sql
SELECT gebruiker_id, type, status FROM abonnementen 
WHERE status = 'actief' 
ORDER BY gebruiker_id ASC;
```

**Verwachte output:** 10 rijen (alle actieve abonnementen)

---

### Oefening 1.4.3 - Kijkgeschiedenis profiel 3
**Vraag:** Toon alle afleveringen die profiel 3 gekeken heeft

```sql
SELECT aflevering_id, kijk_moment FROM kijkgeschiedenis 
WHERE profiel_id = 3 
ORDER BY kijk_moment DESC;
```

**Verwachte output:**
- Aflevering 10 (2024-10-20 21:00)
- Aflevering 9 (2024-10-19 21:00)

---

### Oefening 1.4.4 - Afleveringen van serie 1
**Vraag:** Geef alle afleveringen van serie 1, gesorteerd op datum

```sql
SELECT titel, uitzend_datum FROM afleveringen 
WHERE serie_id = 1 
ORDER BY uitzend_datum ASC;
```

**Verwachte output:** 8 afleveringen van Stranger Things

---

## LES 1.5: CHALLENGE VRAGEN

### Challenge 1: Top 3 jongste premium users
**Vraag:** Vind de 3 jongste gebruikers met een PREMIUM abonnement

**Hint:** Je hebt 2 tabellen nodig!

```sql
-- ANTWOORD (Preview):
-- Je moet gebruikers JOIN-en met abonnementen
-- WHERE type = 'premium'
-- ORDER BY leeftijd ASC
-- LIMIT 3
```

*Antwoord komt in Week 2 (JOIN lessen)*

---

### Challenge 2: Users die met E beginnen, jonger dan 20
**Vraag:** Welke gebruikers beginnen hun voornaam met E en zijn jonger dan 20?

```sql
SELECT voornaam, leeftijd FROM gebruikers 
WHERE voornaam LIKE 'E%' AND leeftijd < 20;
```

**Verwachte output:**
- Emma (14)
- Elijah (NOPE, 31)

**Antwoord:** Alleen Emma

---

## HUISWERK WEEK 1

Schrijf 5 ZELF bedachte SELECT queries:
1. Je eigen WHERE vraag
2. Je eigen ORDER BY vraag
3. Combinatie van WHERE + ORDER BY
4. LIMIT vraag
5. Iets grappigs/interessants vinden in de data

---

## ANTWOORDCONTOLE CHECKLIST

- [ ] Alle SELECT queries werken zonder errors
- [ ] Je begrijpt WHERE operators (=, <>, <, >, AND, OR)
- [ ] Je begrijpt ORDER BY ASC/DESC
- [ ] Je weet wat LIMIT doet
- [ ] Je kan kolommen selecteren i.p.v. SELECT *

---

## TIPS VOOR LEERLINGEN

1. **Eerst SELECT, dan rest:** Test altijd je WHERE clausule met SELECT voordat je UPDATE/DELETE doet!
2. **Controleer je WHERE:** Wil je 1 rij of 100 rijen? Check eerst!
3. **Spellingsfouten:** Kolom- en tabelnamen zijn CASE SENSITIVE in bepaalde databases
4. **Comments:** Voeg `-- commentaar` toe zodat je later begrijpt wat je query doet
5. **Test in phpMyAdmin:** Test queries in phpMyAdmin voordat je ze in PHP zet

