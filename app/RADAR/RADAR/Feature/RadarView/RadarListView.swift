import SwiftUI

struct RadarListView: View {
    let items: [RadarListItem]

    var body: some View {
        List(items) { item in
            NavigationLink {
                MatchDetailView(detail: item.detail)
            } label: {
                RadarRowView(item: item)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        RadarListView(items: RadarMockData.listItems)
    }
}
