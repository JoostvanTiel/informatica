# Hoofdstuk 5: PHP + MySQL - gegevens tonen

## Weekdoel

Aan het eind van deze week kun je:

- verbinding maken met MySQL vanuit PHP;
- `SELECT`-resultaten tonen in HTML;
- filteren via formulieren.

---

## 1. Verbinding maken

```php
<?php
$conn = new mysqli("localhost", "root", "", "nimmastream_2627");
if ($conn->connect_error) {
    die("Verbinding mislukt: " . $conn->connect_error);
}
```

---

## 2. Data tonen

```php
$result = $conn->query("SELECT voornaam, leeftijd FROM gebruikers");
while ($row = $result->fetch_assoc()) {
    echo "<p>" . $row["voornaam"] . " (" . $row["leeftijd"] . ")</p>";
}
```

---

## 3. Filter via formulier

Gebruik een formulier met bijvoorbeeld regio of leeftijd als filter en toon de resultaten op dezelfde pagina.

---

## 4. Huiswerk

Maak een pagina die:

1. alle gebruikers toont;
2. kan filteren op regio;
3. nette HTML-output gebruikt.
