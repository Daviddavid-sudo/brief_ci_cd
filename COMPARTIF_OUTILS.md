Comparer les outils disponibles pour chaque catégorie et **justifier vos choix**.

## 🎨 Linters Python

| Outil  | Avantages                              | Inconvénients                                               | Note /10 | Choix ? |
| ------ | -------------------------------------- | ----------------------------------------------------------- | -------- | ------- |
| Ruff   | Ultra rapide, tout-en-un               | Moins de règles que Pylint                                  | 9/10     | ✅       |
| Flake8 | Simple, largement utilisé, extensible  | Plus lent que Ruff, nécessite plugins pour certaines règles | 7/10     | ✅       |
| Pylint | Très complet, vérifie style et erreurs | Lenteur, configuration complexe                             | 6/10     | ⚠️      |

**Justification** : Ruff est privilégié pour la vitesse et la simplicité, Flake8 reste pertinent pour des projets legacy, Pylint est réservé aux besoins très stricts de code.

---

## 🎨 Formatters Python

| Outil       | Avantages                 | Inconvénients                               | Note /10 | Choix ? |
| ----------- | ------------------------- | ------------------------------------------- | -------- | ------- |
| Ruff format | Rapide, compatible Black  | Moins de personnalisation                   | 9/10     | ✅       |
| Black       | Opinionated, très utilisé | Peu de personnalisation, plus lent que Ruff | 8/10     | ✅       |
| autopep8    | Permissif, simple         | Moins strict, moins adopté                  | 6/10     | ⚠️      |

**Justification** : Ruff format pour la rapidité et la compatibilité, Black pour l’adoption et standardisation, autopep8 pour des scripts simples ou legacy.

---

## 🔒 Type Checkers

| Outil   | Avantages                     | Inconvénients                           | Note /10 | Choix ? |
| ------- | ----------------------------- | --------------------------------------- | -------- | ------- |
| Mypy    | Référence, très précis        | Plus lent sur gros projets              | 9/10     | ✅       |
| Pyright | Rapide, intégration VS Code   | Moins complet que Mypy sur certains cas | 8/10     | ✅       |
| Pyre    | Rapide, utilisé chez Facebook | Communauté plus restreinte              | 7/10     | ⚠️      |

**Justification** : Mypy pour rigueur, Pyright pour rapidité et intégration IDE.

---

## 🧪 Frameworks de Tests

| Outil    | Avantages                   | Inconvénients               | Note /10 | Choix ? |
| -------- | --------------------------- | --------------------------- | -------- | ------- |
| pytest   | Flexible, plugins, fixtures | Apprentissage nécessaire    | 9/10     | ✅       |
| unittest | Standard library, simple    | Moins flexible, moins riche | 7/10     | ⚠️      |

**Justification** : pytest pour projets modernes et complexes, unittest pour petits projets ou contraintes strictes de stdlib.

---

## 🔐 Security Scanners

| Outil  | Avantages                           | Inconvénients               | Note /10 | Choix ? |
| ------ | ----------------------------------- | --------------------------- | -------- | ------- |
| Bandit | Analyse statique du code            | Limité aux patterns connus  | 7/10     | ✅       |
| Safety | Vérifie vulnérabilités dependencies | Pas de code static analysis | 8/10     | ✅       |
| Snyk   | Très complet, commercial            | Coût, setup                 | 9/10     | ✅/⚠️    |
| Trivy  | Analyse containers + dependencies   | Moins orienté code pur      | 8/10     | ✅       |

**Justification** : Bandit pour code, Safety pour dependencies, Snyk si budget autorisé, Trivy pour containers.

---

**Remarque générale** :

* Le choix dépend des besoins spécifiques du projet et de la balance vitesse / couverture / facilité d’usage.
* Une combinaison d’outils peut être utilisée pour maximiser la sécurité et la qualité.
