# MatchupSupport

## Rolle
MatchupSupport er signalet for om netop dette opgoer har et frisk moenster der stoetter den oevrige laesning.

## Hvad signalet skal sige
Det her holdpar har nyere indbyrdes træk der giver ekstra vaegt til:
- maal-lugt
- varme
- first-half aktivitet

## Bygges af
- goal_pattern_strength fra matchup summary
- heat_pattern_strength fra matchup summary
- first_half_activity_strength fra matchup summary
- freshness_level

## Fast regel
MatchupSupport er stoette. Ikke hovedmotor. Det maa aldrig baere casen alene.

## Typisk brug
MatchupSupport er et af de vigtigste inputs til:
- open
- hot
- spids-cases senere
- afgraensning af tvivlsomme graensekampe
