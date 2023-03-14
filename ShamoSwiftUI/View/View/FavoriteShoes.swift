//
//  FavoriteShoes.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 20/10/22.
//

import SwiftUI

struct FavoriteShoes: View {
    var body: some View {
        VStack(spacing: 0.0){
            HStack(spacing:0.0){
                HStack(spacing:0.0){
                        Spacer()
                        Text("Favorite Shoes")
                        .font(.custom("Poppins-Medium", size: 18))
                        .foregroundColor(Color("SoftGray"))
                        Spacer()
                    }
                .padding(.horizontal, 30.0)
            }
            .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            .background(Color("Black"))
            .padding(.bottom, 30.0)
            
            //Start
//            FavoriteEmpty()
            FavoriteNotEmpty()
                
            FavoriteNotEmpty()
            FavoriteNotEmpty()
            //End
            Spacer()
        }
        .background(Color("PrimaryBG"))
        
    }
}

struct FavoriteShoes_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteShoes()
    }
}
