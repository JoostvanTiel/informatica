# Hoofdstuk 6: PHP + MySQL - UPDATE en DELETE via formulieren

## Weekdoel

Aan het eind van deze week kun je:

- records bijwerken via een formulier;
- records verwijderen met bevestiging;
- basisvalidatie toepassen;
- veiliger werken met prepared statements.

---

## 1. UPDATE via PHP

```php
$sql = "UPDATE profielen SET leeftijd_profiel = ? WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ii", $leeftijd, $id);
$stmt->execute();
```

---

## 2. DELETE met bevestiging

Voeg altijd een bevestiging toe voordat je verwijdert, zowel in de interface als in je servercode.

---

## 3. Validatie

Controleer altijd:

- leeg veld;
- datatype;
- ongeldige waarden;
- veiligheid van invoer.

---

## 4. Huiswerk

Maak een CRUD-pagina voor één tabel (bijv. `profielen`) met:

- overzicht;
- bewerken;
- verwijderen met bevestiging.
