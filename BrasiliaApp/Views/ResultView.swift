import SwiftUI

struct ResultView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 16) {
            
            Image(systemName: "checkmark.seal.fill")
                .renderingMode(.original)
                .resizable()
                .frame(width: 124, height: 124)
                .foregroundStyle(.green)
            
            Text("Fim da Rodada!")
                .font(.title)
                .bold()
            
            VStack {
                Text("Mandou bem!")
                    .bold()
                    .foregroundStyle(.white)
                    .padding([.top], 8)
                
                Image(systemName: "hand.thumbsup.fill")
                    .resizable()
                    .foregroundStyle(.white)
                    .frame(width: 40, height: 40)
                    .padding([.bottom], 8)
            }
            .frame(maxWidth: .infinity)
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 16))

            HStack {
                Text("Sua pontuação")
                    .bold()
                    .foregroundStyle(.white)
                    .padding([.vertical, .horizontal], 24)
                
                Spacer()
                
                Text("43 pontos")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .bold()
                    .padding([.trailing], 24)
            }
            .frame(maxWidth: .infinity)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack {
                Image(systemName: "arrowshape.turn.up.backward.fill")
                    .resizable()
                    .foregroundStyle(.white)
                    .frame(width: 40, height: 40)
                
                Text("Reiniciar")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .bold()
            }
            .frame(width: 124, height: 124)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
            
        }
        .padding([.horizontal], 16)
    }
}
