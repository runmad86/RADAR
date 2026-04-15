import SwiftUI

struct MatchDetailView: View {
    let detail: RadarMatchDetail

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                MatchTopFieldView(detail: detail)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Hvorfor")
                        .font(.headline)

                    ForEach(detail.whyBlocks) { block in
                        HStack(alignment: .top, spacing: 10) {
                            Image(systemName: block.iconName)
                                .frame(width: 20)
                            VStack(alignment: .leading, spacing: 4) {
                                Text(block.title)
                                    .font(.subheadline.weight(.semibold))
                                if let subtitle = block.subtitle {
                                    Text(subtitle)
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Mulige outputs")
                        .font(.headline)

                    if detail.outputs.hasNoClearCase {
                        Text("Ingen klar case")
                            .foregroundStyle(.secondary)
                    } else {
                        if !detail.outputs.baseCases.isEmpty {
                            Text("Base")
                                .font(.subheadline.weight(.semibold))
                            ForEach(detail.outputs.baseCases, id: \.self) { item in
                                Text("• \(item)")
                            }
                        }

                        if !detail.outputs.spikeCases.isEmpty {
                            Text("Spids")
                                .font(.subheadline.weight(.semibold))
                                .padding(.top, 4)
                            ForEach(detail.outputs.spikeCases, id: \.self) { item in
                                Text("• \(item)")
                            }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Dom")
                        .font(.headline)
                    Text(detail.verdict)
                        .font(.body)
                }
            }
            .padding()
        }
        .navigationTitle(detail.competitionName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MatchDetailView(detail: RadarMockData.listItems[0].detail)
    }
}
