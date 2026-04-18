import SwiftUI

struct RadarRootView: View {
    @StateObject private var store = RadarHomeStore()

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
    RadarRootView()
}
