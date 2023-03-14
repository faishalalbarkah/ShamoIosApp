//
//  ButtonCategories.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 11/10/22.
//

import SwiftUI

struct ButtonCategories: View {
    
    let title: String
    let isOn: Bool
    
    var onColors = Color("Primary")
    var offColors = Color("PrimaryBG")
    
    var offBorder = Color("Gray")
    var onBorder = Color("PrimaryBG")
    
    var body: some View {
        
        HStack(spacing: 0.0){
            HStack{
                Text(title)
                    .font(.custom("Poppins-Medium", size: 13))
                    .foregroundColor(Color("SoftGray"))
            }
            .padding(.vertical, 10.0)
            .padding(.horizontal, 12.0)
        }
        .background(self.isOn ? self.onColors : self.offColors)
        .cornerRadius(12)
        .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(self.isOn ? self.onBorder : self.offBorder, lineWidth: 0.5)
            )
        .padding(.trailing, 16.0)
        .onAppear()
        {
            print(isOn)
        }
    }
}

