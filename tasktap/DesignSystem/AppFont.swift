import SwiftUI

enum InterWeight: String {
    case regular  = "Inter-Regular"
    case medium   = "Inter-Medium"
    case bold     = "Inter-Bold"
    case black    = "Inter-Black"
}

extension Font {
    static func inter(_ weight: InterWeight, size: CGFloat) -> Font {
        Font.custom(weight.rawValue, size: size)
    }
}
