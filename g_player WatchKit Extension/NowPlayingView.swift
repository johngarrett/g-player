import SwiftUI
import MediaPlayer

struct NowPlayingView: View {
    @ObservedObject var currentSong: PlayableContent
    var timeRemaining: String
    @State var songProgression: Float = 0.0
    
    init(_ song: PlayableContent) {
        self.currentSong = song
        self.timeRemaining = {
            let diff = song.length - song.currentPosition
            let hours = diff / 60
            let mins = diff - (hours * 60)
            return "- \(hours):\(mins)"
        }()
    }
    
    var body: some View {
        return VStack {
            Text(currentSong.title)
                .style(for: .Title)
            Text(currentSong.creator)
                .style(for: .Subtitle)
            HStack {
                ProgressBar(value: $songProgression).frame(height: 4)
                Text(timeRemaining)
                    .font(.gBody)
                    .foregroundColor(.gray)
            }.padding(.vertical, 5)
            Spacer()
            Button(action: {
                print("toggle")
                self.songProgression += 0.10
            }) {
                Rectangle().fill(Color.gray)
                    .frame(width: 60.0, height: 20.0, alignment: .center)
                    .cornerRadius(6.5)
            }.mask(Rectangle().cornerRadius(6.5))
            Spacer()
        }.padding(.horizontal, 10)
    }
}

struct NowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingView(
            PlayableContent("A computer from scratch with Jonthan morris", creator: "Cyberdeck Users Weekly", length: 390, currentPosition: 300)
        )
    }
}
