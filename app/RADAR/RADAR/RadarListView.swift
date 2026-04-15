import SwiftUI

struct RadarListView: View {
    let response: RadarListResponse

    var body: some View {
        Group {
            if response.items.isEmpty {
                ContentUnavailableView(
                    "Ingen kampe",
                    systemImage: "dot.radiowaves.left.and.right",
                    description: Text(response.emptyStateMessage ?? "Ingen kampe i radar lige nu.")
                )
            } else {
                List(response.items) { item in
                    NavigationLink {
                        MatchDetailView(detail: item.detail)
                    } label: {
                        RadarRowView(item: item)
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}

#Preview {
    NavigationStack {
        RadarListView(response: RadarReadPreviewData.listResponse)
    }
}
