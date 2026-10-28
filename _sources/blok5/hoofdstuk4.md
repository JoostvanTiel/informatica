# Hoofdstuk 4: UPDATE, DELETE, subqueries en GROUP BY

## Leerdoelen

In dit hoofdstuk ga je van "data lezen" naar "data beheren".

Je leert:

- veilig gegevens wijzigen met `UPDATE`;
- veilig gegevens verwijderen met `DELETE`;
- vragen in vragen gebruiken met subqueries;
- overzichten maken met `GROUP BY` en aggregatiefuncties.

Aan het einde van dit hoofdstuk kun je gerichte wijzigingen doen zonder je database per ongeluk kapot te maken.

---

Let op: voer deze opdrachten alleen uit in jouw database:

`nimmastream_<gebruikersnaam>`

---

## 1. Veilig werken: eerst SELECT, dan pas wijzigen

Bij `UPDATE` en `DELETE` verander je data blijvend. Daarom geldt deze regel:

1. schrijf eerst een `SELECT` met dezelfde `WHERE`;
2. controleer of dit precies de rijen zijn die je bedoelt;
3. voer pas daarna `UPDATE` of `DELETE` uit.

Deze stap is cruciaal. Een database is geen papierboekje: je verwijdert of wijzigt echt data, en dat kun je niet zomaar terughalen als je per ongeluk te veel records raakt.

### Denk als een veiligheidsofficier

Voordat je een wijziging doorvoert, stel je jezelf de volgende vragen:

- Welke records passen bij mijn opdracht?
- Zijn er misschien meer records dan ik verwacht?
- Is de `WHERE`-voorwaarde precies goed?
- Als dit fout gaat, wat is dan het risico?

Bij SQL is het vaak beter om één keer extra te controleren dan één keer een opdracht terug te draaien.

---

## 2. UPDATE

```sql
UPDATE profielen
SET leeftijd_profiel = 15
WHERE id = 1;
```

Zonder `WHERE` verander je **alle** rijen. Dat is de meest voorkomende fout bij beginners.

### Goed voorbeeld van een veilige workflow

```sql
SELECT *
FROM profielen
WHERE id = 1;
```

Als je ziet dat deze rij klopt, dan pas je de wijziging aan:

```sql
UPDATE profielen
SET leeftijd_profiel = 15
WHERE id = 1;
```

Na afloop controleer je opnieuw met `SELECT`.

---

## 3. DELETE

```sql
DELETE FROM kijkgeschiedenis
WHERE profiel_id = 10;
```

Ook hier: zonder `WHERE` verwijder je alles uit de tabel.

### Waarom is DELETE riskant?

Verwijderen is vaak moeilijker te herstellen dan aanpassen. Daarom moet je altijd eerst controleren welke rijen je precies verwijdert. De `WHERE` is niet zomaar een extra toevoeging: het is de beveiliging tegen onbedoelde dataverlies.

---

## 4. Subqueries

Een subquery is een query binnen een query. Je gebruikt het wanneer je eerst een tussenresultaat wilt bepalen, en daarna pas een hoofdquery uitvoert.

```sql
SELECT *
FROM gebruikers
WHERE id IN (
  SELECT gebruiker_id
  FROM profielen
);
```

### Wat gebeurt hier?

1. De subquery zoekt alle `gebruiker_id`-waarden uit `profielen`.
2. De hoofdquery kiest alle gebruikers waarvan de `id` in die lijst voorkomt.

Subqueries helpen dus bij complexere vragen, bijvoorbeeld:

- gebruikers die een profiel hebben;
- producten die nog in voorraad zijn;
- series waarvan een aflevering is bekeken.

---

## 5. GROUP BY en aggregatie

Met `GROUP BY` maak je samenvattingen. In plaats van alle rijen apart te zien, groepeer je ze op basis van een eigenschap.

```sql
SELECT regio, COUNT(*) AS aantal_gebruikers
FROM gebruikers
GROUP BY regio;
```

Dit geeft per regio het aantal gebruikers.

### Gemiddelde beoordeling

```sql
SELECT aflevering_id, AVG(beoordeling) AS gemiddelde
FROM beoordelingen
GROUP BY aflevering_id;
```

Je krijgt nu per aflevering het gemiddelde van de beoordelingen.

### Handige functies

- `COUNT()` telt het aantal resultaten
- `AVG()` berekent het gemiddelde van de resultaten
- `MIN()` geeft de laagste waarde van de resultaten
- `MAX()` geeft de hoogste waarde van de resultaten
- `SUM()` geeft de optelsom van alle resultaten

### Wanneer gebruik je `GROUP BY`?

Als je niet wilt weten wat elk individueel record doet, maar geïnteresseerd bent in een samenvatting. Denk aan vragen als:

- hoeveel gebruikers wonen in elke regio?
- wat is de gemiddelde score per aflevering?
- hoeveel producten zijn er per categorie?

Dat is precies het moment waarop groeperen zinvol wordt.

---

## Opdrachten

Voer alle opdrachten uit in jouw database: `nimmastream_<gebruikersnaam>`.

### Opdracht 1 - Veilige UPDATE

1. Pas de leeftijd van één profiel aan.
2. Laat eerst met `SELECT` zien welke rij je aanpast.
3. Controleer na afloop opnieuw met `SELECT`.

### Opdracht 2 - Veilige DELETE

1. Verwijder kijkgeschiedenis van één profiel.
2. Controleer vooraf en achteraf met `SELECT`.
3. Leg uit waarom dit veilig is uitgevoerd.

### Opdracht 3 - Subqueries

1. Zoek gebruikers die minstens één profiel hebben.
2. Zoek profielen zonder beoordelingen.
3. Zoek series waarvan minstens één aflevering beoordeeld is.

### Opdracht 4 - Statistiek

1. Tel gebruikers per regio.
2. Tel profielen per gebruiker.
3. Bereken gemiddelde beoordeling per aflevering.
4. Toon top 3 meest beoordeelde afleveringen.

### Opdracht 5 - Challenge

Schrijf één foutgevoelige query opzettelijk verkeerd (bijv. zonder `WHERE`) en leg uit wat het risico is.

---

## Check je begrip

1. Waarom is `WHERE` bij `UPDATE` en `DELETE` cruciaal?
2. Wanneer gebruik je een subquery?
3. Wat is het verschil tussen detaildata en gegroepeerde data?
4. Hoe controleer je of een statistiekquery logisch is?

---

## Samenvatting

- `UPDATE` wijzigt data.
- `DELETE` verwijdert data.
- Subqueries helpen bij complexere voorwaarden.
- Met `GROUP BY` maak je overzicht en statistiek.

## Huiswerk

1. Maak 2 veilige `UPDATE`-queries.
2. Maak 1 veilige `DELETE`-query.
3. Maak 3 `GROUP BY`-queries met uitleg van je uitkomst.
