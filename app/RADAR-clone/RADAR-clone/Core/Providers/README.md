# Core/Providers

Her bor de små read-providers som leverer data til stores.

Eksempler:
- PreviewRadarReadProvider
- senere backend/provider implementations

Regel:
Stores skal helst afhænge af en provider-protokol, ikke direkte af preview-data eller netværk.
