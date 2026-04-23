import SwiftUI

enum DesignTokens {
    enum Spacing {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 14
        static let lg: CGFloat = 16
        static let xl: CGFloat = 20
        static let xxl: CGFloat = 25
        static let section: CGFloat = 30
    }

    enum Radius {
        static let pill: CGFloat = 50       // status dots
        static let sm: CGFloat = 3          // accent bars
        static let md: CGFloat = 15         // MainCard
        static let button: CGFloat = 16     // ActionButton
        static let card: CGFloat = 18       // IdentitySummaryCard
        static let cardSm: CGFloat = 20     // SmallCard
        static let tabBar: CGFloat = 25     // CustomTabBar
    }

    enum Shadow {
        static let color: Color = .black.opacity(0.1)
        static let radius: CGFloat = 10
        static let x: CGFloat = 0
        static let y: CGFloat = 5
    }

    enum Button {
        static let height: CGFloat = 56
        static let iconSize: CGFloat = 18
        static let fontSize: CGFloat = 16
        static let borderWidth: CGFloat = 2
        static let iconSpacing: CGFloat = 8
    }

    enum AccentBar {
        static let width: CGFloat = 6
        static let cornerRadius: CGFloat = 3
    }

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

    enum TabBar {
        static let height: CGFloat = 120
        static let bottomPadding: CGFloat = 30
        static let tabSizePercent: CGFloat = 0.18
        static let plusSizePercent: CGFloat = 0.15
        static let spacingPercent: CGFloat = 0.04
    }

    enum Font {
        // Category/Label
        static let categoryLabel: CGFloat = 12

        // Title sizes
        static let titleLarge: CGFloat = 18
        static let titleSmall: CGFloat = 14

        // Metadata/Secondary
        static let metadata: CGFloat = 12
    }
}
