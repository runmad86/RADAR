import Foundation

enum RadarReadMapper {
    static func makeListResponse(from items: [RadarListItem]) -> RadarListResponse {
        RadarListResponse(
            periodScope: "today",
            lastUpdatedAt: Date(),
            items: items.map(makeListItem),
            emptyStateMessage: items.isEmpty ? "Ingen kampe i radar lige nu." : nil
        )
    }

    static func makeListItem(from item: RadarListItem) -> RadarListItemReadModel {
        RadarListItemReadModel(
            id: item.id,
            displayTitle: item.title,
            competitionName: item.competitionName,
            kickoffText: item.kickoffText,
            primaryProfile: item.profile,
            profileStrength: item.strength,
            primarySymbolName: item.profile.symbolName,
            supportIcons: item.supportIcons,
            shortVerdict: item.shortVerdict,
            detail: makeDetail(from: item.detail)
        )
    }

    static func makeDetail(from detail: RadarMatchDetail) -> MatchDetailReadModel {
        MatchDetailReadModel(
            id: detail.id,
            title: detail.title,
            competitionName: detail.competitionName,
            kickoffText: detail.kickoffText,
            primaryProfile: detail.profile,
            profileStrength: detail.strength,
            primarySymbolName: detail.profile.symbolName,
            supportIcons: detail.supportIcons,
            whyBlocks: detail.whyBlocks.map(makeWhyBlock),
            output: makeOutput(from: detail.outputs),
            verdictText: detail.verdict,
            lastUpdatedAt: Date()
        )
    }

    static func makeWhyBlock(from block: RadarWhyBlock) -> WhyBlockReadModel {
        WhyBlockReadModel(
            iconName: block.iconName,
            title: block.title,
            subtitle: block.subtitle
        )
    }

    static func makeOutput(from output: RadarOutputSection) -> OutputReadModel {
        OutputReadModel(
            baseCases: output.baseCases,
            spikeCases: output.spikeCases,
            hasNoClearCase: output.hasNoClearCase
        )
    }
}
