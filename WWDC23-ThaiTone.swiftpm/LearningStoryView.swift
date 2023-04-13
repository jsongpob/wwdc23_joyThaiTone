//
//  LearningInspiration.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 28/3/2566 BE.
//

import SwiftUI

//Start LearningInspirationView
struct LearningInspiration: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            LazyHStack {
                
                //SECTION TITLE
                InspirationContent1()
                
                //SECTION BENJARONG COLORS
                InspirationContent2()
                
                //SECTION TEN CRAFTMANSHIP
                InspirationContent3()
                
                //SECTION EXPLORE BENJARONG
                InspirationContent4()
                
            }
            .frame(maxHeight: .infinity)
            .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct InspirationContent1: View {
    var body: some View {
        LazyHStack {
            VStack(alignment: .leading, spacing: 40) {
                Text("What is the \ninspiration for \nThai-Tone colors?")
                    .font(.system(size: 38, weight: .bold, design: .default))
                    .lineSpacing(8)
                HStack {
                    Image(systemName: "arrow.right")
                    Text("Scroll to read")
                        .font(.system(size: 18, weight: .regular, design: .default))
                }
            }
            
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
    }
}

struct InspirationContent2: View {
    var body: some View {
        LazyHStack {
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
    }
}

struct InspirationContent3: View {
    var body: some View {
        LazyHStack {
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
    }
}

struct InspirationContent4: View {
    var body: some View {
        LazyHStack {
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
}

//End LearningInspirationView

//Start LearningOriginatorView
struct LearningOriginator: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            LazyHStack {
                
                //SECTION TITLE
                OriginatorContent1()
                
                //SECTION THE CREATION
                OriginatorContent2()
                
                //SECTION ACCORDING
                OriginatorContent3()
                
            }
            .frame(maxHeight: .infinity)
            .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct OriginatorContent1: View {
    var body: some View {
        LazyHStack {
            VStack(alignment: .leading, spacing: 40) {
                Text("The originator \nof modern \nThai colors")
                    .font(.system(size: 38, weight: .bold, design: .default))
                    .lineSpacing(8)
                HStack {
                    Image(systemName: "arrow.right")
                    Text("Scroll to read")
                        .font(.system(size: 18, weight: .regular, design: .default))
                }
            }
            Image("phairoj")
                .interpolation(.low)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 700, maxHeight: 600)
                .clipped()
                .padding(40)
            VStack(alignment: .leading, spacing: 20) {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 72, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                Text("Dr. Pairoj Pittayamatee")
                    .font(.title.bold())
                Text("The synthesis of the knowledge of Thai colors that is about to be lost and forgotten causing the wisdom of Thai color mixing to disappear and distorting the color level that looks dark in Thai style. And the belief in the use of Thai colors also disappeared")
                    .font(.title)
            }
            .frame(maxWidth: 800, maxHeight: 350, alignment: .leading)
            .padding(.horizontal, 60)
        }
    }
}

struct OriginatorContent2: View {
    var body: some View {
        LazyHStack {
            Image("ramayanawar")
                .interpolation(.low)
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 4000, maxHeight: 600)
                .clipped()
                .padding(40)
            Text("A study of the use of Thai colors Ancient Thai color combinations Both from experts in textbooks and from various books. Then bring this knowledge together to synthesize and create a color database with color values set according to the international color system. and to study the belief in the use of Buddhist colors that have profound multidimensionality, and then use the acquired knowledge to create works on the topic.")
                .font(.title2)
                .frame(maxWidth: 750, maxHeight: 350, alignment: .leading)
                .padding(.leading, 30)
            Rectangle()
                .frame(width: 300, height: 4)
                .padding(.leading, 30)
            Text("The Creation of \nAesthetic Experience \nfrom Thai Colors Based \non Color Experience \nTheory")
                .padding(.leading, 30)
                .font(.system(size: 72, weight: .bold, design: .default))
                .lineSpacing(8)
            Rectangle()
                .padding(.leading, 30)
                .foregroundColor(Color.creation)
                .frame(width: 160, height: 600, alignment: .center)
        }
    }
}

struct OriginatorContent3: View {
    var body: some View {
        LazyHStack {
            Text("Through psychology, to achieve the best learning of Thai colors through the way of installation art. In order to allow visitors to have an experience with Thai colors among the various colors. Through creative works that are the result of artistic achievements so that the audience can experience the aesthetics of Thai colors that are different from international colors.")
                .font(.title2)
                .frame(maxWidth: 750, maxHeight: 350, alignment: .leading)
                .padding(.leading, 100)
            Image("colorcreationexperience")
                .interpolation(.low)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 600, maxHeight: 600)
                .clipped()
                .padding(40)
            Text("aesthetics in the symbols of the use of Thai colors according to unique beliefs, such as the use of red that represents the atmosphere of heaven, etc.")
                .font(.title2)
                .frame(maxWidth: 650, maxHeight: 350, alignment: .leading)
                .padding(.leading, 100)
            Rectangle()
                .padding(.leading, 30)
                .foregroundColor(Color.benjarongC2)
                .frame(width: 450, height: 600, alignment: .center)
            Text("The aesthetics of materials in Thai tones that come from nature aesthetics in Thai colors that are beautiful because it is a natural colors. Aesthetics in the name of Thai colors that are used to name each series of works are Thong Phuttha, Kram Yard, Mahanatee Sithandon, and Chad Daowadung. Benefits of this research and creation Not only for the preservation of cultural heritage not to be lost. but to establish the standard of the Thai color scheme according to the international color system in order to bring creativity Art and design have become easier and more widespread.")
                .font(.title2)
                .frame(maxWidth: 1000, maxHeight: 350, alignment: .leading)
                .padding(.leading, 100)
            VStack(alignment: .leading) {
                Image("yarong")
                    .interpolation(.low)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 1400, maxHeight: 600)
                    .clipped()
                Text("Krayarong Thai-tone powder color, handmade from natural materials - Nop_Art_Studio")
            }
            .padding(.leading, 100)
            
        }
    }
}

//End LearningOriginatorView

//Start LearningOrigins

struct LearningOrigins: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            LazyHStack {
                
                //SECTION COLORS
                OriginsContent1()
                
                //SECTION IDEA
                OriginsContent2()
                
                //SECTION PRODUCT
                OriginsContent3()
                
            }
            .frame(maxHeight: .infinity)
            .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct OriginsContent1: View {
    var body: some View {
        LazyHStack {
            VStack(alignment: .leading, spacing: 40) {
                Text("What are the \norigins of \nThaiTone colors?")
                    .font(.system(size: 38, weight: .bold, design: .default))
                    .lineSpacing(8)
                HStack {
                    Image(systemName: "arrow.right")
                    Text("Scroll to read")
                        .font(.system(size: 18, weight: .regular, design: .default))
                }
            }
            HStack {
                Image("colorExperience1")
                    .interpolation(.low)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 400, maxHeight: 400)
                    .clipped()
                    .padding(10)
                Image("colorExperience2")
                    .interpolation(.low)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 400, maxHeight: 400)
                    .clipped()
                    .padding(10)
                Image("colorExperience3")
                    .interpolation(.low)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 400, maxHeight: 400)
                    .clipped()
                    .padding(10)
                Image("colorExperience4")
                    .interpolation(.low)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 400, maxHeight: 400)
                    .clipped()
                    .padding(10)
            }
            .padding(.horizontal, 50)
            
            VStack(alignment: .leading, spacing: 20) {
                Image(systemName: "paintpalette.fill")
                    .font(.system(size: 72, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                Text("The inspiration for creating an innovative Thaitone color system by \nDr. Pairoj Pittayamatee occurred during the time when Dr. Pairoj was studying for a master's degree. Communication Arts While he was analyzing the design elements, ")
                    .font(.title2)
                Text("Dr. Pairoj found that color is present in every design element. It made him think, What about Thai color?")
                    .font(.title2)
            }
            .frame(maxWidth: 700, maxHeight: 400, alignment: .leading)
            .padding(.horizontal, 60)
        }
    }
}

