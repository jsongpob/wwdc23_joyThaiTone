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
    
    var MinW: CGFloat
    var IdW: CGFloat
    var MaxW: CGFloat
    var MinH: CGFloat
    var IdH: CGFloat
    var MaxH: CGFloat
    
    var body: some View {
        VStack {
            Image(Wcardimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: MinW, idealWidth: IdW, maxWidth: MaxW, minHeight: MinH, idealHeight: IdH, maxHeight: MaxH)
                .clipped()
                .overlay(Text(titleWcard).font(.system(size: 38, weight: .bold)).foregroundColor(.white).frame(maxWidth: MaxW, maxHeight: MaxH, alignment: .bottomLeading).padding(30))
        }
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: CGFloat(shadowWcard))
    }
}

struct WideCardView_Previews: PreviewProvider {
    static var previews: some View {
        WideCardView(titleWcard: "What's ThaiTone", iconWcard: "", Wcardimage: "art-1", shadowWcard: 16, MinW: 100, IdW: 100, MaxW: 100, MinH: 100, IdH: 100, MaxH: 100)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
