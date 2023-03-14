//
//  TabFooter.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 24/10/22.
//

import SwiftUI

struct TabFooter: View {
//    init() {
//        UITabBar.appearance().barTintColor = UIColor(Color("Card"))
//    }
    var body: some View {
        if (UserDefaults.standard.object(forKey: "access_token") != nil) {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                
//                CartView()
//                    .tabItem {
//                        Image(systemName: "cart")
//                    }
                
                FavoriteShoes()
                    .tabItem {
                        Image(systemName: "heart")
                    }
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                    }
                }
            .accentColor(Color("Primary"))
            .onAppear {
                let appearance = UITabBarAppearance()
                appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
                appearance.backgroundColor = UIColor(Color.init("Card"))
                
                // Use this appearance when scrolling behind the TabView:
                UITabBar.appearance().standardAppearance = appearance
                // Use this appearance when scrolled all the way up:
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
    }
}

struct TabFooter_Previews: PreviewProvider {
    static var previews: some View {
        TabFooter()
    }
}
