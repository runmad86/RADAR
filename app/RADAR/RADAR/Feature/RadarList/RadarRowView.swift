import SwiftUI

struct RadarRowView: View {
    let item: RadarListItemReadModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: item.primarySymbolName)
                    .font(.title3)

                VStack(alignment: .leading, spacing: 4) {
                    Text(item.displayTitle)
                        .font(.headline)

                    Text(item.kickoffText)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                StrengthDotsView(strength: item.profileStrength)
            }

            HStack(spacing: 8) {
                ForEach(item.supportIcons, id: \.self) { icon in
                    Image(systemName: icon)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            Text(item.shortVerdict)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    RadarRowView(item: RadarReadPreviewData.firstItem)
        .padding()
}
