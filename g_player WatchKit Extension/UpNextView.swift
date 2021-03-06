import SwiftUI

struct UpNextView: View {
    var body: some View {
        List {
            UpNextCard("A computer from scratch with Jonthan morris", subtext: "Yesterday - 33 minutes left", active: true)
            
            Section(header: UpNextCard.Header(title: "Up Next")) {
                ForEach((0...5).reversed(), id: \.self) {_ in
                    UpNextCard("A computer from scratch with Jonathan morris", subtext: "Yesterday - 33 minutes left")
                }
            }
        }
        .listStyle(CarouselListStyle())
    }
}

struct UpNextCard: View {
    struct Header: View {
        let title:String
        var body: some View {
            Text(title)
                .listRowBackground(Color.clear)
                .frame(height: 10)
        }
    }
    let spotfiyGreen = Color.green
    let ForegroundGray = Color.gray
    let title: String
    let subtext: String
    let active: Bool
    init(_ title: String, subtext: String, active: Bool = false) {
        self.title = title
        self.subtext = subtext
        self.active = active
    }
    var body: some View {
        VStack {
            Text(title)
                .style(for: .Title, with: active ? spotfiyGreen : .white)
                .padding(.horizontal, 5)
            Spacer()
            Text(subtext)
                .style(for: .Subtitle)
        }
        .padding(.vertical, 15)
        .allowsTightening(true)
        .cornerRadius(16)
        .listRowBackground(
            RoundedRectangle(cornerRadius: 25).fill(ForegroundGray).brightness(-0.4)
        )
    }
}

struct UpNextView_Previews: PreviewProvider {
    static var previews: some View {
        UpNextView()
    }
}
