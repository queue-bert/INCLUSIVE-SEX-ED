//
//  ChapterCard.swift
//  inclusive-sex-ed
//
//  Created by Devon Quispe on 12/6/22.
//

import SwiftUI

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

struct ChapterCard: View {
    let chapter : chapter
    let width : CGFloat
    let height : CGFloat
    var color : Color {
        return Color(hexStringToUIColor(hex: chapter.color))
    }
    var w_scalar : Float {
        return Float(chapter.w_scalar)!
    }
    var h_scalar : Float {
        return Float(chapter.h_scalar)!
    }
    
    
    var body: some View {
        VStack
        {
            Spacer()
            AsyncImage(url: URL(string: chapter.img)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            Spacer()
            HStack
            {
                Text(chapter.title)
                    .font(.largeTitle).bold()
                    .padding([.leading,.bottom])
                    .foregroundColor(.white)
                Spacer()
            }
            .frame(width: width * CGFloat(w_scalar))
        }
        .frame(width: width * CGFloat(w_scalar), height: height * CGFloat(h_scalar), alignment: .center)
        .background(color)
        .cornerRadius(30)
        .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y:3)
        
    }
}

struct ChapterCard_Previews: PreviewProvider {
    
    static var previews: some View {
        let configProvider = ConfigProvider(localConfigLoader: LocalConfigLoader(), remoteConfigLoader: RemoteConfigLoader())
        
        GeometryReader {screen in
            
            VStack{
                ForEach(configProvider.config.chapters, id: \.img) { chapter in
                    ChapterCard(chapter: chapter, width: screen.size.width, height: screen.size.height)
                    
                }
            }.frame(alignment: .trailing)
            
        }
        
    }
}
