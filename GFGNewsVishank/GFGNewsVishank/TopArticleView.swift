//
//  TopArticleView.swift
//  GFGNewsVishank
//
//  Created by Vishank Raghav on 25/02/22.
//

import SwiftUI

struct TopArticleView: View {
    
    let article: Item!
    
    var body: some View {
        ZStack {
            Color.init(red: 220/256, green: 220/256, blue: 220/256)
            VStack(alignment: .leading, spacing: 0) {
                if let link = article.enclosure?.link {
                    AsyncImage(url: URL(string: (link.components(separatedBy: "?")[0]) as! String )) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Text("")
                    }
                }
                Text(article.title!)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.green)
                    .lineLimit(2)
                    .padding()
                Divider()
                    .padding(.horizontal)
                HStack {
                    Text(article.pubDate!.getDate())
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                    Text(article.pubDate!.getTime())
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.gray)
                }
                .padding()
            }
            .background(.white)
            .cornerRadius(20)
            .padding()
        }
    }
}

struct TopArticleView_Previews: PreviewProvider {
    static var previews: some View {
        TopArticleView(article: APIService.shared.articles[0])
            .previewLayout(.sizeThatFits)
    }
}
