import SwiftUI
import Foundation

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                
                Rectangle().frame(
                    width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width),
                    height: geometry.size.height
                )
                    .foregroundColor(.green)
                    .animation(.linear)
            }.cornerRadius(16.0)
        }
    }
}
