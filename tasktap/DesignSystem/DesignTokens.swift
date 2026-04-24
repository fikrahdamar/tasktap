import SwiftUI

// MARK: - Design Tokens

/// Centralized design system constants for TaskTap.
/// Organize all spacing, sizing, colors, and styling values for consistency.
/// Usage: `DesignTokens.Spacing.md`, `DesignTokens.Radius.button`, etc.
enum DesignTokens {
    // MARK: - Spacing
    /// Padding and spacing values in points.
    enum Spacing {
        static let xs: CGFloat = 4        // icon spacing in buttons
        static let sm: CGFloat = 8        // minimal gap
        static let md: CGFloat = 14       // default gap
        static let lg: CGFloat = 16       // standard padding
        static let xl: CGFloat = 20       // card padding vertical
        static let xxl: CGFloat = 25      // card padding horizontal
        static let section: CGFloat = 30  // section spacing
    }

    // MARK: - Corner Radius
    /// Corner radius values for rounded elements.
    enum Radius {
        static let pill: CGFloat = 50       // fully rounded (status dots)
        static let sm: CGFloat = 3          // accent bars
        static let md: CGFloat = 15         // main card
        static let button: CGFloat = 16     // action buttons
        static let card: CGFloat = 18       // identity summary card
        static let cardSm: CGFloat = 20     // small cards
        static let tabBar: CGFloat = 25     // tab bar pill
    }

    // MARK: - Shadow
    /// Drop shadow parameters used across the app.
    enum Shadow {
        static let color: Color = .black.opacity(0.1)
        static let radius: CGFloat = 10
        static let x: CGFloat = 0
        static let y: CGFloat = 5
    }

    // MARK: - Button
    /// Reusable button sizing and spacing constants.
    enum Button {
        static let height: CGFloat = 56
        static let iconSize: CGFloat = 18
        static let fontSize: CGFloat = 16
        static let borderWidth: CGFloat = 2
        static let iconSpacing: CGFloat = 8
    }

    // MARK: - Accent Bar
    /// Left accent bar styling (used in cards).
    enum AccentBar {
        static let width: CGFloat = 6
        static let cornerRadius: CGFloat = 3
    }

    // MARK: - Card
    /// Card sizing and padding values.
    enum Card {
        static let mainCardWidth: CGFloat = 0.90
        static let smallCardWidth: CGFloat = 0.55
        static let identityCardWidth: CGFloat = 0.45

        static let mainCardHPadding: CGFloat = 25
        static let mainCardVPadding: CGFloat = 20

        static let smallCardHPadding: CGFloat = 16
        static let smallCardVPadding: CGFloat = 20

        static let identityCardPadding: CGFloat = 20
    }

    // MARK: - Tab Bar
    /// Tab bar and navigation sizing (geometric percentages).
    enum TabBar {
        static let height: CGFloat = 120
        static let bottomPadding: CGFloat = 30
        static let tabSizePercent: CGFloat = 0.18
        static let plusSizePercent: CGFloat = 0.15
        static let spacingPercent: CGFloat = 0.04
    }

    // MARK: - Typography
    /// Font size constants for different text roles.
    enum Font {
        static let categoryLabel: CGFloat = 12  // category/label text
        static let titleLarge: CGFloat = 18     // main headings
        static let titleSmall: CGFloat = 14     // descriptions
        static let metadata: CGFloat = 12       // metadata/secondary text
        static let icon: CGFloat = 24
    }
    
    // MARK: - Rounded Icon Bg
    /// Circle Icon background sizing
    enum CricleIcon {
        static let sm: CGFloat = 24
        static let md: CGFloat = 48
        static let lg: CGFloat = 56
        static let xl: CGFloat = 64
    }
}
