# Blog AI

Flutter-Blog-App mit KI-Funktionen (Zusammenfassungen, Tag-Vorschläge, Schreibassistent).
Projektarbeit Mobile Computing, HFTM – Vertiefungsthema **AI-Integration in Flutter**.
Die vollständige Aufgabenstellung steht in [AUFGABENSTELLUNG.md](AUFGABENSTELLUNG.md).

## Stand

| Funktion | Status |
|---|---|
| Beitragsliste (In-Memory-Daten) | ✅ |
| Detail / Erstellen / Bearbeiten | ⏳ |
| Firebase AI Logic + App Check | ⏳ |
| KI-Zusammenfassung, Tag-Vorschläge, Schreibassistent | ⏳ |

## Architektur

```
lib/
├── main.dart                 # App-Einstieg, ProviderScope, Theme
└── features/
    ├── posts/                # Blog-Beiträge
    │   ├── post.dart             # Datenmodell
    │   ├── posts_repository.dart # Datenzugriff + Riverpod-Provider
    │   └── post_list_screen.dart # UI
    └── ai/                   # (folgt) KI-Service auf Basis firebase_ai
```

- **Feature-first:** Jedes Feature enthält Modell, Datenzugriff und UI.
- **Schichten:** Widget → Provider → Repository/Service → Datenquelle. Widgets kennen nur Provider,
  nie die Datenquelle direkt.
- **State Management:** [Riverpod](https://riverpod.dev). Asynchrone Daten werden als `AsyncValue`
  (`loading` / `error` / `data`) dargestellt. In Tests werden Provider per `overrides` ersetzt.

## Abhängigkeiten

| Paket | Zweck |
|---|---|
| `flutter_riverpod` | State Management |
| `material_ui` | Material-Widgets |
| `firebase_core`, `firebase_ai`, `firebase_app_check` | (folgt) KI über Firebase AI Logic |

## Setup

Voraussetzungen: Flutter (stable, getestet mit 3.50), Android Studio bzw. Android SDK, ein
Android-Gerät oder Emulator.

```bash
git clone https://github.com/MohamedRumy-HFTM/Mobile-Computing.git
cd Mobile-Computing
flutter pub get
```

Firebase (sobald die KI-Funktionen integriert sind):

```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

## Start im Entwicklungsmodus auf einem Android-Gerät

1. Auf dem Gerät **Entwickleroptionen** aktivieren (Einstellungen → Über das Telefon →
   7× auf «Build-Nummer» tippen) und **USB-Debugging** einschalten.
2. Gerät per USB verbinden und die Debugging-Anfrage bestätigen.
3. Prüfen, ob das Gerät erkannt wird: `flutter devices`
4. App starten (Hot Reload mit `r`, Hot Restart mit `R`): `flutter run`

## Build

```bash
flutter build apk --release   # APK unter build/app/outputs/flutter-apk/
```

## Tests & CI

```bash
flutter analyze
flutter test
```

GitHub Actions führt beide Schritte bei jedem Push aus (`.github/workflows/ci.yml`).

## Tool-Setup, Quellen & KI-Einsatz

- **Tools:** Flutter 3.50, VS Code / Android Studio, GitHub, GitHub Actions.
- **Quellen:** [Flutter-Dokumentation](https://docs.flutter.dev),
  [Firebase AI Logic](https://firebase.google.com/docs/ai-logic), [Riverpod](https://riverpod.dev).
- **KI-Einsatz:** Projektgerüst, README und Entwurf der Aufgabenstellung wurden mit Unterstützung
  von Claude Code (Anthropic) erstellt und anschliessend selbst geprüft und angepasst.
  Weitere KI-Unterstützung wird hier laufend dokumentiert.
