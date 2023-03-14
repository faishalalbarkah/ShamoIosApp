//
//  HomeView.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 10/10/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var Categories = "All Shoes"
    @State private var tabIndex = 0
    
    
    @State private var ColorBG = false
    @State private var FontsColor = false
    @State private var ProfilePage = false
  
//    @State private var DetailPage2 = false
   
    @ObservedObject var viewModel = ViewModels()
    @ObservedObject var viewModelProductsByCategorys = ProductsByCategoryViewModel()
    @ObservedObject var viewModelProductsPoppular = ProductsPoppularViewModel()
    @ObservedObject var viewModelCategorys = CategoryViewModel()
    @ObservedObject var viewModelProductByID = ProductByIDViewModel()
    
    
    
    var body: some View {
        NavigationView{
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(alignment: .leading, spacing: 0.0){
                        HStack(spacing: 0.0){
                            VStack(alignment: .leading, spacing: 0.0){
                                Text("Hallo, Alex")
                                    .font(.custom("Poppins-SemiBold", size: 24))
                                    .foregroundColor(Color("SoftGray"))
                                Text("@alexkeinn")
                                    .font(.custom("Poppins-Regular", size: 16))
                                    .foregroundColor(Color("Gray"))
                            }
                            Spacer()
                            Image("Icon_Profile")
                                .onTapGesture {
                                    self.ProfilePage = true
                                }
                            NavigationLink(destination: ProfileView(), isActive: self.$ProfilePage){EmptyView()}.disabled(true)
                        }
                        .padding(.bottom,30.0)
    //
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack(spacing: 0.0){
                                ForEach(viewModelCategorys.items?.data ?? [], id: \.id) {
                                    item in
                                    ButtonCategories(title: (item.name),
                                                     isOn: Categories == (item.name) ? true : false)
                                        .onTapGesture {
                                            self.Categories = (item.name)
                                            viewModelProductsByCategorys.getProductByCategory(categories: item.id)
                                            print(Categories)
                                        }
                                }
                            }
                        })
                        
                        if Categories == "All Shoes"
                        {
                            VStack (alignment: .leading, spacing: 0.0){
                                Text("Popular Products")
                                    .font(.custom("Poppins-SemiBold", size: 22))
                                    .foregroundColor(Color("SoftGray"))
                                ScrollView(.horizontal, showsIndicators: false, content: {
                                    HStack{
                                        ForEach(viewModelProductsPoppular.itemsProductsPopular?.data ?? [], id: \.id) {
                                            item in
//                                            NavigationLink(
//                                                destination: DetailProduct(item: item), isActive: self.$DetailPage
//                                            ){EmptyView()}.disabled(true)
                                            PoppularComponent(item: item)
//                                                .onTapGesture {
//                                                    self.DetailPage = true
//
//                                                }
                                        }
                                    }
                                })
                            }
                            .padding(.top, 30.0)
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 0.0){
                            Text(Categories == "All Shoes" ? "New Arrivals" : "For You")
                                .font(.custom("Poppins-SemiBold", size: 22))
                                .foregroundColor(Color("SoftGray"))
                                .padding(.bottom, 14.0)
                                .padding(.top, 30.0)
                            if viewModelProductsByCategorys.itemsProductsCategory?.data?.count ?? 0 > 0 {
                                ForEach(viewModelProductsByCategorys.itemsProductsCategory?.data ?? [], id:\.id){
                                    item in
                                    ProductsComponent(item: item)
                                   }
                            } else {
                                Image("No_Data")
                                    .frame(width: 200, height: 120)
                            }
                        }
                        
                    }
                    .padding(.horizontal, 30.0)
                    .padding(.vertical, 30.0)
                     
                })
                .background(Color("PrimaryBG"))
                .navigationBarHidden(true)
                .onAppear(perform:{
                    viewModelProductsByCategorys.getProductByCategory(categories: 1)
                    viewModelProductsPoppular.getProductsPopular()
                    viewModelCategorys.getCategorys()
                    self.ProfilePage = false
                  
                })
    //            .ignoresSafeArea()
            }
//            .navigationBarHidden(true)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
       HomeView()
    }
}
