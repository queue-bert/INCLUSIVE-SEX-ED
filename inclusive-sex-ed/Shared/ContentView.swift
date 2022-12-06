//
//  ContentView.swift
//  Shared
//
//  Created by Devon Quispe on 12/6/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var configProvider : ConfigProvider
    
    var body: some View {
        GeometryReader { screen in
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
                        
                        NavigationView
                        {
                            
                            ScrollView
                            {
                                ForEach(configProvider.config.chapters, id: \.img)
                                { chapter in
                                    NavigationLink(destination: Text("HELLO"))
                                    {
                                        ChapterCard(chapter: chapter, width: screen.size.width, height: screen.size.height)
                                    }
                                }
                            }
                        }
                        .frame(width: screen.size.width, height: screen.size.height)
                        
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
