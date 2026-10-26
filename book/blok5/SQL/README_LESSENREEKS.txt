================================================================================
  SAMENVATTING: SQL LESSENREEKS VOOR 5HAVO/VWO
================================================================================

DATUM AANMAAK: 26 oktober 2026
LEERLINGEN: 15 (HAVO + VWO gemengd)
DUUR: 8 weken (3 SQL + 2 PHP + 3 Webshop)
EINDPRODUCT: Persoonlijke webshop met SELECT, UPDATE, DELETE

================================================================================
✅ WAT IS KLAARGEMAAKT
================================================================================

1. VERBETERDE DATABASE
   ━━━━━━━━━━━━━━━━━━━
   Bestand: nimmastream_2627_IMPROVED.sql
   - Beoordelingen verplaatst van SERIES naar AFLEVERINGEN ✓
   - Meer leeftijdsvariatie (11-52 jaar) ✓
   - Profielen ZONDER beoordelingen (voor subquery oefeningen) ✓
   - Clean data structure voor learning ✓
   - 25 series, 23 afleveringen, 25 gebruikers, 10 profielen

2. BULK SETUP SCRIPT (15 LEERLINGEN)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   Bestand: BULK_SETUP_15_LEERLINGEN.sql
   - Aanmaken: leerling_001 ... leerling_015 ✓
   - Databases: webshop_001 ... webshop_015 ✓
   - Privileges correct ingesteld ✓
   - Klaar om direct in phpMyAdmin uit te voeren ✓
   - Usernames + wachtwoorden gedocumenteerd

3. GEDETAILLEERDE 8-WEEKSE LESPLAN
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   Bestand: LESPLAN_8_WEKEN_COMPLEET.txt
   
   WEEK 1 (5 lessen): SELECT, WHERE, ORDER BY
   - 1.1: Introductie + SELECT basics
   - 1.2: WHERE & Filtering
   - 1.3: ORDER BY & Sortering
   - 1.4: Combinatie + Practicum
   - 1.5: Samenvatting & Toetsing
   
   WEEK 2 (5 lessen): JOINs & Relaties
   - 2.1: Relaties & Foreign Keys concept
   - 2.2: INNER JOIN syntax & oefeningen
   - 2.3: LEFT JOIN & Outer Joins
   - 2.4: Complexe JOINs practicum
   - 2.5: Samenvatting + Test
   
   WEEK 3 (5 lessen): UPDATE, DELETE, Subqueries, GROUP BY
   - 3.1: UPDATE - Gegevens aanpassen
   - 3.2: DELETE - Voorzichtig verwijderen
   - 3.3: Subqueries & IN operator
   - 3.4: GROUP BY & Aggregatie
   - 3.5: Samenvatting + Mini-project
   
   WEEK 4 (5 lessen): PHP + MySQL (SELECT via web)
   - 4.1: PHP Setup & Database Verbinding
   - 4.2: SELECT resultaten in HTML
   - 4.3: Formulieren & User Input
   - 4.4: JOIN in PHP + SQL Injection intro
   - 4.5: Evaluatie & Voorbereiding UPDATE
   
   WEEK 5 (5 lessen): PHP + UPDATE/DELETE
   - 5.1: Formulieren naar UPDATE
   - 5.2: DELETE met Voorzichtigheid
   - 5.3: Validatie & Input Security
   - 5.4-5.5: Voorbereiding Webshop
   
   WEEK 6-8: WEBSHOP PROJECT
   - HAVO: 3 tabellen (users, artikelen, bestellingen) + CRUD
   - VWO: + Admin panel, rollen, SQL injection voorkoming
   - Finale: Presentaties

4. WEEK 1 OEFENINGEN MET ANTWOORDEN
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   Bestand: WEEK_1_OEFENINGEN_EN_ANTWOORDEN.md
   - 15+ oefeningen met complete antwoorden
   - SELECT basics tot en met Challenge vragen
   - Huiswerkopdrachten
   - Tips & tricks voor leerlingen
   - Antwoordcontrole checklist

================================================================================
📋 BESTANDEN IN HET SQL MAPJE
================================================================================

