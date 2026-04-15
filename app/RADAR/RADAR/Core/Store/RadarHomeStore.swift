import Foundation

@MainActor
final class RadarHomeStore: ObservableObject {
    @Published private(set) var listResponse: RadarListResponse

    init(listResponse: RadarListResponse = RadarReadPreviewData.listResponse) {
        self.listResponse = listResponse
    }

    func loadPreview() {
        listResponse = RadarReadPreviewData.listResponse
    }

    func replace(response: RadarListResponse) {
        listResponse = response
    }
}
