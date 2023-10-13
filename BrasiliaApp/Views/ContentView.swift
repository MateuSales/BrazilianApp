import SwiftUI

struct ContentView: View {
    @State var isPresentedResultView = true
    @State var images = ["lion"]
    
    private var score = Score()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("MíMiCa")
                .font(.title)
                .bold()
            
            Text("Use gestão, expressões e mímicas para reproduzir a imagem abaixo!")
            
            Image("lion")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack {
                Text("Tempo restante")
                    .bold()
                    .foregroundStyle(.white)
                
                Text("01:21")
                    .font(.title)
                    .foregroundStyle(.white)
                    .bold()
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
                    score.decrement()
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
                    score.increment()
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            score.reset()
        }
    }
}
