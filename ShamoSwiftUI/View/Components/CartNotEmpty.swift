//
//  CartNotEmpty.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 18/10/22.
//

import SwiftUI

struct CartNotEmpty: View {
    let title: String
    let price: String
    let image: String
    var qty: Int
    let Increment: () -> Void
    let Decrement: () -> Void
    
    var body: some View {
        VStack(spacing: 0.0)
        {
           
            VStack(alignment:.leading, spacing: 0.0){
                HStack{
                    Image(image)
                        .cornerRadius(5)
                        .padding(.top, 10.0)
                        .padding(.leading, 16.0)
                    VStack(alignment: .leading, spacing: 0.0){
                        Text(title)
                            .font(.custom("Poppins-SemiBold", size: 14))
                            .foregroundColor(Color("SoftGray"))
                        Text(price)
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundColor(Color("Price"))
                            .padding(.top, 4.0)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 0.0){
                        Image("Icon_Increment")
                            .onTapGesture {
                                self.Increment()
                                
                            }
                        Text("\(qty)")
                            .font(.custom("Poppins-Medium", size: 14))
                            .foregroundColor(Color("SoftGray"))
                            .padding(.vertical, 2.0)
                        Image("Icon_Decrement")
                            .onTapGesture {
                                if qty != 1
                                {
                                    self.Decrement()
                                }
                                
                            }
                    }
                    .padding(.trailing, 16.0)
                    .padding(.top, 13.0)
                }
                
                
                HStack(spacing: 0.0){
                    Image("Icon_Delete")
                    Text("Remove")
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(Color("Red"))
                        .padding(.leading, 4.0)
                }
                .padding(.vertical, 12.0)
                .padding(.leading, 16.0)
            }
            .background(Color("Card"))
            .cornerRadius(12)
        }
//        .padding(.top, 20.0)
        .padding(.bottom, 10.0)
    }
}

//struct CartNotEmpty_Previews: PreviewProvider {
//    static var previews: some View {
//        CartNotEmpty()
//    }
//}
