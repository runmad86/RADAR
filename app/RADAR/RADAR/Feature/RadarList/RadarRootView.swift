import SwiftUI

struct RadarRootView: View {
    @StateObject private var store: RadarHomeStore

    init(
        provider: RadarReadProviding = LocalJSONRadarReadProvider(),
        initialResponse: RadarListResponse = RadarReadPreviewData.listResponse
    ) {
        _store = StateObject(
            wrappedValue: RadarHomeStore(
                provider: provider,
                initialResponse: initialResponse
            )
        )
    }

    var body: some View {
        NavigationStack {
            RadarListView(response: store.listResponse)
                .navigationTitle("RADAR")
        }
        .task {
            await store.load()
        }
    }
}

#Preview {
    RadarRootView(provider: PreviewRadarReadProvider())
}
