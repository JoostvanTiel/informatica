# Hoofdstuk 4: UPDATE, DELETE, subqueries en GROUP BY

## Weekdoel

Aan het eind van deze week kun je:

- gegevens wijzigen met `UPDATE`;
- gegevens verwijderen met `DELETE`;
- subqueries gebruiken;
- statistieken maken met `GROUP BY`.

---

## 1. UPDATE

```sql
UPDATE profielen
SET leeftijd_profiel = 15
WHERE id = 1;
```

Gebruik altijd `WHERE`, anders wijzig je alle records.

---

## 2. DELETE

```sql
DELETE FROM kijkgeschiedenis
WHERE profiel_id = 10;
```

Controleer eerst met een `SELECT` welke rijen je verwijdert.

---

## 3. Subqueries

```sql
SELECT *
FROM gebruikers
WHERE id IN (
  SELECT gebruiker_id
  FROM profielen
);
```

---

## 4. GROUP BY

```sql
SELECT regio, COUNT(*) AS aantal_gebruikers
FROM gebruikers
GROUP BY regio;
```

Gemiddelde beoordeling per aflevering:

```sql
SELECT aflevering_id, AVG(beoordeling) AS gemiddelde
FROM beoordelingen
GROUP BY aflevering_id;
```

---

## 5. Huiswerk

1. Maak 2 veilige `UPDATE`-queries.
2. Maak 1 `DELETE`-query op testdata.
3. Maak 2 statistiekqueries met `GROUP BY`.
