import SwiftUI

// MARK: - Enums

enum ActionButtonStyle {
    case primary      // Black background, white text
    case secondary    // Light grey background, dark text
    case tertiary     // Outlined, colored text & border
}

enum IconPosition {
    case left
    case right
    case none
}

struct ActionButton: View {
    let title: String
    let action: () -> Void
    let style: ActionButtonStyle
    let iconName: String?
    let iconPosition: IconPosition
    let fullWidth: Bool
    let textColor: Color?
    let backgroundColor: Color?
    let borderColor: Color?
    let height: CGFloat

    init(
        title: String,
        action: @escaping () -> Void,
        style: ActionButtonStyle = .primary,
        iconName: String? = nil,
        iconPosition: IconPosition = .left,
        fullWidth: Bool = true,
        textColor: Color? = nil,
        backgroundColor: Color? = nil,
        borderColor: Color? = nil,
        height: CGFloat = 56
    ) {
        self.title = title
        self.action = action
        self.style = style
        self.iconName = iconName
        self.iconPosition = iconPosition
        self.fullWidth = fullWidth
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.height = height
    }

    private var computedTextColor: Color {
        if let textColor = textColor { return textColor }
        switch style {
        case .primary: return .white
        case .secondary: return .black
        case .tertiary: return .red
        }
    }

    private var computedBackgroundColor: Color {
        if let backgroundColor = backgroundColor { return backgroundColor }
        switch style {
        case .primary: return .black
        case .secondary: return Color(.sRGBLinear, red: 0.92, green: 0.92, blue: 0.92, opacity: 1.0)
        case .tertiary: return Color(.sRGBLinear, red: 0.98, green: 0.94, blue: 0.94, opacity: 1.0)
        }
    }

    private var computedBorderColor: Color {
        if let borderColor = borderColor { return borderColor }
        switch style {
        case .primary: return .clear
        case .secondary: return .clear
        case .tertiary: return .red
        }
    }

    private var hasBorder: Bool {
        style == .tertiary
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: DesignTokens.Button.iconSpacing) {
                if iconPosition == .left, let iconName = iconName {
                    Image(systemName: iconName)
                        .font(.system(size: DesignTokens.Button.iconSize, weight: .medium))
                }

                Text(title)
                    .font(.inter(.medium, size: DesignTokens.Button.fontSize))

                if iconPosition == .right, let iconName = iconName {
                    Image(systemName: iconName)
                        .font(.system(size: DesignTokens.Button.iconSize, weight: .medium))
                }
            }
            .foregroundColor(computedTextColor)
            .frame(maxWidth: fullWidth ? .infinity : nil)
            .frame(height: height)
            .background(computedBackgroundColor)
            .cornerRadius(DesignTokens.Radius.button)
            .overlay(
                RoundedRectangle(cornerRadius: DesignTokens.Radius.button)
                    .stroke(computedBorderColor, lineWidth: hasBorder ? DesignTokens.Button.borderWidth : 0)
            )
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        ActionButton(
            title: "Mark as Done",
            action: {},
            style: .primary,
            iconName: "checkmark",
            iconPosition: .left
        )

        ActionButton(
            title: "Postpone",
            action: {},
            style: .secondary,
            iconName: "clock",
            iconPosition: .left
        )

        ActionButton(
            title: "Delete",
            action: {},
            style: .tertiary,
            iconName: "trash",
            iconPosition: .left
        )

        ActionButton(
            title: "Register Domain",
            action: {},
            style: .primary,
            iconName: "arrow.right",
            iconPosition: .right
        )
    }
    .padding()
    .background(Color.gray.opacity(0.1))
}

// Preview builds fine since DesignTokens is visible in preview target
