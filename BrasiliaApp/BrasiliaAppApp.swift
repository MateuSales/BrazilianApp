import SwiftUI

@main
struct BrasiliaAppApp: App {
    @StateObject var game = GameDataSource()
    
    var body: some Scene {
        WindowGroup {
            InitialView()
                .environment(game)
        }
    }
}
