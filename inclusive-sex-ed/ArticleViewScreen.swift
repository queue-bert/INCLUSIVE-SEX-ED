//
//  ArticleViewScreen.swift
//  inclusive-sex-ed
//
//  Created by Devon Quispe on 12/6/22.
//

import SwiftUI

func getText(url : String) -> String
{
    var contents : String = ""
    
    if let URL = URL(string: url)
    {
        do
        {
            contents = try String(contentsOf: URL)
        }
        catch
        {
            contents = "This resource could no be loaded at this time. Please retry..."
        }
    }
    else
    {
        print("BAD TEXT FILE LINK")
    }
    
    return contents
}

struct ArticleViewScreen: View {
    var width : CGFloat
    var height : CGFloat
    let article : article

    var body: some View {
        ScrollView
        {
            VStack
            {
                ScrollView(.horizontal, showsIndicators: false)
                {
                    HStack (spacing: 0)
                    {
                        ForEach(0..<article.imgs.count){ i in
                            AsyncImage(url: URL(string: article.imgs[i])) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                    .frame(height: width)
                }
                .ignoresSafeArea()


                HStack
                {
                    Text(article.title)
                        .font(.largeTitle).bold()
                        .padding([.leading, .bottom], 15)
                    Spacer()
                }
                
                Text(getText(url: article.text))
                    .padding(.horizontal, 20)

            }
            
        }
        .ignoresSafeArea()
    }
}

struct ArticleViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        let configProvider = ConfigProvider(localConfigLoader: LocalConfigLoader(), remoteConfigLoader: RemoteConfigLoader())
        GeometryReader
        { screen in
            ArticleViewScreen(width: screen.size.width, height: screen.size.height, article: configProvider.config.chapters[0].articles[0])
        }
    }
}
