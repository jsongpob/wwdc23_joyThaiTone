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
            Text("About this project")
                .font(.subheadline)
                .padding(.top, 100)
            Text("ThaiTone")
                .font(.system(size: 72, weight: .medium))
            
            //CONTENT
            ScrollView(showsIndicators: false) {
                VStack(spacing: 40) {
                    CallCardView(callicon: "swift", calltext: "Vestibulum viverra lorem odio. Ut in risus lacus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim nibh tincidunt tortor congue pretium. Sed consectetur risus nec dui ultrices, sit amet maximus lacus lacinia. Aliquam auctor id ex vitae placerat. Nullam elit est, pulvinar sed felis eget, vestibulum suscipit nisi. Phasellus sagittis efficitur metus."
                    )
                    CallCardView(callicon: "flag.fill", calltext: "Vestibulum viverra lorem odio. Ut in risus lacus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim nibh tincidunt tortor congue pretium. Sed consectetur risus nec dui ultrices, sit amet maximus lacus lacinia. Aliquam auctor id ex vitae placerat. Nullam elit est, pulvinar sed felis eget, vestibulum suscipit nisi. Phasellus sagittis efficitur metus."
                    )
                    CallCardView(callicon: "person.fill", calltext: "Vestibulum viverra lorem odio. Ut in risus lacus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim nibh tincidunt tortor congue pretium. Sed consectetur risus nec dui ultrices, sit amet maximus lacus lacinia. Aliquam auctor id ex vitae placerat. Nullam elit est, pulvinar sed felis eget, vestibulum suscipit nisi. Phasellus sagittis efficitur metus."
                    )
                }
            }
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
                .frame(width: 200, height: 100, alignment: .center)
                .font(.system(size: 48))
            Text(calltext)
                .font(.body)
                .frame(width: 700, alignment: .leading)
        }
    }
}