struct OriginsContent2: View {
    var body: some View {
        LazyHStack {
            Image("thaitoneOriginal")
                .interpolation(.low)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 900, maxHeight: 600)
                .clipped()
                .padding(40)
            Text("That idea made Dr. Pairoj Pitayamethee go to meet with Weeratham Trakulngernthai to consult with him on the topic of Thai colors. In addition, he also gave a Colors Jar of about 20 colors that he had made himself. Made from crushed earth, stone, and other natural materials.")
                .font(.title2)
                .frame(maxWidth: 690, maxHeight: 350, alignment: .leading)
                .padding(.leading, 100)
            Image("thaitoneOriginal2")
                .interpolation(.low)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 1200, maxHeight: 600)
                .clipped()
                .padding(.leading, 100)
                .padding(40)
            VStack(alignment: .leading, spacing: 40) {
                Text("Then he began to research and find ways to mix Thai colors, gradually accumulating from nearly 40 colors to now, when he has discovered more than 200 Thai colors.")
                    .font(.title2)
                Text("Thai colors is a mixture of natural minerals and vegetation, so the nature of Thai colors is naturally soft. The primary colors of Thai colors are natural colors.")
                    .font(.title2)
                Text("That is, red comes from Cinnabar ore, indigo is obtained by fermenting Indigofera tinctoria, and yellow is from Gamboge tree resin.")
                    .font(.title2)
            }
            .frame(maxWidth: 690, maxHeight: 350, alignment: .leading)
            .padding(.leading, 100)
            
