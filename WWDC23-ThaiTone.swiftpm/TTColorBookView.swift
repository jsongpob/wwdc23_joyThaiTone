//
//  ColorBookView.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 9/3/2566 BE.
//

import SwiftUI

struct TTColorBookView: View {
    
    //colordata
    struct ColorData: Identifiable {
        var id = UUID()
        let name: String
        let hex: String
    }
    
    //colors-collection
    let colors: [ColorData] = [
        ColorData(name: "Dangchad", hex: "#c9242b"),
        ColorData(name: "Hongchad", hex: "#cb6669"),
        ColorData(name: "Dindang", hex: "#984c36"),
        ColorData(name: "Dindangthat", hex: "#98262a"),
        ColorData(name: "Dindangtut", hex: "#76202a"),
        ColorData(name: "Dandtut", hex: "#951519"),
        ColorData(name: "Hongdintut", hex: "#894c3e"),
        ColorData(name: "Hongdin", hex: "#d59088"),
        ColorData(name: "Hongsabat", hex: "#df92a3"),
        ColorData(name: "Fhundang", hex: "#df92a3"),
        ColorData(name: "Kampoolud", hex: "#dc4028"),
        ColorData(name: "Buaroi", hex: "#ca6a7a"),
        ColorData(name: "Tongsingha", hex: "#dc577e"),
        ColorData(name: "Dokubon", hex: "#dd6d91"),
        ColorData(name: "Dangdokkamut", hex: "#d6999e"),
        ColorData(name: "Linchi", hex: "#a62b4c"),
        ColorData(name: "Dangdokchaba", hex: "#a62b4c"),
        ColorData(name: "Namkruang", hex: "#dc403e"),
        ColorData(name: "Dangyo", hex: "#c93b5e"),
        ColorData(name: "Kanpooasura", hex: "#d35425"),
        ColorData(name: "Dokbanyen", hex: "#f27091"),
        ColorData(name: "Nammak", hex: "#a13422"),
        ColorData(name: "Kulap", hex: "#f698a3"),
        ColorData(name: "Gasornchompoo", hex: "#db3b7b"),
        ColorData(name: "Dangmanee", hex: "#ca3c3d"),
        ColorData(name: "Nilubon", hex: "#ac83a8"),
        ColorData(name: "Sen", hex: "#f25821"),
        ColorData(name: "Hongsen", hex: "#f58465"),
        ColorData(name: "Lukpikul", hex: "#dc4c33"),
        ColorData(name: "Meksonthaya", hex: "#f68b32"),
        ColorData(name: "Kandokkannika", hex: "#d14c28"),
        ColorData(name: "Phuakanee", hex: "#e09179"),
        ColorData(name: "Maksuk", hex: "#f36e31"),
        ColorData(name: "Doktaptim", hex: "#dd5734"),
        ColorData(name: "Nampueang", hex: "#d77c29"),
        ColorData(name: "Momai", hex: "#e3a377"),
        ColorData(name: "Rongtong", hex: "#e8bb1f"),
        ColorData(name: "Horadan", hex: "#ffde2c"),
        ColorData(name: "Pleangkaophot", hex: "#F2D980"),
        ColorData(name: "Lueamprapasson", hex: "#cec9a2"),
        ColorData(name: "Chan", hex: "#f4d25d"),
        ColorData(name: "Champa", hex: "#eea31f"),
        ColorData(name: "Lueangdin", hex: "#be9c25"),
        ColorData(name: "Dokbuab", hex: "#ffe95e"),
        ColorData(name: "Maikritsana", hex: "#e5be82"),
        ColorData(name: "Lueangpai", hex: "#ead415"),
        ColorData(name: "Lukkchan", hex: "#f2c04e"),
        ColorData(name: "Muksuk", hex: "#c7ae7b"),
        ColorData(name: "Kipueang", hex: "#d09b2a"),
        ColorData(name: "Nuea", hex: "#f1d7b3"),
        ColorData(name: "Matumsuk", hex: "#d88529"),
        ColorData(name: "Khiaopai", hex: "#687840"),
        ColorData(name: "Khiaotangsae", hex: "#45ab87"),
        ColorData(name: "Khiaokitthong", hex: "#00796e"),
        ColorData(name: "Khiaokheemaha", hex: "#6b6b3e"),
        ColorData(name: "Khiaokab", hex: "#00676e"),
        ColorData(name: "Khiaokantong", hex: "#269a82"),
        ColorData(name: "Khiaonuan", hex: "#58986f"),
        ColorData(name: "Khiaokampoo", hex: "#17372a"),
        ColorData(name: "Khiaodin", hex: "#356740"),
        ColorData(name: "Khiaokaikrud", hex: "#00968f"),
        ColorData(name: "Tongon", hex: "#919b4a"),
        ColorData(name: "Khiaotong", hex: "#21723e"),
        ColorData(name: "Khiaokagi", hex: "#008068"),
        ColorData(name: "Khiaobaikae", hex: "#145139"),
        ColorData(name: "Khiaomali", hex: "#69b496"),
        ColorData(name: "Khiaokaiga", hex: "#93b692"),
        ColorData(name: "Maipai", hex: "#278766"),
        ColorData(name: "Khiaotua", hex: "#6d953a"),
        ColorData(name: "Khiaonokkaling", hex: "#88ab68"),
        ColorData(name: "Khiaothapoon", hex: "#5192a1"),
        ColorData(name: "Khiaokinokkarawek", hex: "#7dbfb8"),
        ColorData(name: "Mahadthai", hex: "#657249"),
        ColorData(name: "Khiaonamlai", hex: "#00968f"),
        ColorData(name: "Yhaphangon", hex: "#dcd990"),
        ColorData(name: "Morakod", hex: "#009058"),
        ColorData(name: "Khiaomaphood", hex: "#bcb531"),
        ColorData(name: "Sork", hex: "#84c299"),
        ColorData(name: "Khaioronfga", hex: "#5f8d56"),
        ColorData(name: "Khram", hex: "#16466e"),
        ColorData(name: "Khramfarang", hex: "#0c4da2"),
        ColorData(name: "Mokhram", hex: "#577896"),
        ColorData(name: "Mekkhram", hex: "#072f4f"),
        ColorData(name: "Mek", hex: "#93adbd"),
        ColorData(name: "Thaegung", hex: "#296169"),
        ColorData(name: "Khap", hex: "#1a465a"),
        ColorData(name: "Khapdam", hex: "#042738"),
        ColorData(name: "Kemkhap", hex: "#005465"),
        ColorData(name: "Namlai", hex: "#5aaebd"),
        ColorData(name: "Koncornangnokyung", hex: "#008d9b"),
        ColorData(name: "Kelahum", hex: "#2a0139"),
        ColorData(name: "Tamaw", hex: "#4d94ac"),
        ColorData(name: "Kromtha", hex: "#1b2c55"),
        ColorData(name: "Namngennokpilap", hex: "#0f697c"),
        ColorData(name: "Fa", hex: "#3476ae"),
        ColorData(name: "Muangchad", hex: "#a5546a"),
        ColorData(name: "Muangkhram", hex: "#3a2d53"),
        ColorData(name: "Muangmedmaprang", hex: "#702c7d"),
        ColorData(name: "Muangdoktabeak", hex: "#b579a6"),
        ColorData(name: "Muangdokpaktop", hex: "#776fa5"),
        ColorData(name: "Muangkhiao", hex: "#7f616d"),
        ColorData(name: "Muangkae", hex: "#432a64"),
        ColorData(name: "Dokunchan", hex: "#695095"),
        ColorData(name: "Pueak", hex: "#bd9dc2"),
        ColorData(name: "Muangtong", hex: "#9f4a57"),
        ColorData(name: "Plueagmankut", hex: "#6e2c4f"),
        ColorData(name: "Pueangangkap", hex: "#876aa4"),
        ColorData(name: "Lukwa", hex: "#400643"),
        ColorData(name: "Namtan", hex: "#7b4a34"),
        ColorData(name: "Namtanmai", hex: "#522e1a"),
        ColorData(name: "Kapi", hex: "#a5505b"),
        ColorData(name: "Fhad", hex: "#6f2e28"),
        ColorData(name: "Fang", hex: "#daba8a"),
        ColorData(name: "Din", hex: "#e3a377"),
        ColorData(name: "It", hex: "#c1621a"),
        ColorData(name: "Sak", hex: "#b95831"),
        ColorData(name: "Kruk", hex: "#8a5929"),
        ColorData(name: "Kaki", hex: "#a19078"),
        ColorData(name: "Thong", hex: "#d1b654"),
        ColorData(name: "Thongkam", hex: "#bd9425"),
        ColorData(name: "Thongchomphunuch", hex: "#dba73b"),
        ColorData(name: "Thongdokbuab", hex: "#ddc153"),
        ColorData(name: "Lueangpeangthong", hex: "#c0ac23"),
        ColorData(name: "Thongdang", hex: "#a0564b"),
        ColorData(name: "Thongdangsuk", hex: "#d68f71"),
        ColorData(name: "Nak", hex: "#cb7371"),
        ColorData(name: "Lueamphai", hex: "#e3c0ab"),
        ColorData(name: "lueamlueang", hex: "#e7d992"),
        ColorData(name: "Ngen", hex: "#bcc4c1"),
        ColorData(name: "Kaoponpet", hex: "#e5dbc0"),
        ColorData(name: "Lek", hex: "#bcbdb8"),
        ColorData(name: "Leklai", hex: "#29241b"),
        ColorData(name: "Samritphon", hex: "#613f1c"),
        ColorData(name: "Samritchok", hex: "#5c4606"),
        ColorData(name: "Samritsak", hex: "#a1966d"),
        ColorData(name: "Samritkhun", hex: "#165d5a"),
        ColorData(name: "Samritdat", hex: "#444740"),
        ColorData(name: "Damkhamao", hex: "#000000"),
        ColorData(name: "Dammuek", hex: "#5a5b60"),
        ColorData(name: "Momuek", hex: "#778a83"),
        ColorData(name: "Muekchin", hex: "#363c41"),
        ColorData(name: "Namrak", hex: "#2b1c18"),
        ColorData(name: "Samrit", hex: "#584e42"),
        ColorData(name: "Peekka", hex: "#364540"),
        ColorData(name: "Khamaoyang", hex: "#223640"),
        ColorData(name: "Tao", hex: "#7f8585"),
        ColorData(name: "Lueangtao", hex: "#b4a790"),
        ColorData(name: "Swad", hex: "#6a6e78"),
        ColorData(name: "Khiaonil", hex: "#002835"),
        ColorData(name: "Nilkan", hex: "#00080b"),
        ColorData(name: "Doklao", hex: "#b3b3ba"),
        ColorData(name: "Lukhan", hex: "#6b6272"),
        ColorData(name: "Kwanpheng", hex: "#9d9081"),
        ColorData(name: "Poon", hex: "#9fa49f"),
        ColorData(name: "Toakhiao", hex: "#93a9a4"),
        ColorData(name: "Khaphong", hex: "#f1ede2"),
        ColorData(name: "Khaokabang", hex: "#d0cfcf"),
        ColorData(name: "Falap", hex: "#efdae0"),
        ColorData(name: "Kwaaipueag", hex: "#efc5b5"),
        ColorData(name: "Changpueag", hex: "#e09a83"),
        ColorData(name: "Keabbua", hex: "#edbbc6"),
        ColorData(name: "Nuantao", hex: "#b4ae9b"),
        ColorData(name: "Nuan", hex: "#dbcc90"),
        ColorData(name: "Nuanchan", hex: "#dcc169"),
        ColorData(name: "Sang", hex: "#fff1d0"),
        ColorData(name: "Khaokhap", hex: "#c1d4ce"),
        ColorData(name: "Ngachang", hex: "#fffde0"),
        ColorData(name: "Mok", hex: "#dbccb9")
    ]
    
