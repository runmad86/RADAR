import SwiftUI

struct RadarRootView: View {
    private let response = RadarReadPreviewData.listResponse

    var body: some View {
        NavigationStack {
            RadarListView(response: response)
                .navigationTitle("RADAR")
        }
    }
}

#Preview {
    RadarRootView()
}