C:\Users\JoostvanTiel\OneDrive - voCampus\_Lesmateriaal\Informatica\5HA inf\SQL\

NIEUWE BESTANDEN:
  ✓ nimmastream_2627_IMPROVED.sql           (15.8 KB) - Verbeterde database
  ✓ BULK_SETUP_15_LEERLINGEN.sql            (5.7 KB) - 15 users + databases
  ✓ LESPLAN_8_WEKEN_COMPLEET.txt            (18.3 KB) - Gedetailleerde planning
  ✓ WEEK_1_OEFENINGEN_EN_ANTWOORDEN.md      (7.5 KB) - Oefeningen Week 1

BESTAANDE BESTANDEN:
  - nimmastream_2627.sql (origineel - BACK UP in veiligheid houden!)
  - SQL Les 1.docx
  - SQL Les 3.docx
  - SQL Les 3 Lesplan.docx
  - SQL Les 3 werkvormen.docx
  - SQL Les 4.docx
  - SQL Les 4 werkvormen.docx
  - leerlingedatabases.py (negeren per aanvraag)

================================================================================
🎯 IMPLEMENTATIE CHECKLIST
================================================================================

VOORBEREIDING (voor je les begint):

[ ] 1. DATABASE SETUP
    [ ] Download nimmastream_2627_IMPROVED.sql
    [ ] Import in phpMyAdmin (je eigen testdatabase)
    [ ] Verifieer: tabellen, data, relaties zijn OK
    [ ] Test enkele SELECT queries zelf

[ ] 2. LEERLINGEN SETUP
    [ ] Voer BULK_SETUP_15_LEERLINGEN.sql uit (als ROOT/admin)
    [ ] Verifieer: 15 users en 15 databases aangemaakt
    [ ] Test: Log in als leerling_001 → kan webshop_001 zien?
    [ ] Maak cheatsheet met usernames/wachtwoorden

[ ] 3. LESMATERIAAL VOORBEREIDING
    [ ] Print/digitaal: LESPLAN_8_WEKEN_COMPLEET.txt
    [ ] Print/digitaal: WEEK_1_OEFENINGEN_EN_ANTWOORDEN.md
    [ ] Maak PowerPoint slides voor Week 1 (voorgesteld: 10-15 slides)
    [ ] Zet oefeningen klaar in online classroom (bijv. Teams, Google Classroom)

[ ] 4. HARDWARE/SOFTWARE CHECK
    [ ] phpMyAdmin werkend op j:informatica.ssgn.nl
    [ ] PHP werkend voor volgende weken
    [ ] Leerling laptops hebben tekstneditor (VS Code, Notepad++)
    [ ] Database backup op veilige plaats

WEEK 1 VOORBEREIDING:
[ ] Maak kopie van nimmastream_2627_IMPROVED.sql zodat leerlingen deze kunnen import
[ ] Zorg voor demo-database waar je zelf queries test
[ ] Bereid 1.1 presentatie voor (5 slides: wat is SQL, waarom, phpMyAdmin tour)
[ ] Zorg voor demo-code: "live coding" voorbeelden

================================================================================
🚀 VOLGENDE STAPPEN VOOR JOU
================================================================================

NU METEEN DOEN:
1. Test nimmastream_2627_IMPROVED.sql zelf in phpMyAdmin
   → Check of alle tabellen correct zijn
   → Controleer data integriteit (FK constraints)
   → Run enkele SELECT queries ter verificatie

2. Test BULK_SETUP_15_LEERLINGEN.sql als admin
   → Zorg dat alle 15 users + databases gemaakt zijn
   → Verifieer dat leerling_001 kan inloggen in webshop_001

3. Lees LESPLAN_8_WEKEN_COMPLEET.txt door
   → Aanpassingen maken waar nodig voor jouw situatie
   → Bepaal precieze data/uren voor elke les
   → Integreer in schoolkalender

WEEK 1 VOORBEREIDING:
4. Maak PowerPoint presentatie Week 1
   → 5-10 slides per les
   → Screenshots phpMyAdmin
   → Voorbeelden + oefeningen inline

5. Bereid live demo voor
   → Zelf alle queries van Week 1 testen
   → Weet precies wat je laat zien
   → Heb backupcodes klaar als iets fout gaat

