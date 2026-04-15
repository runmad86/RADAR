import Foundation

enum RadarReadPreviewData {
    static let listResponse: RadarListResponse =
        RadarReadMapper.makeListResponse(from: RadarMockData.listItems)

    static let firstItem: RadarListItemReadModel =
        listResponse.items.first ?? RadarListItemReadModel(
            id: "fallback",
            displayTitle: "Ingen data",
            competitionName: "RADAR",
            kickoffText: "",
            primaryProfile: .none,
            profileStrength: .weak,
            primarySymbolName: RadarProfile.none.symbolName,
            supportIcons: [],
            shortVerdict: "Ingen klar case",
            detail: MatchDetailReadModel(
                id: "fallback-detail",
                title: "Ingen data",
                competitionName: "RADAR",
                kickoffText: "",
                primaryProfile: .none,
                profileStrength: .weak,
                primarySymbolName: RadarProfile.none.symbolName,
                supportIcons: [],
                whyBlocks: [],
                output: OutputReadModel(baseCases: [], spikeCases: [], hasNoClearCase: true),
                verdictText: "Ingen staerk nok case endnu.",
                lastUpdatedAt: Date()
            )
        )
}
