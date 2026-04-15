import Foundation

protocol RadarReadProviding {
    func fetchRadarList() async throws -> RadarListResponse
}
