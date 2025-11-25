# Liste des erreurs dans le code

## 1. Variables inutilisées
- `DEBUG_MODE`, `UNUSED_VAR`, `secret`, `API_KEY`, `very_long_variable_name_that_exceeds_line_length` ne sont jamais utilisées.

## 2. Routes avec slash final
- Les routes `/items/` provoquent des redirections `307` si le slash est oublié.

## 3. Typage incohérent
- Certains paramètres n’ont pas de type explicite (ex. `item_id` dans `get_item`).

## 4. Fonctions/commentaires inutilisés
- `_old_helper_function` n’est jamais utilisée.

## 5. Docker / environnement
- `DATABASE_URL` non défini si `.env` n’est pas chargé.
- `docker-compose.yml` contenait `version` et `env_file` qui ne sont plus utilisés ou valides pour Compose V2.

## 6. Importations superflues
- `import datetime`, `import json`, `from typing import Dict, Any` dans `main.py` ne sont pas utilisés.

## 7. Longue ligne non formatée
- `very_long_variable_name_that_exceeds_line_length` viole les règles PEP8.


# Linting Issues

## 1. Imports not at the top (E402)
- **File:** `app/database.py`
- **Lines:** 4-5
- **Description:** Imports should be at the top of the file.

## 2. Unused imports (F401)
- **File:** `app/main.py`
  - `os` (line 2)
  - `sys` (line 3)
  - `json` (line 6)
  - `Dict` (line 7)
  - `Any` (line 7)
- **File:** `app/models/item.py`
  - `Optional` (line 2)
- **File:** `app/schemas/item.py`
  - `Optional` (line 2)
- **Description:** These imports are not used and can be removed.

## Summary
- Total issues: 9
- Fixable automatically with `ruff --fix`: 7

# Résumé des erreurs Ruff

## 1. Imports non utilisés (F401)
- `os` dans `app/main.py` → supprimer
- `sys` dans `app/main.py` → supprimer
- `json` dans `app/main.py` → supprimer
- `typing.Dict` dans `app/main.py` → supprimer
- `typing.Any` dans `app/main.py` → supprimer
- `typing.Optional` dans `app/models/item.py` → supprimer si non utilisé
- `typing.Optional` dans `app/schemas/item.py` → supprimer si non utilisé

## 2. Import en dehors du top-level (E402)
- `load_dotenv()` dans `app/database.py` → doit être après tous les imports
- `import os` dans `app/database.py` → déplacer au début du fichier (top-level)

## 3. Fix recommandés
- 7 des 9 erreurs sont **fixables automatiquement** avec Ruff :

```bash
docker compose exec api uv run ruff check . --fix

E402 Module level import not at top of file
 --> app/database.py:4:1
  |
2 | load_dotenv()
3 |
4 | import os
  | ^^^^^^^^^
5 | from sqlmodel import create_engine, Session
  |

E402 Module level import not at top of file
 --> app/database.py:5:1
  |
4 | import os
5 | from sqlmodel import create_engine, Session
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
6 |
7 | DATABASE_URL = os.getenv("DATABASE_URL")
  |

Found 9 errors (7 fixed, 2 remaining).