    @State private var selectedColor: ColorData? = nil
    
    //View
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 6), spacing: 15) {
                ForEach(colors) { color in
                    VStack {
                        Color(hex: color.hex)
                            .frame(width: 170, height: 170)
                            .cornerRadius(15)
//                            .shadow(radius: 10)
                            .overlay{
                                VStack {
                                    Text(color.name)
                                        .font(.title3.bold())
                                        .foregroundColor(.white)
                                }
                            }
                            .onTapGesture {
                                selectedColor = color
                            }
                    }
                }
            }
            .padding(.horizontal, 45)
        }
        .sheet(item: $selectedColor) { color in
            ColorDetailView(name: color.name, hex: color.hex)
        }
    }
}//END struct

//Preview
struct TTColorBookView_Previews: PreviewProvider {
    static var previews: some View {
        TTColorBookView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

//View Detail Sheet
struct ColorDetailView: View {
    let name: String
    var hex: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(name)
                .font(.largeTitle.bold())
                .foregroundColor(Color(hex: hex))
            Text(hex)
                .onTapGesture {
                    UIPasteboard.general.string = self.hex
                }
                .font(.title)
                .foregroundColor(.gray)
            Rectangle()
                .frame(width: 600, height: 500)
                .foregroundColor(Color(hex: hex))
                .cornerRadius(15)
        }
        .padding()
    }
}

//Color Converter
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        
        //Color Converter
        if scanner.scanHexInt64(&hexNumber) {
            let red = Double((hexNumber & 0xff0000) >> 16) / 255.0
            let green = Double((hexNumber & 0x00ff00) >> 8) / 255.0
            let blue = Double(hexNumber & 0x0000ff) / 255.0
            
            self.init(red: red, green: green, blue: blue)
            return
        }
        //Defalut
        self.init(red: 0, green: 0, blue: 0)
    }
}
