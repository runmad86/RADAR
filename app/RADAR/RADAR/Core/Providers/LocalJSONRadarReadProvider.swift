import Foundation

struct LocalJSONRadarReadProvider: RadarReadProviding {
    private let bundle: Bundle
    private let resourceName: String

    init(bundle: Bundle = .main, resourceName: String = "radar_list_mock") {
        self.bundle = bundle
        self.resourceName = resourceName
    }

    func fetchRadarList() async throws -> RadarListResponse {
        guard let url = bundle.url(forResource: resourceName, withExtension: "json") else {
            throw LocalJSONRadarReadProviderError.missingResource(resourceName)
        }

        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let dto = try decoder.decode(RadarListResponseDTO.self, from: data)
        return RadarDTOMapper.makeListResponse(from: dto)
    }
}

enum LocalJSONRadarReadProviderError: Error {
    case missingResource(String)
}
