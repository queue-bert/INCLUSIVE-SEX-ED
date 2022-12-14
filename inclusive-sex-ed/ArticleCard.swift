//
//  ArticleCard.swift
//  inclusive-sex-ed
//
//  Created by Devon Quispe on 12/6/22.
//

import SwiftUI

struct ArticleCard: View {
    let article : article
    // need to add estimated read time and color parameters
    var time : Float {
        return Float(article.time)!
    }
    var emoji : String {
        if (time > 30) { return "📚" }
        else if (time > 20) { return "📕" }
        else if (time > 10) { return "📙" }
        else if (time > 5) { return "📘" }
        return "📗"
    }
    
    var body: some View {
        HStack(spacing: 20)
        {
            Text(emoji)
                .font(.custom("sizer", size: 60))
            
            VStack(alignment: .leading, spacing: 6)
            {
                Text(article.title)
                    .fontWeight(.bold)
                
                Text("Est. Reading Time : \(article.time) min.")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer(minLength: 0)
        }
//        .background(.orange)
    }
}

struct ArticleCard_Previews: PreviewProvider {
    static var previews: some View {
        let configProvider = ConfigProvider(localConfigLoader: LocalConfigLoader(), remoteConfigLoader: RemoteConfigLoader())
        ArticleCard(article: configProvider.config.chapters[0].articles[0])
    }
}
