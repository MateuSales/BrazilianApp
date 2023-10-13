import SwiftUI

struct ContentView: View {
    @State private var isPresentedResultView = false
    @EnvironmentObject var game: GameDataSource
//    @State /*var timeRemaining = 3*/
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("MíMiCa")
                .font(.title)
                .bold()
            
            Text("Faça uma mímica que represente a palavra abaixo para que as pessoas tentem acertar!")
            
            VStack {
                Text(game.getVerb())
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                    .textCase(.uppercase)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack {
                Text("Tempo restante em segundos")
                    .bold()
                    .foregroundStyle(.white)
                
                
                Text("\(game.timeRemaining)")
                    .font(.title)
                    .foregroundStyle(.white)
                    .bold()
                    .onReceive(timer) { _ in
                        if game.timeRemaining > 0 {
                            game.timeRemaining -= 1
                        }
                        
                        if game.timeRemaining == 0 {
                            isPresentedResultView = true
                        }
                    }
            }
            .frame(maxWidth: .infinity, minHeight: 77)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            HStack {
                Spacer()
                
                VStack {
                    Image(systemName: "hand.thumbsdown.fill")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 76, height: 76)
                }
                .frame(width: 124, height: 124)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .onTapGesture {
                    game.didTapButton(.down)
                }
                
                VStack {
                    Image(systemName: "hand.thumbsup.fill")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 76, height: 76)
                }
                .frame(width: 124, height: 124)
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .onTapGesture {
                    game.didTapButton(.up)
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .padding()
        .fullScreenCover(isPresented: $isPresentedResultView) {
            ResultView()
        }
        .onAppear {
            print("Aqui")
        }
    }
}
