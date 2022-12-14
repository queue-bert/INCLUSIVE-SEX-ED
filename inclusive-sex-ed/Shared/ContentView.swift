//
//  ContentView.swift
//  Shared
//
//  Created by Devon Quispe on 12/6/22.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var configProvider : ConfigProvider
    
    var body: some View {
        NavigationView {
            VStack
            {
                Text("Topics")
                    .font(.largeTitle).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .foregroundColor(.white)
                ScrollView (showsIndicators: false)
                {
                    VStack
                    {
                        ForEach(configProvider.config.chapters, id: \.img)
                        { chapter in
                            NavigationLink(destination: ChapterContentScreen(hero: chapter.img, title: chapter.title, articles: chapter.articles))
                            {
                                ChapterCard(chapter: chapter, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            }
                        }
                        
//                            ScrollView (showsIndicators: false)
//                            {
//
//                            }
//                            .frame(width: screen.size.width, height: screen.size.height)
                        
                    }
                }
                
            }
        .background(.mint)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var configProvider = ConfigProvider(localConfigLoader: LocalConfigLoader(), remoteConfigLoader: RemoteConfigLoader())
    
    static var previews: some View {
        ContentView()
            .environmentObject(configProvider)
    }
}
