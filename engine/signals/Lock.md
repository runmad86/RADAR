# Lock

## Rolle
Lock er signalet for lukkethed, faa rum og lav maal-frekvens.

## Hvad signalet skal sige
Kampen lugter af:
- lukkethed
- forsigtighed
- faa aabninger
- under-lugt

## Bygges af
- lav goals_scored_rate
- lav btts_rate
- lav over25_rate
- svag first-half aktivitet
- svag eller fravaerende goal-pattern stoette i matchup summary

## Fast regel
Lock maa ikke blive strong hvis GoalFlow samtidig ogsaa er strong. I den type kamp skal none eller anden laesning kunne leve.

## Typisk brug
Lock er et af de vigtigste inputs til:
- locked
- afgraensning mod none
- afgraensning mod open
