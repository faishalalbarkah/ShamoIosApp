//
//  CheckoutSuccessView.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 20/10/22.
//

import SwiftUI

struct CheckoutSuccessView: View {
    var body: some View {
        VStack(spacing: 0.0){
            HStack(spacing:0.0){
                HStack(spacing:0.0){
                        Image("Icon_Back")
                        Spacer()
                        Text("Checkout Success")
                        .font(.custom("Poppins-Medium", size: 18))
                        .foregroundColor(Color("SoftGray"))
                        Spacer()
                    }
                .padding(.horizontal, 30.0)
            }
            .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            .background(Color("Black"))
            
            //Start
            VStack(spacing:0.0){
                Image("Icon_Cart")
                .padding(.top, 180.0)

                Text("You made a transaction")
                .font(.custom("Poppins-Medium", size: 16))
                .foregroundColor(Color("SoftGray"))
                .padding(.top, 20.0)

                Text("Stay at home while we \nprepare your dream shoes")
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
                        Text("Order Other Shoes")
                            .font(.custom("Poppins-Medium", size: 16))
                            .foregroundColor(Color("SoftGray"))

                    }
                })
                .padding(.top, 30.0)
                
                Button(action: {
                    print("Button")
                },  label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 12)
                            .frame(minWidth: 196, maxWidth: 196, minHeight: 50, maxHeight: 50)
                            .foregroundColor(Color("Gray"))
                        Text("View My Order")
                            .font(.custom("Poppins-Medium", size: 16))
                            .foregroundColor(Color("SubTitle"))

                    }
                })
                .padding(.top, 20.0)
            }
            .padding(.horizontal, 50.0)
            //End
            Spacer()
        }.background(Color("PrimaryBG"))
    }
}

struct CheckoutSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutSuccessView()
    }
}
