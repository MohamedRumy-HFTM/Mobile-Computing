# Aufgabenstellung – Blog AI

**Betreff (Forum):** Mohamed Rumy – AI-Integration in Flutter
**Repository:** https://github.com/MohamedRumy-HFTM/Mobile-Computing
**Vertiefungsthema:** 8 – AI-Integration in Flutter

## Ziel der App

«Blog AI» ist eine Flutter-Blog-App für Android, die Autorinnen und Leser mit KI-Funktionen
unterstützt. Grundlage ist eine einfache Blog-App (Beiträge lesen, erstellen, bearbeiten) gemäss
Kursbeispiel. Darauf aufbauend werden KI-Funktionen über **Firebase AI Logic** (`firebase_ai`,
Gemini-Modelle) integriert, abgesichert mit **Firebase App Check**.

## Konkrete Ziele

### Muss-Ziele

1. **Blog-Grundfunktionen:** Beiträge auflisten, Detailansicht, Beitrag erstellen und bearbeiten.
2. **KI-Zusammenfassung:** Per Knopfdruck eine kurze Zusammenfassung (TL;DR) eines Beitrags
   erzeugen; die Antwort wird gestreamt angezeigt.
3. **Tag-Vorschläge:** Beim Schreiben schlägt die KI passende Tags vor. Die Antwort wird als
   strukturierte Ausgabe (JSON-Schema) angefordert und typsicher in Dart geparst; Tags können
   einzeln übernommen werden.
4. **Schreibassistent:** Titelvorschläge und «Text verbessern» für den Entwurf.
5. **Absicherung:** Firebase App Check, damit nur die echte App das KI-Backend nutzen kann;
   kein API-Key im Quellcode.
6. **Robuste Fehlerbehandlung:** Verständliche Meldungen bei fehlender Verbindung,
   Quota-Überschreitung oder Timeout; die App bleibt ohne KI voll nutzbar.

### Kann-Ziele

7. **Multimodal:** Foto mit der Kamera aufnehmen → KI erzeugt Alt-Text bzw. einen Beitragsentwurf.
8. **Generative UI:** Mit dem GenUI SDK (`genui`) eine dynamisch erzeugte Beitrags-Vorschau.
9. **Cloud vs. On-Device:** Vergleich der Zusammenfassung mit einem lokalen Modell
   (MediaPipe / `flutter_litert_lm`) bezüglich Qualität, Latenz und Offline-Fähigkeit.

## Architektur & State Management

- Feature-basierte Ordnerstruktur (`lib/features/posts`, `lib/features/ai`).
- Schichten: UI-Widgets → Riverpod-Provider (State) → Repository/Service → Datenquelle
  (Blog-API bzw. Firebase AI).
- State Management mit **Riverpod**; KI-Antworten als `AsyncValue` bzw. Streams, damit Laden,
  Fehler und Ergebnis sauber in der UI abgebildet werden.

## Abgrenzungen

- Zielplattform ist Android; iOS wird mitgeneriert, aber nicht garantiert getestet.
- Kein eigenes Backend-Hosting: Blog-Daten kommen aus dem Kurs-Backend (bis dahin In-Memory).
- Benutzer-Authentifizierung ist nicht Teil des Vertiefungsthemas.
