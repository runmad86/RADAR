# START_PACKAGE_V1

## Formaal
Den foerste pakke skal gøre repoet til en rigtig arbejdsbase og bygge den foerste RADAR-rygsoejle korrekt.

## Byg foerst
1. matches
2. team_match_stats
3. head_to_head_records
4. sync_state
5. team_form_summaries
6. matchup_summaries
7. goalFlow / heat / lock / matchupSupport
8. profile resolver
9. output resolver
10. radarlist read model
11. match detail read model
12. foerste radarliste
13. foerste kampvisning

## Foerste uge i praksis
### Del 1 - Data
- opret matches
- opret team_match_stats
- opret head_to_head_records
- opret sync_state

### Del 2 - Afledt lag
- byg team_form_summaries
- byg matchup_summaries

### Del 3 - Motor
- byg signaler
- byg profiler
- byg outputs

### Del 4 - Read/App
- byg radarlist read model
- byg match detail read model
- byg RadarListView
- byg MatchDetailView

## Foerste groen-check
Foerste pakke er groen når:
- kampe kan gemmes stabilt
- diff-sync virker
- en kamp kan faa signaler
- en kamp kan faa profil
- en kamp kan faa outputs
- radarlisten kan vises
- kampvisningen kan vises
- none kan vises aeerligt

## Vigtig regel
Byg ikke lineups, odds, vejr, dommere eller store sidefeatures foer den her pakke virker.
