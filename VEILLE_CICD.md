# Questions à documenter

## 1. Qu’est-ce que la CI (Continuous Integration) ?

La **Continuous Integration (CI)** consiste à intégrer régulièrement le code des développeurs dans la branche principale d’un projet, souvent plusieurs fois par jour. Chaque intégration déclenche un **processus automatisé** de compilation, tests et vérifications.

### Problèmes résolus

* Découverte tardive des bugs et conflits de code.
* Intégrations difficiles lorsque les branches divergent trop.
* Manque de visibilité sur la qualité du code.
* Coût élevé des corrections lorsque les erreurs sont détectées trop tard.

### Principes clés

* Intégrations fréquentes et incrémentales.
* Pipeline automatisé incluant compilation et tests.
* Retour rapide en cas d’erreur.
* Processus reproductible pour chaque contribution.

### Exemples d’outils

* GitHub Actions
* GitLab CI
* Jenkins

## 2. Qu’est-ce que le CD (Continuous Delivery / Continuous Deployment) ?

Le **Continuous Delivery/Deployment (CD)** automatise la mise à disposition du code après la CI, jusqu’aux environnements de test ou de production.

### Différence entre Continuous Delivery et Continuous Deployment

* **Continuous Delivery** : le pipeline prépare automatiquement le déploiement, mais la mise en production nécessite une validation humaine.
* **Continuous Deployment** : chaque changement validé est déployé automatiquement en production, sans intervention manuelle.

### Bénéfices

* Déploiements plus fréquents et moins risqués.
* Réduction des erreurs humaines.
* Processus standardisé et reproductible.
* Feedback rapide des utilisateurs.

### Risques

* Un défaut dans le pipeline peut envoyer un bug en production.
* Nécessite une bonne couverture de tests et une discipline technique stricte.

## 3. Pourquoi CI/CD est important ?

### Impact sur la qualité du code

* Les erreurs sont détectées plus tôt.
* Les tests automatisés garantissent un niveau de qualité constant.
* Le code reste plus stable sur la durée.

### Impact sur la vitesse de développement

* Réduction du temps passé sur les tâches manuelles (intégration, déploiement).
* Déploiements plus rapides et fréquents.
* Feedback immédiat lorsqu’un problème apparaît.

### Impact sur la collaboration

* Tous les développeurs travaillent sur une base de code cohérente.
* Réduction des conflits et des merges complexes.
* Processus transparent et partagé par toute l’équipe.

# Questions à documenter

## 1. Qu’est-ce que uv ?

**uv** est un gestionnaire de dépendances et d’environnements Python très rapide, développé pour remplacer ou simplifier plusieurs outils du quotidien (pip, venv, Poetry, pipenv, etc.).

### Différences avec pip / Poetry / Pipenv

* **pip** : installe des paquets mais ne gère pas les environnements ni les projets.
* **pipenv / Poetry** : gèrent les environnements et les dépendances, mais sont plus lents et reposent sur plusieurs outils séparés.
* **uv** : combine tout dans un seul outil, avec une installation et une résolution de dépendances beaucoup plus rapides.

### Avantages

* Très performant (installation et résolution nettement plus rapides).
* Commandes unifiées pour installation, environnement virtuel et exécution.
* Fonctionne avec **pyproject.toml** selon les standards modernes Python.
* Compatible avec les dépôts existants et les outils standards (PEP 517/518, wheel, venv, etc.).
* Facile à installer et sans dépendances lourdes.

---

## 2. Comment uv fonctionne avec pyproject.toml ?

uv utilise **pyproject.toml** comme fichier de configuration principal, à la manière de Poetry ou PDM.

### Structure du fichier

Un pyproject.toml typique contient :

* Les informations du projet (nom, version, etc.)
* Les dépendances
* Les dépendances de développement
* Le backend de build

### Gestion des dépendances

Les dépendances peuvent être séparées par sections :

* `[tool.uv.dependencies]` pour les dépendances runtime
* `[tool.uv.dev-dependencies]` pour les dépendances de développement

### Backend de build

uv supporte les backends standards définis dans PEP 517, par exemple :

```toml
[build-system]
requires = ["setuptools>=42", "wheel"]
build-backend = "setuptools.build_meta"
```

Exemple minimal :

```toml
[tool.uv]
name = "mon-projet"
version = "0.1.0"
dependencies = ["requests", "numpy"]
dev-dependencies = ["pytest"]
```

---

## 3. Comment utiliser uv dans GitHub Actions ?

### Installation

```yaml
- name: Install uv
  run: pip install uv
```

### Cache des dépendances

```yaml
- name: Cache uv dependencies
  uses: actions/cache@v3
  with:
    path: ~/.cache/uv
    key: ${{ runner.os }}-uv-${{ hashFiles('pyproject.toml') }}
```

### Exécution de commandes

```yaml
- name: Install dependencies
  run: uv install

- name: Run tests
  run: uv run pytest
```

# Questions à documenter

## 1. Qu’est-ce que le versionnage sémantique (SemVer) ?

Le **versionnage sémantique (SemVer)** est une convention standardisée pour numéroter les versions d’un logiciel de manière prévisible et significative.

### Format MAJOR.MINOR.PATCH

* **MAJOR** : changements incompatibles qui cassent la rétro-compatibilité (breaking changes).
* **MINOR** : nouvelles fonctionnalités ajoutées sans casser l’existant.
* **PATCH** : corrections de bugs ou petits changements internes sans impact sur l’API.

### Quand augmenter chaque niveau ?

* MAJOR → modifications incompatibles
* MINOR → nouvelles fonctionnalités rétro-compatibles
* PATCH → corrections de bugs ou petits ajustements

---

## 2. Qu’est-ce que Conventional Commits ?

**Conventional Commits** est une convention pour formater les messages de commit afin d’automatiser le versionnage, les changelogs et les releases.

### Format des messages

Un message suit généralement la forme :

```
type(scope?): description

[body]

[footer]
```

### Types courants

* **feat** : ajout de fonctionnalité
* **fix** : correction d’un bug
* **docs** : documentation
* **refactor** : changement interne sans modification de comportement
* **test** : ajout/modification de tests
* **chore** : maintenance / tâches internes

### Impact sur le versionnage

* `feat` → augmentation MINOR
* `fix` → augmentation PATCH
* commit contenant `BREAKING CHANGE:` → augmentation MAJOR

---

## 3. Comment python-semantic-release fonctionne ?

**python-semantic-release** est un outil qui analyse les commits (selon Conventional Commits) pour générer automatiquement la prochaine version, le changelog et la release.

### Configuration dans pyproject.toml

Le comportement se configure dans une section dédiée, par exemple :

```toml
[tool.semantic_release]
version_source = "commit"
branch = "main"
upload_to_pypi = true
```

Paramètres possibles :

* Stratégie de version (auto ou manuelle)
* Méthode de publication (PyPI, GitHub, etc.)
* Branche par défaut
* Emplacement du CHANGELOG

### Génération du CHANGELOG

* Analyse des commits
* Classification par type (feat, fix…)
* Mise à jour automatique du `CHANGELOG.md`

### Création des releases GitHub

* Génération d’un tag Git correspondant à la version
* Création d’une release GitHub
* Ajout des fichiers nécessaires (ex : wheels, source)

Le processus permet une **release entièrement automatisée**.


