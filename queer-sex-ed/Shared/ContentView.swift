//
//  ContentView.swift
//  Shared
//
//  Created by Devon Quispe on 10/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { fullscreen in
            VStack
            {
                Text("Topics")
                    .font(.largeTitle).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .foregroundColor(.white)
                Spacer()
                ScrollView
                {
                    VStack
                    {
                        ChapterCard(title: "GENDER & SEXUALITY",width: fullscreen.size.width, height: fullscreen.size.height)
                        ChapterCard(title: "ANATOMY", color: .pink, img: "anatomy", width: fullscreen.size.width, height: fullscreen.size.height)
                        
                    }
                }
                
            }
            .background(.mint)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
