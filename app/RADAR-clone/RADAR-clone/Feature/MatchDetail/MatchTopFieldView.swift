import SwiftUI

struct MatchTopFieldView: View {
    let detail: MatchDetailReadModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(detail.title)
                        .font(.title2.bold())

                    Text(detail.kickoffText)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 8) {
                    Image(systemName: detail.primarySymbolName)
                        .font(.title2)
                    StrengthDotsView(strength: detail.profileStrength)
                }
            }

            HStack(spacing: 8) {
                ForEach(detail.supportIcons, id: \.self) { icon in
                    Image(systemName: icon)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    MatchTopFieldView(detail: RadarReadPreviewData.firstItem.detail)
        .padding()
}
