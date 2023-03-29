//
//  LearningInspiration.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 28/3/2566 BE.
//

import SwiftUI

//Story1
struct LearningInspiration: View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                
                //SECTION TITLE
                HStack {
                    Text("What is the \ninspiration for \nThai-Tone colors?")
                        .font(.system(size: 38, weight: .bold, design: .default))
                        .lineSpacing(8)
                    Image("ramakien")
                        .interpolation(.low)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 600, maxHeight: 600)
                        .clipped()
                        .padding(40)
                    
                    VStack {
                        Image(systemName: "quote.bubble.fill")
                            .font(.system(size: 72, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 10)
                        Text("Actually, Thai-Tone color was created in the olden days. It can be seen in Thai paintings that are colorful and beautiful. Even after hundreds of years, the colors of the paintings on the walls are still beautiful without deteriorating.")
                            .font(.title)
//                            .border(.red)
                    }
                    .frame(maxWidth: 800, maxHeight: 350, alignment: .leading)
                    .padding(.horizontal, 60)
                    
                    VStack {
                        Image("temple1")
                            .interpolation(.low)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: 500, maxHeight: 580)
                            .clipped()
                            .padding(.horizontal, 100)
                        Text("Shot on iPhone by myself")
                    }
                    
                    Text("Thai-Tone color originates from stories recorded in literature, poetry, Thai culture, and beliefs in the old days, including the wisdom of Thai Craftsmen who select natural colors to extract, sort colors and carefully mix them to get the color. that is charming and unique.")
                        .font(.title2)
                        .frame(maxWidth: 700, maxHeight: 300, alignment: .leading)
                        .padding(.horizontal, 60)
                    
                    VStack {
                        Image("temple2")
                            .interpolation(.low)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: 700, maxHeight: 600)
                            .clipped()
                            .padding(.horizontal, 100)
                        Text("Shot on iPhone by myself")
                    }
                }
                
                //SECTION BENJARONG COLORS
                HStack {
                    Text("In the past, the group of Thai colors that appeared in the painting consisted of up to five primary colors. 'Benjarong Colors' consists of black, white, red, yellow, and indigo. Each color can be mixed to create 10 more beautiful colors that we can see in Thai art, such as paintings. wall art work by Ten Essential Traditional Craftsmenship")
                        .font(.title2)
                        .frame(maxWidth: 700, maxHeight: 300, alignment: .leading)
                        .padding(.horizontal, 60)
                    
                    HStack(spacing: 30) {
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(width: 160, height: 160, alignment: .center)
                        Rectangle()
                            .foregroundColor(Color.benjarongC1)
                            .frame(width: 160, height: 160, alignment: .center)
                        Rectangle()
                            .foregroundColor(Color.benjarongC2)
                            .frame(width: 160, height: 160, alignment: .center)
                        Rectangle()
                            .foregroundColor(Color.benjarongC3)
                            .frame(width: 160, height: 160, alignment: .center)
                        Rectangle()
                            .foregroundColor(Color.benjarongC4)
                            .frame(width: 160, height: 160, alignment: .center)
                    }
                }
                
                //SECTION TEN CRAFTMANSHIP
                HStack {
                    VStack {
                        Image(systemName: "questionmark.circle.fill")
                            .font(.system(size: 72, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 10)
                        Text("Ten Essential Traditional Craftsmenship is an organization that combines fine craftsmen to work for the king or government officials. Originally, these jobs were scattered among different departments, both military and civilian. Currently, it is a bureau-level agency in the Department of Fine Arts, Ministry of Culture, with a total of 10 craftsmen:")
                            .font(.title2)

                        Text("Drawing and Painting / Carving / Engraving / Turning / Casting /Molding and Sculpting / Model Building / Lacquering / Metel Beating / Plastering")
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 60)
                    }
                    .frame(maxWidth: 700, maxHeight: 1000, alignment: .leading)
                    .padding(.leading, 100)
                    .padding(.horizontal, 40)
                    
                    Image("ten_essential")
                        .interpolation(.low)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 300, maxHeight: 600)
                        .clipped()
                        .padding(.horizontal, 100)
                }
                
                //SECTION EXPLORE BENJARONG
                HStack {
                    Text("EXPLORE \nBENJARONG")
                        .font(.system(size: 92, weight: .bold, design: .default))
                        .padding(.horizontal, 40)
                    
                    HStack {
                        VStack {
                            Image("benjarong1")
                                .interpolation(.low)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: 1000, maxHeight: 200)
                                .clipped()
//                                .padding(.horizontal, 200)
                            Text("Benjarong is a traditional form of Thai ceramics that originated in the late 13th century. The term benjarong refers to a set of five or more intricately decorated, multicolored porcelain dishes. Each dish in the set is typically painted with a different color, and the designs often incorporate intricate patterns and images of animals, plants, and mythical creatures.")
                                .font(.title2)
                                .padding(30)
                        }
                        .frame(width: 1000, height: 400, alignment: .topLeading)
                        .padding(.horizontal, 100)
                        
                        VStack {
                            Image("benjarong2")
                                .interpolation(.low)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity, maxHeight: 200)
                                .clipped()
                            HStack {
                                Text("Benjarong ceramics were originally used in the royal court of Thailand as part of elaborate ceremonies and feasts. Over time, the art form spread to other parts of Thai society and became more widely available.")
                                    .font(.title2)
                                    .frame(width: 900, height: 130, alignment: .topLeading)
                                Text("Today, benjarong ceramics are considered an important part of Thai culture and are prized for their beauty and craftsmanship. They are often used for decorative purposes or as gifts for special occasions. While traditional techniques are still used to create benjarong ceramics, modern variations have also emerged, incorporating new designs and materials.")
                                    .font(.title2)
                                    .frame(width: 900, height: 130, alignment: .topLeading)
                            }
                            .padding(30)
                            .frame(alignment: .topLeading)
                        }
                        .frame(height: 400, alignment: .topLeading)
                    }
                    
                }
                
            }
            .frame(maxHeight: .infinity)
            .padding(.horizontal, 40)
        }
//        .border(.red)
        .frame(maxWidth: .infinity, maxHeight: .infinity)

    }
}

//Story2
struct LearningOriginator: View {
    var body: some View {
        Text("Hello World")
    }
}

//Story3
struct LearningOrigins: View {
    var body: some View {
        Text("Hello World")
    }
}

struct LearningStoryView_Previews: PreviewProvider {
    static var previews: some View {
        LearningInspiration()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

extension Color {
    static let benjarongC1 = Color("benjarong1")
    static let benjarongC2 = Color("benjarong2")
    static let benjarongC3 = Color("benjarong3")
    static let benjarongC4 = Color("benjarong4")
}
