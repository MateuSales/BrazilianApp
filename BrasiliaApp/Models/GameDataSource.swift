import Combine
import Foundation

class GameDataSource: ObservableObject, Observable {
    @Published private var verbs: [String] = []
    @Published var timeRemaining = 90
    private var score = 0
    
    init() {
        verbs = Bundle.main.decode(Response.self, from: "verbs.json").verbs
    }
    
    func reset() {
        verbs = Bundle.main.decode(Response.self, from: "verbs.json").verbs
        score = 0
        timeRemaining = 90
    }
    
    func getVerb() -> String {
        if let word = verbs.first {
            return word
        }
        
        fatalError("O array ficou vazio ❌")
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
        
        verbs.removeFirst()
        verbs.shuffle()
    }
    
    // MARK: - Private Methods
    
    private func increment() {
        score += 10
    }
    
    private func decrement() {
        score -= 10
    }
}
