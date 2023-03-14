//
//  DetailProduct.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 29/10/22.
//

import SwiftUI

struct DetailProduct: View {
    
    @ObservedObject var viewModelProductByID = ProductByIDViewModel()
    let item: DataProduct
    @State private var goBack = false
    @State private var btn_Like_Active = false
    @State private var Cart = false
//    @State private var TempByID = AnyObject
//    @State private var Price = 0
    @State private var TempCart = [1,2]
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                let _ = print("Cek Like Button \(goBack)")
                    VStack(alignment:.leading,spacing:0.0){
                        HStack{
//                            Image("Icon_Back_Detail")
//                                .onTapGesture {
//                                    print("Cek Backbutton")
//                                    self.goBack = true
//                                }
//                                
                            NavigationLink(destination: HomeView(), isActive: self.$goBack){EmptyView()}.disabled(true)
                            Spacer()
                            Image("Icon_Cart_Detail")
                        }
                        
                        .padding(.horizontal, 30.0)
                        .padding(.top, 10.0)
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack{
                                Image("Product_Detail_1")
                                Image("Product_Detail_2")
                            }
                        })
                    }
                    .background(Color("Bg_PNG"))
                    .padding(.top,40)
                    
                    VStack(alignment: .leading, spacing: 0.0) {
                        
                        VStack(alignment: .leading, spacing: 0.0){
                            HStack(spacing:0.0){
                                VStack(alignment:.leading,spacing:0.0){
                                    Text(viewModelProductByID.itemDataProduk?.name ?? "")
                                        .font(.custom("Poppins-SemiBold", size: 18))
                                        .foregroundColor(Color("SoftGray"))
                                    Text(viewModelProductByID.itemDataProduk?.tags ?? "")
                                        .font(.custom("Poppins-Regular", size: 12))
                                        .foregroundColor(Color("SubTitle"))
                                }
                                
                                
                                Spacer()
                                if btn_Like_Active {
                                Image("Icon_Love_Button_Active")
                                    .onTapGesture {
                                        self.btn_Like_Active = false
                                        self.goBack = true
                                    }
                                } else {
                                    Image("Icon_Love_Button")
                                        .onTapGesture {
                                            self.btn_Like_Active = true
                                            self.goBack = true
                                        }
                                }
                                
                            }
                            .padding(.vertical, 10.0)
                           
                        
                            HStack{
                                HStack{
                                    Text("Price starts from")
                                        .font(.custom("Poppins-Regular", size: 14))
                                        .foregroundColor(Color("SoftGray"))
                                    Spacer()
                                    Text(String(viewModelProductByID.itemDataProduk?.price ?? 0))
                                        .font(.custom("Poppins-SemiBold", size: 16))
                                        .foregroundColor(Color("Price"))
                                }
                                .padding(.all, 13.0)
                                .cornerRadius(5)
                            }
                            .background(Color("Card"))
                            .padding(.top, 10)
                        
                            VStack(alignment: .leading, spacing: 0.0){
                                HStack{
                                    Text("Description")
                                        .font(.custom("Poppins-Medium", size: 14))
                                        .foregroundColor(Color("SoftGray"))
                                }
                              
                                Text(item.description)
                                    .font(.custom("Poppins-Regular", size: 12))
                                    .foregroundColor(Color("Gray"))
                                    .padding(.top, 10.0)
                                    .frame(width: .infinity,height: 60, alignment: .center).minimumScaleFactor(0.5)
                                
                            }
                            .padding(.top, 20.0)
                            
                            Text("Familiar Shoes")
                                .font(.custom("Poppins-Medium", size: 14))
                                .foregroundColor(Color("SoftGray"))
                                .padding(.top, 15)
                            
                            ScrollView(.horizontal, showsIndicators: false, content: {
                                HStack{
                                    Image("PF_1")
                                    Image("PF_2")
                                    Image("PF_3")
                                    Image("PF_4")
                                    Image("PF_5")
                                    Image("PF_1")
                                }
                            })
                            .padding(.top, 10.0)
                           
                            Button(action: {
                                print("Testing")
                                self.Cart = true
                                PreferenceHelper.saveCart(data: item)
//                                self.TempByID = viewModelProductByID.itemDataProduk
                            },  label: {
                                ZStack{
                                   
                                    RoundedRectangle(cornerRadius: 12)
                                        .frame(minWidth: 315, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                                        .foregroundColor(Color("Primary"))
                                    Text("Add to Cart")
                                        .font(.custom("Poppins-Medium", size: 16))
                                        .foregroundColor(Color("SoftGray"))

                                }
                            })
                            .padding(.vertical, 20.0)
                            .onAppear(perform: {
                                viewModelProductByID.getProductById(id: item.id)
                            })
                        }
                        .padding(.top, 10)
                        .padding(.horizontal, 30.0)
                        .background(Color("PrimaryBG"))
                        }
//                let _ = print("ID State \(TempByID)")
                NavigationLink(destination: CartView(item: item), isActive: self.$Cart){EmptyView()}.disabled(true)
                })
            .ignoresSafeArea()
        }
//        .navigationBarHidden(true)
        }
        
    }


//struct DetailProduct_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailProduct()
//    }
//}
