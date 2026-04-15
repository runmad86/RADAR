import SwiftUI

struct RadarRootView: View {
    var body: some View {
        NavigationStack {
            RadarListView(items: RadarMockData.listItems)
                .navigationTitle("RADAR")
        }
    }
}

#Preview {
    RadarRootView()
}
