import Foundation

struct LocalJSONRadarReadProvider: RadarReadProviding {
    let bundle: Bundle
    let resourceName: String

    init(bundle: Bundle = .main, resourceName: String = "radar_list_mock") {
        self.bundle = bundle
        self.resourceName = resourceName
    }

    func fetchRadarList() async throws -> RadarListResponse {
        let data = try loadData()
        let dto = try JSONDecoder().decode(RadarListResponseDTO.self, from: data)
        return RadarDTOMapper.makeListResponse(from: dto)
    }

    private func loadData() throws -> Data {
        if let url = bundle.url(forResource: resourceName, withExtension: "json") {
            return try Data(contentsOf: url)
        }

        if let url = bundle.url(forResource: resourceName, withExtension: "json", subdirectory: "Core/Preview") {
            return try Data(contentsOf: url)
        }

        throw LocalJSONRadarReadProviderError.missingResource(resourceName)
    }
}

enum LocalJSONRadarReadProviderError: LocalizedError {
    case missingResource(String)

    var errorDescription: String? {
        switch self {
        case let .missingResource(name):
            return "Could not find local JSON resource named \(name).json"
        }
    }
}
