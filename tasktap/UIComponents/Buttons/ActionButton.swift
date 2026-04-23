import SwiftUI

// MARK: - Button Styles

/// Visual style variants for ActionButton.
enum ActionButtonStyle {
    /// Black background with white text (primary action)
    case primary
    /// Light grey background with dark text (secondary action)
    case secondary
    /// Outlined style with colored border and text (destructive/tertiary action)
    case tertiary
}

// MARK: - Icon Position

/// Icon placement relative to button text.
enum IconPosition {
    /// Icon appears before text
    case left
    /// Icon appears after text
    case right
    /// No icon displayed
    case none
}

// MARK: - Action Button

/// Reusable button component with flexible styling, sizing, and icon support.
/// Supports three styles (primary, secondary, tertiary) with optional SF Symbol icons.
/// Usage: `ActionButton(title: "Save", action: { ... }, style: .primary, iconName: "checkmark")`
struct ActionButton: View {
    /// Button label text
    let title: String
    /// Closure executed when button is tapped
    let action: () -> Void
    /// Visual style (primary, secondary, or tertiary)
    let style: ActionButtonStyle
    /// SF Symbol name for optional icon
    let iconName: String?
    /// Icon placement (left, right, or none)
    let iconPosition: IconPosition
    /// If true, button expands to fill available width
    let fullWidth: Bool
    /// Custom text color (overrides style default)
    let textColor: Color?
    /// Custom background color (overrides style default)
    let backgroundColor: Color?
    /// Custom border color (overrides style default)
    let borderColor: Color?
    /// Button height in points
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
