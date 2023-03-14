//
//  CheckoutView.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 18/10/22.
//

import SwiftUI

struct PaymentSummary: View{
    var body: some View {
        VStack(alignment:.leading, spacing: 0.0){
            VStack(alignment:.leading, spacing: 0.0){
                    Text("Payment Summary")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color("SoftGray"))
                        .padding(.bottom, 5.0)
                
                HStack(spacing:0.0){
                    Text("Product Quantity")
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(Color("SubTitle"))
                    Spacer()
                    Text("2 Items")
                        .font(.custom("Poppins-Medium", size: 14))
                        .foregroundColor(Color("SoftGray"))
                    
                }
                .padding(.vertical, 5.0)
                
                HStack(spacing:0.0){
                    Text("Product Price")
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(Color("SubTitle"))
                    Spacer()
                    Text("$575.96")
                        .font(.custom("Poppins-Medium", size: 14))
                        .foregroundColor(Color("SoftGray"))
                    
                }
                .padding(.vertical, 5.0)
                
                HStack(spacing:0.0){
                    Text("Shipping")
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(Color("SubTitle"))
                        

                    Spacer()
                    Text("Free")
                        .font(.custom("Poppins-Medium", size: 14))
                        .foregroundColor(Color("SoftGray"))
                    
                }
                .padding(.vertical, 5.0)
                
                Divider()
                    .background(Color("SubTitle"))
                    .padding(.vertical, 10.0)
                
                HStack(spacing:0.0){
                    Text("Total")
                        .font(.custom("Poppins-SemiBold", size: 14))
                        .foregroundColor(Color("Price"))
                        

                    Spacer()
                    Text("$575.92")
                        .font(.custom("Poppins-SemiBold", size: 14))
                        .foregroundColor(Color("Price"))
                }
                .padding(.vertical, 5.0)
            }
            .padding(.all, 30.0)
        }
        .background(Color("Card"))
        .cornerRadius(12)
        .padding(.bottom, 12.0)
    }
}

struct AddressDetail: View{
    var body: some View {
        VStack(alignment:.leading, spacing: 0.0){
            VStack(alignment:.leading, spacing: 0.0){
                    Text("Address Details")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color("SoftGray"))
                
                HStack(spacing:0.0){
                    Image("Icon_Address")
                    VStack(alignment:.leading, spacing: 0.0){
                        Text("Store Location")
                            .font(.custom("Poppins-Regular", size: 10))
                            .foregroundColor(Color("SubTitle"))
                            .padding(.bottom, 2.0)
                        Text("Adidas Core")
                            .font(.custom("Poppins-Medium", size: 12))
                            .foregroundColor(Color("SoftGray"))
                    }
                    .padding(.vertical, 2.0)
                }
                .padding(.top, 10.0)
                .padding(.bottom, 20.0)
                
                HStack(spacing:0.0){
                    Image("Icon_Address")
                    VStack(alignment:.leading, spacing: 0.0){
                        Text("Store Location")
                            .font(.custom("Poppins-Regular", size: 10))
                            .foregroundColor(Color("SubTitle"))
                            .padding(.bottom, 2.0)
                        Text("Adidas Core")
                            .font(.custom("Poppins-Medium", size: 12))
                            .foregroundColor(Color("SoftGray"))
                    }
                    .padding(.vertical, 2.0)
                    Spacer()
                }
                .padding(.top, 10.0)
            }
            .padding(.all, 30.0)
        }
        .background(Color("Card"))
        .cornerRadius(12)
        .padding(.bottom, 12.0)
//        .padding(.top, 20.0)
    }
}

struct CardItems: View{
    var body: some View {
        VStack(alignment:.leading, spacing: 0.0){
            VStack(spacing: 0.0){
                HStack{
                    Image("Product_Cart")
                        .cornerRadius(5)
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
                    
                    Text("2 Items")
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(Color("SubTitle"))
                        .padding(.trailing, 12.0)
                }
            }
            .padding(.vertical, 10.0)
            
        }
        .background(Color("Card"))
        .cornerRadius(12)
        .padding(.bottom, 12.0)
    }
}

struct CheckoutView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0){
            HStack(spacing:0.0){
                HStack(spacing:0.0){
                        Image("Icon_Back")
                        Spacer()
                        Text("Checkout Details")
                        .font(.custom("Poppins-Medium", size: 18))
                        .foregroundColor(Color("SoftGray"))
                        Spacer()
                    }
                .padding(.horizontal, 30.0)
            }
            .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            .background(Color("Black"))
            Spacer()
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(alignment: .leading, spacing: 0.0){
                    
                    Text("List Items")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color("SoftGray"))
                        .padding(.bottom, 12.0)
                    
                    CardItems()
                    CardItems()
                    
                    //Address
                    AddressDetail()
                    
                    //Payment Summary
                    PaymentSummary()
                    
                }
                .padding(.top, 20.0)
                .padding(.bottom, 10.0)
                
                }
            .padding(.horizontal, 30.0)
            Spacer()
            VStack(alignment: .leading, spacing: 0.0){
                Button(action: {
                    print("test")
                },  label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 12)
                            .frame(minWidth: 315, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                            .foregroundColor(Color("Primary"))
                        HStack(spacing:0.0){
                            Text("Continue to Checkout")
                                .font(.custom("Poppins-Medium", size: 16))
                                .foregroundColor(Color("SoftGray"))
                            Spacer()
                            Image("Icon_Next")
                        }
                        .padding(.horizontal, 20.0)

                    }
                })
                .padding(.horizontal, 30.0)
                .padding(.vertical, 20.0)
            }
            .background(Color("Black"))
            .padding(.top, -10.0)
            }
            .background(Color("PrimaryBG"))
            .padding(.top, -10.0)
           
            
        }
    }


struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
