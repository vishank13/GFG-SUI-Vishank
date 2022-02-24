//
//  RegularArticleView.swift
//  GFGNewsVishank
//
//  Created by Vishank Raghav on 25/02/22.
//

import SwiftUI

struct RegularArticleView: View {
    
    let article: Item!
    
    var body: some View {
        
        ZStack {
            Color.init(red: 220/256, green: 220/256, blue: 220/256)
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(article.title!)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                        .lineLimit(2)
                    Spacer()
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
                }
                .padding()
                Spacer(minLength: 10)
                if let link = article.thumbnail {
                    AsyncImage(url: URL(string: (link.components(separatedBy: "?")[0]) as! String )) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90)
                    } placeholder: {
                        Text("")
                    }
                }
            }
            .background(.white)
            .cornerRadius(20)
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

struct RegularArticleView_Previews: PreviewProvider {
    static var previews: some View {
        RegularArticleView(article: APIService.shared.articles[0])
            .previewLayout(.sizeThatFits)
    }
}
