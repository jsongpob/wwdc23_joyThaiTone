//
//  AboutView.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 5/3/2566 BE.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            //TITLE
            Text("About this app")
                .font(.subheadline)
            Text("joyThaiTone")
                .font(.system(size: 89, weight: .medium))
            //CONTENT
            VStack {
                VStack(spacing: 20) {
                    CallCardView(callicon: "swift", calltext: "This app was created for the Apple WWDC23 Swift Student Challenge submission by Songpob Hamthanan, and this is my first time submission!"
                    )
                    CallCardView(callicon: "person.fill", calltext: "I'm currently studying in Thailand in relation to user interface and user experience design. Including programming too! I really love learning these things because they can create something new and different. where I can put my own personality into it as well."
                    )
                    Resources()
                    
                    Text("For the best experience, I highly recommend playing on iPad Pro (11-inch) models in landscape and light mode.")
                        .foregroundColor(.gray)

                }
            }
            .padding(.horizontal, 60)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

struct CallCardView: View {
    
    var callicon: String
    var calltext: String
    
    var body: some View {
        HStack {
            Image(systemName: callicon)
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
                .font(.system(size: 48))
                .padding(.trailing, 20)
            Text(calltext)
                .font(.body)
                .multilineTextAlignment(.leading)
        }
        .frame(width: 700, alignment: .leading)
    }
}

struct Resources: View {
    @State var resourcesDetails = false
    
    var body: some View {
        HStack {
            Image(systemName: "book.fill")
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
                .font(.system(size: 48))
                .padding(.trailing, 20)
            VStack(alignment: .leading) {
                Text("The resources and inspiration I have compiled from these references.")
                Button {
                    resourcesDetails.toggle()
                } label: {
                    Text("Click Here")
                }
                .sheet(isPresented: $resourcesDetails) {
                    Spacer()
                    VStack {
                        Image(systemName: "book.fill")
                            .foregroundColor(.black)
                            .frame(width: 50, height: 50)
                            .font(.system(size: 48))
                        Text("Resources")
                            .font(.system(size: 26, weight: .medium))
//                        Spacer()
                        VStack(spacing: 20) {
                            Text("Thanks for the information, pictures and inspiration.")
                            Text("[ThaiTone](https://www.facebook.com/thaitonecolor)")
                            Text("[Pairoj Pittayamatee](https://www.facebook.com/PairojPittayamatee)")
                            Text("[Thaitone – Thai tone color Identity of Thai tone...know, not out of trend](https://www.baanlaesuan.com/58106/design/lifestyle/thaitone-2)")
                            Text("[What is Ten Essential Traditional Craftsmenship](https://www.silpa-mag.com/art/article_96093)")
                            Text("[Dr. Pairoj Pitayamethee, the proclamation of Thai independence](https://www.salika.co/2019/11/29/thaitone-color-by-pairoj-pittayamatee/)")
                            Text("[Krayarong Thai-tone powder color](https://www.sarakadeelite.com/brand-story/krayarong-tempera/)")
                            Text("[Photo Dharma from Sadao, Thailand - 075 Ramakien Murals](https://commons.wikimedia.org/w/index.php?curid=50835477)")
                            Text("[Color Blind Vision Simulator](https://pilestone.com/pages/color-blindness-simulator-1)")
                            Text("Sounds: [Mixkit](https://mixkit.co/free-sound-effects/)")
                        }
                        .padding([.top, .bottom], 50)
                        Button {
                            resourcesDetails.toggle()
                        } label: {
                            Text("Dismiss")
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding(80)
                    Spacer()
                }
            }
        }
        .frame(width: 700, alignment: .leading)
    }
}
