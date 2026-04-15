import SwiftUI

struct StrengthDotsView: View {
    let strength: RadarStrength

    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...3, id: \.self) { index in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundStyle(index <= strength.rawValue ? .primary : .tertiary)
            }
        }
    }
}

#Preview {
    StrengthDotsView(strength: .strong)
        .padding()
}
