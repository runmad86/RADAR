import Foundation

struct PreviewRadarReadProvider: RadarReadProviding {
    func fetchRadarList() async throws -> RadarListResponse {
        RadarReadPreviewData.listResponse
    }
}
