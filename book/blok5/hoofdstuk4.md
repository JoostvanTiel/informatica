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

## Lesopbouw (45-60 minuten)

1. **Uitleg veiligheid bij wijzigingen (10 min)**
2. **Begeleide UPDATE/DELETE (15 min)**
3. **Subquery en GROUP BY oefenen (20-25 min)**
4. **Korte afsluitende check (5-10 min)**

---

## 1. Veilig werken: eerst SELECT, dan pas wijzigen

Bij `UPDATE` en `DELETE` verander je data blijvend.  
Daarom geldt deze regel:

1. schrijf eerst een `SELECT` met dezelfde `WHERE`;
2. controleer of dit precies de rijen zijn die je bedoelt;
3. voer pas daarna `UPDATE` of `DELETE` uit.

---

## 2. UPDATE

```sql
UPDATE profielen
SET leeftijd_profiel = 15
WHERE id = 1;
```

Zonder `WHERE` verander je **alle** rijen.  
Dat is de meest voorkomende fout bij beginners.

---

## 3. DELETE

```sql
DELETE FROM kijkgeschiedenis
WHERE profiel_id = 10;
```

Ook hier: zonder `WHERE` verwijder je alles uit de tabel.

---

## 4. Subqueries

Een subquery is een query binnen een query.

```sql
SELECT *
FROM gebruikers
WHERE id IN (
  SELECT gebruiker_id
  FROM profielen
);
```

Je gebruikt dit als je eerst een tussenresultaat nodig hebt.

---

## 5. GROUP BY en aggregatie

Met `GROUP BY` maak je samenvattingen.

```sql
SELECT regio, COUNT(*) AS aantal_gebruikers
FROM gebruikers
GROUP BY regio;
```

Gemiddelde beoordeling:

```sql
SELECT aflevering_id, AVG(beoordeling) AS gemiddelde
FROM beoordelingen
GROUP BY aflevering_id;
```

Handige functies:

- `COUNT()`
- `AVG()`
- `MIN()`
- `MAX()`
- `SUM()`

---

## Opdrachten

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

### Opdracht 5 - Didactische challenge

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
