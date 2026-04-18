import Foundation

@MainActor
final class RadarHomeStore: ObservableObject {
    @Published private(set) var listResponse: RadarListResponse

    private let provider: RadarReadProviding

    init(provider: RadarReadProviding = LocalJSONRadarReadProvider()) {
        self.provider = provider
        self.listResponse = RadarReadPreviewData.listResponse
    }

    func load() async {
        if let response = try? await provider.fetchRadarList() {
            listResponse = response
        } else {
            listResponse = RadarReadPreviewData.listResponse
        }
    }

    func replace(response: RadarListResponse) {
        listResponse = response
    }
}
