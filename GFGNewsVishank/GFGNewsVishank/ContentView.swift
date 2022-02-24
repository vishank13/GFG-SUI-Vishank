//
//  ContentView.swift
//  GFGNewsVishank
//
//  Created by Vishank Raghav on 25/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var articles = APIService.shared
    
    init() {
    }
    var body: some View {
        
        NavigationView {
            ZStack {
                List {
                    ForEach(articles.articles.indices, id: \.self) { index in
                        
                        if index == 0 {
                            TopArticleView(article: self.articles.articles[index])
                                .listRowInsets(EdgeInsets())
                        } else {
                            RegularArticleView(article: self.articles.articles[index])
                                .listRowInsets(EdgeInsets())
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("GeeksForGeeks")
                .onAppear {
                    articles.getArticles()
                    UITableView.appearance().backgroundColor = UIColor(red: 220/256, green: 220/256, blue: 220/256, alpha: 1.0)
                    UITableView.appearance().separatorColor = .clear
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
