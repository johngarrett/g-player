import SwiftUI

struct NowPlayingView: View {
    let currentSong = PlayableContent("A computer from scratch with Jonthan morris", creator: "Cyberdeck Users Weekly", length: 390)
    
    var body: some View {
         let timeRemaining: String = {
            let diff = self.currentSong.length - currentSong.currentPosition
            let hours = diff / 60
            let mins = diff - (hours * 60)
            return "- \(hours):\(mins)"
        }()
        
        return VStack {
            Text(currentSong.title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .lineLimit(2)
            Spacer()
            Text(currentSong.creator)
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(.gray)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            HStack {
                ZStack {
                    Rectangle().fill(Color.green)
                        .frame(height: 4)
                        .cornerRadius(8.0)
                        .zIndex(1.0)
                        .offset(x: -20)
                    Rectangle().fill(Color.gray)
                        .frame(height: 4)
                        .cornerRadius(8.0)
                        .zIndex(0.0)
                }
                Text(timeRemaining)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 5)
            Button(action: {
                print("toggle")
            }) {
                Rectangle().fill(Color.gray)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
        }
    }
}

struct NowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingView()
    }
}
