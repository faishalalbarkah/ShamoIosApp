//
//  CartEmpty.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 18/10/22.
//

import SwiftUI

struct CartEmpty: View {
    var body: some View {
        
        VStack(spacing:0.0){
            Image("Icon_Cart")
            .padding(.top, 180.0)

            Text("Opss! Your Cart is Empty")
            .font(.custom("Poppins-Medium", size: 16))
            .foregroundColor(Color("SoftGray"))
            .padding(.top, 20.0)

            Text("Let's find your favorite shoes")
            .font(.custom("Poppins-Medium", size: 16))
            .foregroundColor(Color("SubTitle"))
            .padding(.top, 12.0)

            Button(action: {
                print("Button")
            },  label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .frame(minWidth: 120, maxWidth: 152, minHeight: 44, maxHeight: 44)
                        .foregroundColor(Color("Primary"))
                    Text("Explore Store")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color("SoftGray"))

                }
            })
            .padding(.top, 20.0)
        }
        .padding(.horizontal, 50.0)
    }
}

struct CartEmpty_Previews: PreviewProvider {
    static var previews: some View {
        CartEmpty()
    }
}
