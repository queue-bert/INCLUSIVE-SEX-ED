//
//  ChapterCard.swift
//  queer-sex-ed
//
//  Created by Devon Quispe on 10/11/22.
//

import SwiftUI

struct ChapterCard: View {
    var title : String = "DEFAULT"
    let summary : String = "this is a synopsis of this chapter"
    var color : Color = .blue
    var img : String = "sexuality"
    let width : CGFloat
    let height : CGFloat
    let w_scalar : Float = 0.85
    let h_scalar : Float = 0.70
    
    
    var body: some View {
        VStack
        {
            Spacer()
            Image(img)
                .resizable()
                .scaledToFit()
                .padding([.top,.horizontal], 10)
            Spacer()
            HStack
            {
                Text(title)
                    .font(.largeTitle).bold()
                    .padding([.leading,.bottom])
                    .foregroundColor(.white)
                Spacer()
            }
            .frame(width:width * CGFloat(w_scalar))
        }
        .frame(width: width * CGFloat(w_scalar), height: height * CGFloat(h_scalar), alignment: .center)
        .background(color)
        .cornerRadius(30)
        
    }
}

struct ChapterCard_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader {screen in
            
            VStack{
//                ChapterCard(title: "ANATOMY", summary: "This section is about sexual anatomy, This section is about sexual anatomy, This section is about sexual anatomy, This section is about sexual anatomy, This section is about sexual anatomy", color: .pink, img: "sexuality", width: screen.size.width, height: screen.size.height)
            }.frame(alignment: .trailing)
            
        }
        
    }
}
