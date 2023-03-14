//
//  TabView.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 21/10/22.
//

import SwiftUI

struct TabView: View {
    var body: some View {
        ZStack{
            TabView{
        HomeView()
            .tabItem{
                Image(systemName: "house.fill")
                Text("Home")
                    .font(.custom("Poppins-Medium", size: 16))
            }
        CartView()
            .tabItem{
                Image(systemName: "bag.fill")
                Text("Cart")
                    .font(.custom("Poppins-Medium", size: 16))
            }
        FavoriteShoes()
            .tabItem{
                Image(systemName: "heart.fill")
                Text("Favorite")
                    .font(.custom("Poppins-Medium", size: 16))
            }
        ProfileView()
            .tabItem{
                Image(systemName: "person.fill")
                Text("Profile")
                    .font(.custom("Poppins-Medium", size: 16))
            }
    }
    .accentColor(Color("Primary"))
    
}
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
