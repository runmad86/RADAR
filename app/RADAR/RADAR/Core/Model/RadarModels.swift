import Foundation

enum RadarProfile: String, Codable, CaseIterable {
    case open
    case hot
    case locked
    case none

    var title: String {
        switch self {
        case .open: return "Open"
        case .hot: return "Hot"
        case .locked: return "Locked"
        case .none: return "None"
        }
    }

    var symbolName: String {
        switch self {
        case .open: return "bolt.horizontal.circle"
        case .hot: return "flame"
        case .locked: return "lock"
        case .none: return "questionmark.circle"
        }
    }
}

enum RadarStrength: Int, Codable, CaseIterable {
    case weak = 1
    case moderate = 2
    case strong = 3
}

struct RadarWhyBlock: Identifiable, Hashable {
    let id = UUID()
    let iconName: String
    let title: String
    let subtitle: String?
}

struct RadarOutputSection: Hashable {
    let baseCases: [String]
    let spikeCases: [String]
    let hasNoClearCase: Bool
}

struct RadarMatchDetail: Identifiable, Hashable {
    let id: String
    let title: String
    let competitionName: String
    let kickoffText: String
    let profile: RadarProfile
    let strength: RadarStrength
    let supportIcons: [String]
    let whyBlocks: [RadarWhyBlock]
    let outputs: RadarOutputSection
    let verdict: String
}

struct RadarListItem: Identifiable, Hashable {
    let id: String
    let title: String
    let competitionName: String
    let kickoffText: String
    let profile: RadarProfile
    let strength: RadarStrength
    let supportIcons: [String]
    let shortVerdict: String
    let detail: RadarMatchDetail
}
