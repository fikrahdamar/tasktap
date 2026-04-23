import SwiftUI

// MARK: - Inter Font Weight Enum

/// Available font weights for the Inter typeface.
/// Use with `Font.inter(_:size:)` for consistent custom font usage.
enum InterWeight: String {
    /// Regular weight (400)
    case regular  = "Inter-Regular"
    /// Medium weight (500)
    case medium   = "Inter-Medium"
    /// Bold weight (700)
    case bold     = "Inter-Bold"
    /// Black weight (900)
    case black    = "Inter-Black"
}

// MARK: - Font Extension

extension Font {
    /// Creates a custom Inter font with the specified weight and size.
    /// - Parameters:
    ///   - weight: The font weight (regular, medium, bold, or black)
    ///   - size: The font size in points
    /// - Returns: A Font with the Inter typeface applied
    /// - Example: `.font(.inter(.bold, size: 18))`
    static func inter(_ weight: InterWeight, size: CGFloat) -> Font {
        Font.custom(weight.rawValue, size: size)
    }
}
