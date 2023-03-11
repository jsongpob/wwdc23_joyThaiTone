//
//  CardView.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 5/3/2566 BE.
//

import SwiftUI

struct CardView: View {
    
    var titlecard: String
    var subtitlecard: String
    var iconcard: String
    var cardimage: String
    var shadowcard: Int
    
    var body: some View {
        VStack {
            Image(cardimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 320, height: 300, alignment: .center)
                .clipped()
                .overlay(Image(systemName: iconcard).font(.system(size: 72)).foregroundColor(.white).shadow(radius: 10))
            Text(subtitlecard)
                .font(.system(size: 16 ,weight: .medium))
                .kerning(2)
                .textCase(.uppercase)
                .frame(maxWidth: 270, maxHeight: 30, alignment: .bottomLeading)
                .foregroundColor(.black)
            Text(titlecard)
                .font(.system(size: 27 ,weight: .bold))
                .frame(maxWidth: 270, maxHeight: 30, alignment: .leading)
                .foregroundColor(.black)
                .padding(.bottom, 25)
        }
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: CGFloat(shadowcard))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(titlecard: "What's ThaiTone?", subtitlecard: "Learn", iconcard: "play.fill", cardimage: "Art-1", shadowcard: 0)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
