class Score {
    private var total: Int = 0
    
    func increment() {
        total += 10
    }
    
    func decrement() {
        total -= 10
    }
    
    func reset() {
        total = 0
    }
}
