# Informatica

Repo voor de Jupyter Books voor informatica van de SSgN.

## Structuur

```
book/               # Jupyter Book bronbestanden
  _config.yml       # Boek-configuratie
  _toc.yml          # Inhoudsopgave
  intro.md          # Startpagina
  hoofdstuk1/       # Hoofdstukken (pas aan naar eigen inhoud)
  hoofdstuk2/
requirements.txt    # Python-afhankelijkheden
.github/workflows/  # GitHub Actions workflow
```

## Branches

| Branch    | Doel                                               |
|-----------|----------------------------------------------------|
| `develop` | Werken aan nieuwe inhoud (wordt niet gepubliceerd) |
| `live`    | Gepubliceerde versie – auto-deploy naar GitHub Pages |

## Lokaal bouwen

```bash
pip install -r requirements.txt
jupyter-book build book/
# Open book/_build/html/index.html in je browser
```

## Publiceren

Push naar de `live`-branch om automatisch te deployen via GitHub Actions naar GitHub Pages.

> **Opmerking:** Zorg dat GitHub Pages is ingesteld op de `gh-pages`-branch in de repository-instellingen (Settings → Pages → Source: `gh-pages`).
