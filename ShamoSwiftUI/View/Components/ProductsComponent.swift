//
//  ProductsComponent.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 10/10/22.
//

import SwiftUI

struct ProductsComponent: View {
    let item: DataProduct
    @State private var DetailPage2 = false
    var body: some View {
        NavigationLink(destination: DetailProduct(item: item), isActive: self.$DetailPage2){EmptyView()}.disabled(true)
        HStack(spacing: 0.0){
//            Image(images)
            if item.galleries.count > 0
            {
                AsyncImage(url: URL(string: item.galleries[0].url))
                    .frame(width: 120, height: 120)
                    .cornerRadius(10)
            } else {
                Image("No_Data")
                    .frame(width: 120, height: 120)
                    .cornerRadius(10)
            }
            VStack (alignment: .leading, spacing: 0.0){
                Text(item.category.name)
                    .font(.custom("Poppins-Regular", size: 12))
                    .foregroundColor(Color("SubTitle"))
                
                Text(item.name)
                    .font(.custom("Poppins-SemiBold", size: 16))
                    .foregroundColor(Color("SoftGray"))
                    .padding(.vertical, 6.0)
                
                Text(String(item.price))
                    .font(.custom("Poppins-Medium", size: 14))
                    .foregroundColor(Color("Price"))
            }
            .padding(.leading, 12.0)
        }
        .padding(.bottom, 30.0)
        .onTapGesture {
//                                            viewModelProductByID.getProductById(id: item.id)
            self.DetailPage2 = true
        }
    }
}

//struct ProductsComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductsComponent
//    }
//}
