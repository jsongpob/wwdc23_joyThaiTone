//
//  EndView.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 6/3/2566 BE.
//

import SwiftUI

struct EndView: View {
    @EnvironmentObject var gameLevelData: GameLevelData
    
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Text("Reset all game progress")
                        .padding(8)
                        .background(.red)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .onTapGesture(count: 3) {
                            gameLevelData.gamereset()
                            gameLevelData.GameLevel = 1
                    }
                    Text("Tap 3 times to confirm reset")
                        .foregroundColor(.gray)
                }
                .padding(10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(10)
            
            VStack(spacing: 30) {
                Text("Congratulation!")
                    .font(.system(size: 38, weight: .bold))
                Text("🌟")
                    .font(.system(size: 300))
                Text("Thank you for playing ThaiTone")
                    .font(.system(size: 32, weight: .medium))
                Text("Thank you for playing and learning with ThaiTone, I hope you like it and enjoy it. It was the beginning and development of my learning. And I hope it will be an inspiration to many more people. who like to play and learn together, thank you!")
                    .frame(width: 650)
                    .multilineTextAlignment(.center)
            }
        }
        
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView()
            .environmentObject(GameLevelData())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