6. Zet oefeningen online
   → Klassikale werkgroep tool
   → Duidelijke instructies
   → Antwoordmodellen verborgen tot na les

OPTIONEEL - VERDERE UITBREIDING:
7. Maak Week 2 oefeningen (JOINs)
   → Pattern van Week 1 volgen
   → 15+ oefeningen met antwoorden

8. Maak Week 3 oefeningen (UPDATE, DELETE, GROUP BY)
   → Voorzichtigheid benadrukken
   → Veiligheid oefenen

9. Maak Week 4-5 PHP voorbeelden
   → PHP snippets met comentaar
   → Werkende voorbeeldscripts
   → Fouten intentioneel toevoegen ("find the bug")

================================================================================
💡 TIPS VOOR SUCCES
================================================================================

DIDACTISCH:
- START SIMPEL: Week 1 is essentieel! Niet opschieten.
- HERHALING: Elke les begint met korte recap vorige week
- VARIATIE: Mix uitleg, demo, zelfstandig werk, en paren/groepwerk
- FEEDBACK: Directe controle queries (verde = good, rood = problem)
- MOTIVATIE: Laat zien wat ze gaan BOUWEN (webshop!) = concreet

TECHNISCH:
- BACKUPS: Voor je ELKE les begint, backup de nimmastream database
- ANTWOORDEN: Zelf alle queries testen voordat je ze aan leerlingen geeft
- FOUTENMELDINGEN: Enkele SQL errors opzettelijk in oefening werken goed
- PHPMYADMIN: Laat zien hoe je er queries debug
- TERMINAL: MySQLi commando tool tonen als aanvulling

VOOR HAVO vs VWO DIFFERENTIATIE:
- HAVO: Focus op "het werkt" + basis concepts
- VWO: Extra "waarom is dit zo?" + security thinking
- CHALLENGES: VWO krijgt moeilijkere optionele oefeningen
- WEBSHOP: VWO doet admin panel + security features

================================================================================
📞 HULPNODIG?
================================================================================

PROBLEMEN MET DATABASE:
- Error: "Foreign key constraint fails"
  → Check of alle parent records bestaan
  → Zorg CASCADE delete ingesteld

- Leerling ziet geen data
  → Check privileges (BULK_SETUP script)
  → Verifieer tabel names correct geclassificeerd

PHP PROBLEMEN (Week 4+):
- "Call to undefined function mysqli_connect"
  → PHP MySQLi extension niet geïnstalleerd
  → Server admin contacteren

TIMING PROBLEMEN:
- Te veel stof per week
  → Reduceer oefeningen, focus op TOP 3-5
  → Huiswerk verplaatsen

================================================================================
🎓 LEERUITKOMSTEN VERWACHT (EIND WEEK 8)
================================================================================

LEERLINGEN KUNNEN:

SQL FASE:
✓ SELECT queries schrijven met WHERE, ORDER BY, LIMIT
✓ JOINs gebruiken (INNER, LEFT)
✓ UPDATE en DELETE voorzichtig toepassen
✓ GROUP BY + COUNT/SUM/AVG voor statistieken
✓ Subqueries in WHERE clauses gebruiken
✓ Database schema begrijpen en tekenen

PHP FASE:
✓ PHP-MySQL verbinding opzetten
✓ SELECT resultaten in HTML weergeven
✓ Formulieren voor user input verwerken
✓ UPDATE/DELETE via webformulier
✓ Basis input validation toepassen
✓ (VWO) Prepared statements gebruiken tegen SQL injection

WEBSHOP FASE:
✓ Eigen webshop ontwerpen en realiseren
✓ 3 tabellen (users, items, orders) linken
✓ CRUD compleet werkend
✓ Eenvoudige UI/UX
✓ (VWO) Admin panel + user rollen
✓ (VWO) Security-aware coderen

================================================================================

Veel sterkte met de lessen! 🎯

Dit lesplan is flexibel - pas aan waar nodig voor jouw klas.

Joost van Tiel - Informatica 5HA/VWO
Gegenereerd: 26 oktober 2026

================================================================================
