import Foundation

enum RadarDTOMapper {
    static func makeListResponse(from dto: RadarListResponseDTO) -> RadarListResponse {
        RadarListResponse(
            periodScope: dto.periodScope,
            lastUpdatedAt: parseDate(dto.lastUpdatedAt),
            items: dto.items.map(makeListItem),
            emptyStateMessage: dto.emptyStateMessage
        )
    }

    static func makeListItem(from item: RadarListItemDTO) -> RadarListItemReadModel {
        let profile = mapProfile(item.primaryProfile)
        let strength = mapStrength(item.profileStrength)

        return RadarListItemReadModel(
            id: item.id,
            displayTitle: item.displayTitle,
            competitionName: item.competitionName,
            kickoffText: item.kickoffText,
            primaryProfile: profile,
            profileStrength: strength,
            primarySymbolName: item.primarySymbolName.isEmpty ? profile.symbolName : item.primarySymbolName,
            supportIcons: item.supportIcons,
            shortVerdict: item.shortVerdict,
            detail: makeDetail(from: item.detail)
        )
    }

    static func makeDetail(from detail: MatchDetailDTO) -> MatchDetailReadModel {
        let profile = mapProfile(detail.primaryProfile)
        let strength = mapStrength(detail.profileStrength)

        return MatchDetailReadModel(
            id: detail.id,
            title: detail.title,
            competitionName: detail.competitionName,
            kickoffText: detail.kickoffText,
            primaryProfile: profile,
            profileStrength: strength,
            primarySymbolName: detail.primarySymbolName.isEmpty ? profile.symbolName : detail.primarySymbolName,
            supportIcons: detail.supportIcons,
            whyBlocks: detail.whyBlocks.map(makeWhyBlock),
            output: makeOutput(from: detail.output),
            verdictText: detail.verdictText,
            lastUpdatedAt: parseDate(detail.lastUpdatedAt)
        )
    }

    static func makeWhyBlock(from block: WhyBlockDTO) -> WhyBlockReadModel {
        WhyBlockReadModel(
            iconName: block.iconName,
            title: block.title,
            subtitle: block.subtitle
        )
    }

    static func makeOutput(from output: OutputDTO) -> OutputReadModel {
        OutputReadModel(
            baseCases: output.baseCases,
            spikeCases: output.spikeCases,
            hasNoClearCase: output.hasNoClearCase
        )
    }

    private static func mapProfile(_ rawValue: String) -> RadarProfile {
        RadarProfile(rawValue: rawValue.lowercased()) ?? .none
    }

    private static func mapStrength(_ rawValue: Int) -> RadarStrength {
        RadarStrength(rawValue: rawValue) ?? .weak
    }

    private static func parseDate(_ value: String) -> Date {
        if let date = iso8601WithFractionalSeconds.date(from: value) {
            return date
        }

        if let date = iso8601.date(from: value) {
            return date
        }

        return Date()
    }

    private static let iso8601WithFractionalSeconds: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()

    private static let iso8601: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime]
        return formatter
    }()
}
