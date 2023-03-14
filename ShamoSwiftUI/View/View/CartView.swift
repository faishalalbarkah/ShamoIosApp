//
//  CartView.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 17/10/22.
//

import SwiftUI

struct PreferenceHelper {
    
    static let keyTempCart: String = "TempCart"
    
    static func getAllCart() -> [DataProduct] {
        let data: [DataProduct] = []
        if let objects = UserDefaults.standard.value(forKey: PreferenceHelper.keyTempCart) as? Data {
            let decoder = JSONDecoder()
            if let objectsDecoded = try? decoder.decode([DataProduct].self, from: objects) as [DataProduct] {
                return objectsDecoded
            } else {
                return data
            }
        } else {
            return data
        }
    }
    
    static func saveCart(data: DataProduct) {
        var datas: [DataProduct] = PreferenceHelper.getAllCart()
        datas.append(data)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(datas){
            UserDefaults.standard.set(encoded, forKey: PreferenceHelper.keyTempCart)
        }
    }
}

struct CartView: View {
    @State private var qty = 1
    @State private var TempCart = [1,2]
    @ObservedObject var viewModelProductById = ProductByIDViewModel()
    @ObservedObject var viewModelCheckout = CheckoutViewModel()
    
    func Increment () {
        self.qty += 1
    }
    
    func Decrement () {
        self.qty -= 1
    }
    
    let item: DataProduct?
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0){
//            let _ = print("State QTY \(qty)")
            let _ =  print("AllCart \(PreferenceHelper.getAllCart())")
//            let _ = print("ID \(item)")
//            HStack(spacing:0.0){
//                HStack(spacing:0.0){
//                        Image("Icon_Back")
//                        Spacer()
//                        Text("Your Cart")
//                        .font(.custom("Poppins-Medium", size: 18))
//                        .foregroundColor(Color("SoftGray"))
//                        Spacer()
//                    }
//                .padding(.horizontal, 30.0)
//            }
//            .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
//            .background(Color("Black"))
//            Spacer()
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading, spacing: 0.0){
                    ForEach(PreferenceHelper.getAllCart(), id:\.id){
                        item in
                        CartNotEmpty(title: item.name, price: "\(item.price)", image: "6dAZKeQ9y5WlXfI8aubMwnQfynua7aOD9jn5kyV8.png" , qty: qty, Increment: Increment, Decrement: Decrement)
                    }
                    
                }
                .padding(.horizontal, 30.0)
            }
            .background(Color("PrimaryBG"))
            .padding(.top, -10.0)
            Spacer()
            VStack(alignment: .leading, spacing: 0.0){
                HStack(spacing: 0.0){
                    Text("Subtotal")
                    .font(.custom("Poppins-Regular", size: 14))
                    .foregroundColor(Color("SoftGray"))
                    Spacer()
                    Text("$143,39")
                        .font(.custom("Poppins-Regular", size: 14))
                        .foregroundColor(Color("Price"))
                }
                .padding(.bottom, 30.0)
                .padding(.top, 15.0)
                .padding(.horizontal, 30.0)
                
                Button(action: {
                    print("test")
//                    TempCart.append(100)
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
                .padding(.bottom, 20.0)
            }
            .background(Color("Black"))
            .padding(.top, -10.0)
        }
        .navigationBarHidden(true)
    }
}

//struct CartView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartView()
//    }
//}
