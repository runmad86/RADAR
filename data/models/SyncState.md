# SyncState

## Rolle
Lille model der holder styr paa hvad der sidst er blevet syncet, hvornår det lykkedes, og hvad der eventuelt fejlede.

## Felter
- id
- entity_type
- entity_scope
- last_sync_at
- last_success_at
- sync_status
- source_name
- error_note

## Formaal
SyncState goer det muligt at opdatere diffen i stedet for hele verden.

## Regel
SyncState er lille, men vigtig. Den goer hele RADAR mindre saarbar.
