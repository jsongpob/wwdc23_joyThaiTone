//
//  WideCardView.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 6/3/2566 BE.
//

import SwiftUI

struct WideCardView: View {
    
    var titleWcard: String
    var iconWcard: String
    var Wcardimage: String
    var shadowWcard: Int
    
    var Xcard: Int
    var Ycard: Int
    
    var body: some View {
        VStack {
            Image(Wcardimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: CGFloat(Xcard), height: CGFloat(Ycard), alignment: .center)
                .clipped()
                .overlay(Text(titleWcard).font(.system(size: 38, weight: .bold)).foregroundColor(.white).frame(width: CGFloat(Xcard-40), height: CGFloat(Ycard-40), alignment: .bottomLeading))
        }
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: CGFloat(shadowWcard))
    }
}

struct WideCardView_Previews: PreviewProvider {
    static var previews: some View {
        WideCardView(titleWcard: "What's ThaiTone", iconWcard: "", Wcardimage: "Art-1", shadowWcard: 32, Xcard: 400, Ycard: 300)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
