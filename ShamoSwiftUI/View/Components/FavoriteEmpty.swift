//
//  FavoriteEmpty.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 20/10/22.
//

import SwiftUI

struct FavoriteEmpty: View {
    var body: some View {
        VStack(spacing:0.0){
            Image("Icon_Favorite")
            .padding(.top, 180.0)

            Text("You don't have dream shoes?")
            .font(.custom("Poppins-Medium", size: 16))
            .foregroundColor(Color("SoftGray"))
            .padding(.top, 20.0)

            Text("Let's find your favorite shoes")
            .font(.custom("Poppins-Medium", size: 16))
            .foregroundColor(Color("SubTitle"))
            .padding(.top, 12.0)
            .multilineTextAlignment(.center)

            Button(action: {
                print("Button")
            },  label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .frame(minWidth: 196, maxWidth: 196, minHeight: 50, maxHeight: 50)
                        .foregroundColor(Color("Primary"))
                    Text("Explore Store")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color("SoftGray"))

                }
            })
            .padding(.top, 30.0)
            
        }
        .padding(.horizontal, 50.0)
    }
}

struct FavoriteEmpty_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteEmpty()
    }
}
