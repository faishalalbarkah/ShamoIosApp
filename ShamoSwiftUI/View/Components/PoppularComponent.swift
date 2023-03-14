//
//  PoppularComponent.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 11/10/22.
//

import SwiftUI

struct PoppularComponent: View {
//    let categories: String
//    let images: String
//    let Title: String
//    let Price: String
    let item: DataProduct
    @State private var DetailPage = false
    
    var body: some View {
        NavigationLink(destination: DetailProduct(item: item), isActive: self.$DetailPage){EmptyView()}.disabled(true)
        ZStack{
            VStack(alignment: .leading, spacing: 0.0){
                if item.galleries.count > 0
                {
                    AsyncImage(url: URL(string:item.galleries[0].url))
                            .frame(width: 215, height: 120)
                }
                else
                {
                    Image("No_Data")
                        .frame(width: 200, height: 120)
                }
                VStack(alignment: .leading, spacing: 0.0){
                    Text(item.category.name)
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(Color("SubTitle"))
                        .padding(.bottom, 6.0)
                    Text(item.name)
                        .font(.custom("Poppins-SemiBold", size: 18))
                        .foregroundColor(Color("Title"))
                        .padding(.bottom, 6.0)
                    Text(String(item.price))
                        .font(.custom("Poppins-Medium", size: 14))
                        .foregroundColor(Color("Price"))
                        .padding(.bottom, 6.0)
                }
                .padding(.leading, 20.0)
            }
            
            }
            .padding(.top, 30.0)
            .padding(.bottom, 20.0)
            .background(Color("SoftGray"))
            .cornerRadius(20)
            .padding(.top, 14.0)
            .padding(.trailing, 30.0)
            .onTapGesture {
                self.DetailPage = true
            }
        }
       
    }


//struct PoppularComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        PoppularComponent()
//    }
//}
