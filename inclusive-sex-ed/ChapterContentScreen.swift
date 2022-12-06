//
//  ChapterContentScreen.swift
//  inclusive-sex-ed
//
//  Created by Devon Quispe on 12/6/22.
//

import SwiftUI

struct ChapterContentScreen: View {
    let title : String
    let articles : [article]
    
    
    var body: some View {
        GeometryReader
        { screen in
            
            VStack
            {
                Text(title)
                    .font(.largeTitle).bold()
                    .padding()
                
                NavigationView
                {
                    ScrollView
                    {
                        ForEach(articles, id: \.title)
                        { article in
                            
                            NavigationLink(destination: ContentView())
                            {
                                VStack
                                {
                                    Text(article.title)
                                        .font(.largeTitle).bold()
                                        .foregroundColor(.white)
                                }

                                .frame(width: screen.size.width - 10, height: screen.size.height/8)
                                .background(.gray)
                                .cornerRadius(40)
                                .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y:3)
                            }
                        }
                    }
                    .background(.blue)
                }
                .frame(width: screen.size.width, height: screen.size.height)
            }
        }
    }
}

struct ChapterContentScreen_Previews: PreviewProvider {
    
    
    static var previews: some View {
        let configProvider = ConfigProvider(localConfigLoader: LocalConfigLoader(), remoteConfigLoader: RemoteConfigLoader())
        
        ChapterContentScreen(title: "Sexuality and Gender", articles: configProvider.config.chapters[0].articles)
    }
}
