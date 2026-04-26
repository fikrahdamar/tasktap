import SwiftUI

struct CircleProgressRing: View {
    let percentage: Double
    let size: CGFloat
    let strokeWidth: CGFloat
    let label: String?
    let animationDuration: Double

    var progressAngle: Double {
        percentage * 3.6
    }

    var body: some View {
        ZStack {
            // Background circle (unfilled portion)
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: strokeWidth)

            // Filled arc (progress)
            Circle()
                .trim(from: 0, to: progressAngle / 360)
                .stroke(Color(red: 0.251, green: 0.486, blue: 0.847), lineWidth: strokeWidth) // DarkBlueAccent
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: animationDuration), value: percentage)

            // Text display
            VStack(spacing: 4) {
                if let label = label {
                    Text(label)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.gray)
                }
                Text("\(Int(percentage))%")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)
            }
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    CircleProgressRing(
        percentage: 75,
        size: 200,
        strokeWidth: 16,
        label: "SCORE",
        animationDuration: 0.6
    )
}
