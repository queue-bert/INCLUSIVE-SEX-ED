//
//  RandomView.swift
//  inclusive-sex-ed
//
//  Created by Devon Quispe on 12/6/22.
//

import SwiftUI

struct RandomView: View {
    let hero : String
    let title : String
    let articles : [article]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack
            {
                GeometryReader
                { geometry in
                    AsyncImage(url: URL(string: hero)) { image in
                        image
                            .resizable()
                            .offset(y : geometry.frame(in: .global).minY > 0 ? -geometry.frame(in: .global).minY : 0)
                            .frame(height: geometry.frame(in: .global).minY > 0 ?
                                   UIScreen.main.bounds.height / 2.2 + geometry.frame(in: .global).minY :
                                    UIScreen.main.bounds.height / 2.2)
                    } placeholder: {
                        ProgressView()
                    }
                }
                .frame(height: UIScreen.main.bounds.height / 2.2)
                
                VStack
                {
                    HStack
                    {
                        Text(title)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    VStack(spacing: 20)
                    {
                        ForEach(articles, id: \.text)
                        { article in
                            
//                            ArticleCard(article: article)
                            
                            NavigationLink(destination: ArticleViewScreen(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, article: article))
                            {
                                ArticleCard(article: article)
                            }
                            
                            
                        }
                    }
                    .padding(.top)
                }
                .padding()
                
                
                Spacer()
            }
        })
        .edgesIgnoringSafeArea(.top)
    }
}

struct RandomView_Previews: PreviewProvider {
    static var previews: some View {
        let configProvider = ConfigProvider(localConfigLoader: LocalConfigLoader(), remoteConfigLoader: RemoteConfigLoader())
        RandomView(hero: "https://amplify-atlasiosfall22-dev-161515-deployment.s3.us-west-2.amazonaws.com/public/Sexuality+and+Gender/recommendationsForTransgenderHealthCar/pwr-btm_a_colo_hospital_made_out_of_flowers_and_trees_peace_f7ab8ced-eeb4-49e0-834f-4e09afc7bc61.png", title: "Sexuality", articles: configProvider.config.chapters[0].articles)
    }
}