            Rectangle()
                .padding(.leading, 30)
                .foregroundColor(Color.origins1)
                .frame(width: 600, height: 600, alignment: .center)
                .padding(.leading, 100)
        }
    }
}

struct OriginsContent3: View {
    var body: some View {
        LazyHStack {
            VStack(alignment: .leading, spacing: 40) {
                Text("It can be seen that the primary colors are all derived from nature, so the colors are softer than modern colors, and when the primary colors are mixed together, the secondary color will be softer. and have a unique identity.")
                    .font(.title2)
                Text("Later, Dr. Pairoj Pitayamethee has tried to create a modern color that gives hues such as Thai colors, leading to finally color setting in the CMYK printing system.")
                    .font(.title2)
            }
            .frame(maxWidth: 690, maxHeight: 350, alignment: .leading)
            .padding(.leading, 100)
            
            Rectangle()
                .padding(.leading, 30)
                .foregroundColor(Color.origins2)
                .frame(width: 600, height: 600, alignment: .center)
                .padding(.leading, 100)
            Image("thaitoneOriginal3")
                .interpolation(.low)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 700, maxHeight: 600)
                .clipped()
                .padding(40)
            Text("As for the name Thaitone, it is derived from the Pantone color brand because he wanted Thaitone to be like the Pantone color to collecting Thai colors and creating a trademark for further commercial expansion. The main goal is to allow Thai people to use Thai colors, which are national colors.")
                .font(.title2)
                .frame(maxWidth: 690, maxHeight: 350, alignment: .leading)
                .padding(.leading, 40)
        }
    }
}

//End LearningOrigins

struct LearningStoryView_Previews: PreviewProvider {
    static var previews: some View {
        LearningOrigins()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

//COLOR
extension Color {
    static let benjarongC1 = Color("benjarong1")
    static let benjarongC2 = Color("benjarong2")
    static let benjarongC3 = Color("benjarong3")
    static let benjarongC4 = Color("benjarong4")
    static let creation = Color("creation")
    static let origins1 = Color("origins1")
    static let origins2 = Color("origins2")
}
