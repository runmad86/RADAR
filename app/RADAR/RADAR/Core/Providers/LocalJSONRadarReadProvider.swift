import Foundation

struct LocalJSONRadarReadProvider: RadarReadProviding {
    func fetchRadarList() async throws -> RadarListResponse {
        guard let url = Bundle.main.url(forResource: "MockRadarListResponse", withExtension: "json") else {
            throw LocalJSONRadarReadProviderError.missingResource
        }

        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let dto = try decoder.decode(BackendRadarListDTO.self, from: data)
        return map(dto: dto)
    }

    private func map(dto: BackendRadarListDTO) -> RadarListResponse {
        RadarListResponse(
            periodScope: dto.periodScope,
            lastUpdatedAt: parseDate(dto.lastUpdatedAt),
            items: dto.items.map(mapItem),
            emptyStateMessage: dto.emptyStateMessage
        )
    }

    private func mapItem(_ item: BackendRadarListItemDTO) -> RadarListItemReadModel {
        RadarListItemReadModel(
            id: item.id,
            displayTitle: item.displayTitle,
            competitionName: item.competitionName,
            kickoffText: item.kickoffText,
            primaryProfile: mapProfile(item.primaryProfile),
            profileStrength: mapStrength(item.profileStrength),
            primarySymbolName: item.primarySymbolName,
            supportIcons: item.supportIcons,
            shortVerdict: item.shortVerdict,
            detail: mapDetail(item.detail)
        )
    }

    private func mapDetail(_ detail: BackendMatchDetailDTO) -> MatchDetailReadModel {
        MatchDetailReadModel(
            id: detail.id,
            title: detail.title,
            competitionName: detail.competitionName,
            kickoffText: detail.kickoffText,
            primaryProfile: mapProfile(detail.primaryProfile),
            profileStrength: mapStrength(detail.profileStrength),
            primarySymbolName: detail.primarySymbolName,
            supportIcons: detail.supportIcons,
            whyBlocks: detail.whyBlocks.map {
                WhyBlockReadModel(iconName: $0.iconName, title: $0.title, subtitle: $0.subtitle)
            },
            output: OutputReadModel(
                baseCases: detail.output.baseCases,
                spikeCases: detail.output.spikeCases,
                hasNoClearCase: detail.output.hasNoClearCase
            ),
            verdictText: detail.verdictText,
            lastUpdatedAt: parseDate(detail.lastUpdatedAt)
        )
    }

    private func mapProfile(_ value: String) -> RadarProfile {
        RadarProfile(rawValue: value) ?? .none
    }

    private func mapStrength(_ value: Int) -> RadarStrength {
        RadarStrength(rawValue: value) ?? .weak
    }

    private func parseDate(_ value: String) -> Date {
        ISO8601DateFormatter().date(from: value) ?? Date()
    }
}

enum LocalJSONRadarReadProviderError: Error {
    case missingResource
}
