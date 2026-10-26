# Hoofdstuk 3: Relaties en JOINs

## Weekdoel

Aan het eind van deze week kun je:

- uitleggen wat relaties en foreign keys zijn;
- `INNER JOIN` en `LEFT JOIN` gebruiken;
- data uit meerdere tabellen combineren.

---

## 1. Waarom relaties?

Gegevens staan in meerdere tabellen. Bijvoorbeeld:

- `gebruikers`
- `profielen`
- `abonnementen`

Een profiel verwijst via `gebruiker_id` naar een gebruiker. Zo koppel je tabellen aan elkaar.

---

## 2. INNER JOIN

```sql
SELECT u.voornaam, a.type
FROM gebruikers u
INNER JOIN abonnementen a ON u.id = a.gebruiker_id;
```

Toont alleen records die in beide tabellen een match hebben.

---

## 3. LEFT JOIN

```sql
SELECT u.voornaam, a.type
FROM gebruikers u
LEFT JOIN abonnementen a ON u.id = a.gebruiker_id;
```

Toont alle gebruikers, ook als ze geen abonnement hebben.

---

## 4. Oefeningen

1. Toon `profielnaam` met bijbehorende `voornaam`.
2. Toon series met hun genre.
3. Toon afleveringen met serietitel.
4. Toon alle gebruikers met abonnementstype (ook zonder abonnement).

---

## 5. Huiswerk

Schrijf 4 JOIN-queries:

- minimaal 2x `INNER JOIN`
- minimaal 1x `LEFT JOIN`
- minimaal 1 query met 3 tabellen
