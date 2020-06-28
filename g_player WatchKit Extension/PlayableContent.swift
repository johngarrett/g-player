import Foundation

class PlayableContent: ObservableObject {
    let active: Bool
    let title: String
    let creator: String
    let image: String?
    let length: Int
    @Published var currentPosition: Int

    init(_ title: String, creator: String, length: Int, currentPosition: Int=0) {
        self.active = false
        self.title = title
        self.creator = creator
        self.image = nil
        self.length = length
        self.currentPosition = currentPosition
    }
    
    func increasePosition(by value: Int) {
        self.currentPosition += value
    }
}
