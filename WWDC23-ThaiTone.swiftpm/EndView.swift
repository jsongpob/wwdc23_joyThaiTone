//
//  EndView.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 6/3/2566 BE.
//

import SwiftUI

struct EndView: View {
    var body: some View {
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
            Button(action: {}) {
                Text("Reset")
            }
        }
        
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
