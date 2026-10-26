# Hoofdstuk 2: SELECT, WHERE en ORDER BY

## Weekdoel

Aan het eind van deze week kun je:

- gegevens ophalen met `SELECT`;
- resultaten filteren met `WHERE`;
- resultaten sorteren met `ORDER BY`;
- het aantal resultaten beperken met `LIMIT`.

---

## 1. SELECT: gegevens ophalen

```sql
SELECT * FROM gebruikers;
```

`*` betekent: alle kolommen tonen.

Alleen specifieke kolommen:

```sql
SELECT voornaam, achternaam FROM gebruikers;
```

---

## 2. WHERE: filteren

Filteren op voorwaarde:

```sql
SELECT voornaam, leeftijd
FROM gebruikers
WHERE leeftijd > 18;
```

Combineren met `AND`:

```sql
SELECT voornaam, leeftijd, regio
FROM gebruikers
WHERE regio = 'NH' AND leeftijd < 20;
```

Filteren op beginletter:

```sql
SELECT voornaam
FROM gebruikers
WHERE voornaam LIKE 'A%';
```

---

## 3. ORDER BY: sorteren

```sql
SELECT titel
FROM series
ORDER BY titel ASC;
```

Top 5 oudste gebruikers:

```sql
SELECT voornaam, leeftijd
FROM gebruikers
ORDER BY leeftijd DESC
LIMIT 5;
```

---

## 4. Oefeningen

1. Toon alle gebruikers ouder dan 20.
2. Toon alle series met kijkwijzer `12`.
3. Toon de 10 jongste gebruikers.
4. Toon alle actieve abonnementen gesorteerd op `gebruiker_id`.

---

## 5. Huiswerk

Schrijf 5 eigen query's met minimaal:

- 1x `WHERE`
- 1x `ORDER BY`
- 1x `LIMIT`

Noteer per query wat je verwacht terug te krijgen.
