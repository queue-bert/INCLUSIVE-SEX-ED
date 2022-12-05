//
//  ContentPageView.swift
//  queer-sex-ed
//
//  Created by Devon Quispe on 10/12/22.
//

import SwiftUI

struct ContentPageView: View {
    var images : [String] = ["sexuality", "anatomy"]
    var width : CGFloat
    var height : CGFloat
    var title : String
    var text : String

    var body: some View {
        ScrollView
        {
            VStack
            {
                ScrollView(.horizontal)
                {
                    HStack (spacing: 20)
                    {
                        ForEach(0..<images.count){ i in
                            Image(images[i])
                                .resizable()
                                .scaledToFill()
                            
                        }
                    }
                    .frame(height: width)
                }
                .ignoresSafeArea()


                HStack
                {
                    Text(title)
                        .font(.largeTitle).bold()
                        .padding([.leading, .bottom], 15)
                    Spacer()
                }
                Text(text)
                    .padding(.horizontal, 20)
            }
            
        }
        .ignoresSafeArea()
    }
}

struct ContentPageView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { fullscreen in
            ContentPageView(width: fullscreen.size.width, height: fullscreen.size.height, title: "About Anatomy", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?")
        }
    }
}
