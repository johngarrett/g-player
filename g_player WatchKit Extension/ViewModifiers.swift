import SwiftUI

struct TextModifier: ViewModifier {
    let font: Font
    let color: Color
    let minScaleFactor: CGFloat
    let lineLimit: Int
    func body(content: Content) -> some View {
        content
            .font(self.font)
            .foregroundColor(self.color)
            .minimumScaleFactor(self.minScaleFactor)
            .lineLimit(lineLimit)
    }
}
enum TextStyle {
    case Title
    case Subtitle
}
extension View {
    func style(for textstyle: TextStyle, with color: Color? = nil) -> some View {
        switch textstyle {
        case .Title:
            return self.modifier(
                TextModifier(font: .gTitle, color: color ?? .white, minScaleFactor: 0.8, lineLimit: 2)
            )
        case .Subtitle:
            return self.modifier(
                TextModifier(font: .gSubTitle, color: color ?? .gray, minScaleFactor: 0.5, lineLimit: 1)
            )
        }
    }
}
