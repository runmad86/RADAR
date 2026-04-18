import Foundation

struct RadarListResponse: Hashable {
    let periodScope: String
    let lastUpdatedAt: Date
    let items: [RadarListItemReadModel]
    let emptyStateMessage: String?
}

struct RadarListItemReadModel: Identifiable, Hashable {
    let id: String
    let displayTitle: String
    let competitionName: String
    let kickoffText: String
    let primaryProfile: RadarProfile
    let profileStrength: RadarStrength
    let primarySymbolName: String
    let supportIcons: [String]
    let shortVerdict: String
    let detail: MatchDetailReadModel
}

struct MatchDetailReadModel: Identifiable, Hashable {
    let id: String
    let title: String
    let competitionName: String
    let kickoffText: String
    let primaryProfile: RadarProfile
    let profileStrength: RadarStrength
    let primarySymbolName: String
    let supportIcons: [String]
    let whyBlocks: [WhyBlockReadModel]
    let output: OutputReadModel
    let verdictText: String
    let lastUpdatedAt: Date
}

struct WhyBlockReadModel: Identifiable, Hashable {
    let id = UUID()
    let iconName: String
    let title: String
    let subtitle: String?
}

struct OutputReadModel: Hashable {
    let baseCases: [String]
    let spikeCases: [String]
    let hasNoClearCase: Bool
}
