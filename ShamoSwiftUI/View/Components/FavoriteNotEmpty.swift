//
//  FavoriteNotEmpty.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 20/10/22.
//

import SwiftUI

struct FavoriteNotEmpty: View {
    var body: some View {
        VStack(spacing: 0.0)
        {
            VStack(alignment:.leading, spacing: 0.0){
                HStack{
                    Image("Product_Cart")
                        .cornerRadius(5)
                        .padding(.vertical, 10.0)
                        .padding(.leading, 16.0)
                    VStack(alignment: .leading, spacing: 0.0){
                        Text("Terrex Urban Low")
                            .font(.custom("Poppins-SemiBold", size: 14))
                            .foregroundColor(Color("SoftGray"))
                        Text("$143,39")
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundColor(Color("Price"))
                            .padding(.top, 4.0)
                    }
                    
                    Spacer()
                    
                    Image("Icon_Click_Favorite")
                    .padding(.trailing, 20.0)
                }
            }
            .background(Color("Card"))
            .cornerRadius(12)
        }
        .padding(.bottom, 20.0)
        .padding(.horizontal, 30.0)
    }
}

struct FavoriteNotEmpty_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteNotEmpty()
    }
}
