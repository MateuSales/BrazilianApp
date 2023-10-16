//
//  InitialView.swift
//  BrasiliaApp
//
//  Created by user on 15/10/23.
//

import SwiftUI

struct InitialView: View {
    @State private var isPresentedContentView = false
    
    var body: some View {
        VStack(spacing: 24) {
            Image("logo")
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Text("Começar")
                .bold()
                .foregroundStyle(.white)
                .padding([.vertical, .horizontal], 24)
                .frame(maxWidth: .infinity)
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .onTapGesture {
                    isPresentedContentView = true
                }
        }
        .padding([.horizontal], 24)
        .fullScreenCover(isPresented: $isPresentedContentView) {
            ContentView()
        }
    }
}
