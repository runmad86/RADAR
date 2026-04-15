# ProfileResolver

## Rolle
ProfileResolver vaelger kampens hovedprofil ud fra signalerne.

## Foerste profiler i v1
- open
- hot
- locked
- none

## Foerste principper
- Open vinder naar gensidighed og maal-lugt er hovedlugten
- Hot vinder naar temperatur og kort er hovedlugten
- Locked vinder naar lukkethed og under-lugt er hovedlugten
- None vinder naar ingen profil er stærk nok eller ærlig nok

## Foerste input
- GoalFlow
- Heat
- Lock
- MatchupSupport

## Foerste resolver-regler
- stærk GoalFlow + svag Lock peger mod open
- stærk Heat + reel stoette peger mod hot
- stærk Lock + svag GoalFlow peger mod locked
- moderate blandede signaler peger ofte mod none

## Fast regel
Hvis to profiler ligger tæt uden klar naturlig base-case, skal none have lov at leve.

## Naeste udvidelse
Senere kan ProfileResolver udvides med:
- pressure
- response
- bedre graensekalibrering mellem profilerne
