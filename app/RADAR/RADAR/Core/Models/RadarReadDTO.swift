import Foundation

struct RadarListResponseDTO: Codable {
    let periodScope: String
    let lastUpdatedAt: String
    let emptyStateMessage: String?
    let items: [RadarListItemDTO]
}

struct RadarListItemDTO: Codable {
    let id: String
    let displayTitle: String
    let competitionName: String
    let kickoffText: String
    let primaryProfile: String
    let profileStrength: Int
    let primarySymbolName: String
    let supportIcons: [String]
    let shortVerdict: String
    let detail: MatchDetailDTO
}

struct MatchDetailDTO: Codable {
    let id: String
    let title: String
    let competitionName: String
    let kickoffText: String
    let primaryProfile: String
    let profileStrength: Int
    let primarySymbolName: String
    let supportIcons: [String]
    let whyBlocks: [WhyBlockDTO]
    let output: OutputDTO
    let verdictText: String
    let lastUpdatedAt: String
}

struct WhyBlockDTO: Codable {
    let iconName: String
    let title: String
    let subtitle: String?
}

struct OutputDTO: Codable {
    let baseCases: [String]
    let spikeCases: [String]
    let hasNoClearCase: Bool
}
