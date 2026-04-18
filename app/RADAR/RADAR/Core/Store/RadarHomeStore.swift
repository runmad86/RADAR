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
        do {
            let response = try await provider.fetchRadarList()
            listResponse = response
            print("RADAR: loaded list response from provider \(String(describing: type(of: provider))) with \(response.items.count) items")
        } catch {
            listResponse = RadarReadPreviewData.listResponse
            print("RADAR: failed to load provider data, falling back to preview. Error: \(error.localizedDescription)")
        }
    }

    func replace(response: RadarListResponse) {
        listResponse = response
    }
}
