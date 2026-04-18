import Foundation

struct BackendRadarListDTO: Decodable {
    let periodScope: String
    let lastUpdatedAt: String
    let items: [BackendRadarListItemDTO]
    let emptyStateMessage: String?
}

struct BackendRadarListItemDTO: Decodable {
    let id: String
    let displayTitle: String
    let competitionName: String
    let kickoffText: String
    let primaryProfile: String
    let profileStrength: Int
    let primarySymbolName: String
    let supportIcons: [String]
    let shortVerdict: String
    let detail: BackendMatchDetailDTO
}

struct BackendMatchDetailDTO: Decodable {
    let id: String
    let title: String
    let competitionName: String
    let kickoffText: String
    let primaryProfile: String
    let profileStrength: Int
    let primarySymbolName: String
    let supportIcons: [String]
    let whyBlocks: [BackendWhyBlockDTO]
    let output: BackendOutputDTO
    let verdictText: String
    let lastUpdatedAt: String
}

struct BackendWhyBlockDTO: Decodable {
    let iconName: String
    let title: String
    let subtitle: String?
}

struct BackendOutputDTO: Decodable {
    let baseCases: [String]
    let spikeCases: [String]
    let hasNoClearCase: Bool
}
