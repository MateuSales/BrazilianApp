import Combine
import Foundation

class GameDataSource: ObservableObject, Observable {
    @Published private var verbs: [String] = []
    @Published var timeRemaining = 60
    private var score = 0
    private var currentVerb = ""
    
    init() {
        verbs = Bundle.main.decode(Response.self, from: "verbs.json").verbs
        verbs.shuffle()
        currentVerb = verbs[0]
    }
    
    func reset() {
        verbs = Bundle.main.decode(Response.self, from: "verbs.json").verbs
        verbs.shuffle()
        currentVerb = verbs[0]
        score = 0
        timeRemaining = 60
    }
    
    func getVerb() -> String {
        currentVerb
    }
    
    func getScore() -> Int {
        score
    }
    
    func didTapButton(_ type: ButtonType) {
        switch type {
            case .up:
                increment()
            case .down:
                decrement()
        }
        
        verbs.removeAll { $0 == currentVerb }
        if let word = verbs.randomElement() {
            currentVerb = word
        }
    }
    
    // MARK: - Private Methods
    
    private func increment() {
        score += 10
    }
    
    private func decrement() {
        score -= 10
    }
}
