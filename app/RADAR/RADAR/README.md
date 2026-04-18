# RADAR app structure

## Retning
Appen er delt i:
- Feature/
- Core/

## Feature
Her bor konkrete brugerflader.

Eksempler:
- Feature/RadarList/
- Feature/MatchDetail/
- Feature/StrengthDots/

Regel:
Features ejer views. Ikke datafundament og ikke motorlogik.

## Core
Her bor tværgående app-lag.

Eksempler:
- read-modeller
- mapper
- preview-data
- store/viewmodel-lag

Regel:
Core skal holde appen stabil, når vi senere skifter fra preview-data til rigtige read-responses.

## Praktisk regel
Hvis noget er knyttet til én skærm, hører det typisk hjemme i Feature.
Hvis noget bruges flere steder eller binder data sammen, hører det typisk hjemme i Core.
