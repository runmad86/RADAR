import Foundation

@MainActor
final class RadarHomeStore: ObservableObject {
    @Published private(set) var listResponse: RadarListResponse

    private let provider: RadarReadProviding
    private let fallbackResponse: RadarListResponse

    init(
        provider: RadarReadProviding = LocalJSONRadarReadProvider(),
        initialResponse: RadarListResponse = RadarReadPreviewData.listResponse
    ) {
        self.provider = provider
        self.fallbackResponse = initialResponse
        self.listResponse = initialResponse
    }

    func load() async {
        if let response = try? await provider.fetchRadarList() {
            listResponse = response
        } else {
            listResponse = fallbackResponse
        }
    }

    func replace(response: RadarListResponse) {
        listResponse = response
    }
}
