import SwiftUI

// MARK: - CircleProgressRing

/// Circular arc progress indicator used for score/progress display (e.g., Focus Ring, Discipline Score).
/// Reads percentage (0–100) and animates the arc fill. Label is optional.
struct CircleProgressRing: View {
    // MARK: - Properties

    /// Progress value from 0 to 100.
    let percentage: Double
    /// Diameter of the ring in points.
    let size: CGFloat
    /// Width of the ring stroke.
    let strokeWidth: CGFloat
    /// Optional label shown above the percentage text (e.g., "SCORE").
    let label: String?
    /// Duration of the fill animation in seconds.
    let animationDuration: Double

    // MARK: - Computed

    private var trimEnd: Double {
        percentage / 100
    }

    // MARK: - Body

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: strokeWidth)

            Circle()
                .trim(from: 0, to: trimEnd)
                .stroke(Color("DarkBlueAccent"), style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: animationDuration), value: percentage)
            

            VStack(spacing: DesignTokens.Spacing.xs) {
                if let label {
                    Text(label)
                        .font(.inter(.medium, size: DesignTokens.Font.titleSmall))
                        .foregroundColor(.gray)
                }
                Text("\(Int(percentage))%")
                    .font(.inter(.bold, size: 32))
                    .foregroundColor(Color("DefaultText"))
            }
        }
        .frame(width: size, height: size)
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()
        CircleProgressRing(
            percentage: 75,
            size: 200,
            strokeWidth: 16,
            label: "SCORE",
            animationDuration: 0.6
        )
    }
}
