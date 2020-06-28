import SwiftUI
import AVFoundation

struct NowPlayingView: View {
    let currentSong: PlayableContent
    let timeRemaining: String
    
    init(_ song: PlayableContent) {
        self.currentSong = song
        self.timeRemaining = {
            let diff = song.length - song.currentPosition
            let hours = diff / 60
            let mins = diff - (hours * 60)
            return "- \(hours):\(mins)"
        }()
        
        let session = AVAudioSession.sharedInstance()

        do {
            try session.setCategory(AVAudioSession.Category.playback,
                                    mode: .default,
                                    policy: .default,
                                    options: [])
        } catch let error {
            fatalError("*** Unable to set up the audio session: \(error.localizedDescription) ***")
        }
        
    }
    
    var body: some View {
        return VStack {
            Text(currentSong.title)
                .style(for: .Title)
            Spacer()
            Text(currentSong.creator)
                .style(for: .Subtitle)
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
                    .font(.caption)
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
        NowPlayingView(
            PlayableContent("A computer from scratch with Jonthan morris", creator: "Cyberdeck Users Weekly", length: 390, currentPosition: 300)
        )
    }
}
