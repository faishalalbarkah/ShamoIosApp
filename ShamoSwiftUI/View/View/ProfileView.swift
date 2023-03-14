//
//  ProfileView.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 11/10/22.
//

import SwiftUI

struct ChildView: View {
    let Subtitle: String
    var body: some View {
        HStack(spacing: 0.0){
            Text(Subtitle)
                .font(.custom("Poppins-Regular", size: 13))
                .foregroundColor(Color("SubTitle"))
            Spacer()
            Image("Icon_Arrow")
        }
        .padding(.vertical, 16.0)
    }
}

struct ParentView: View {
    
    let Title : String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0){
            Text(Title)
                .font(.custom("Poppins-SemiBold", size: 16))
                .foregroundColor(Color("SoftGray"))
            
            ChildView(Subtitle: Title == "Account" ? "Edit Profile" : "Privacy & Policy")
            ChildView(Subtitle: Title == "Account" ? "Your Orders" : "Term of Service")
            ChildView(Subtitle: Title == "Account" ? "Help" : "Rate App")
        }
    }
}


struct ProfileView: View {
    
    @State private var Check_token = false
    @ObservedObject var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(alignment: .leading, spacing: 0.0){
                    HStack(spacing: 0.0){
                        Image("Icon_Profile")
                            .padding(.trailing, 16.0)
                           
                        VStack(alignment: .leading, spacing: 0.0){
//                            let _ = print("Check User \(viewModel.itemUser?.username)")
                            Text((viewModel.itemUser?.username ?? ""))
                                .font(.custom("Poppins-SemiBold", size: 24))
                                .foregroundColor(Color("SoftGray"))
                            Text((viewModel.itemUser?.email ?? ""))
                                .font(.custom("Poppins-Regular", size: 16))
                                .foregroundColor(Color("Gray"))
                        }
                        Spacer()
                        Image("Icon_Logout")
                            .onTapGesture {
                                UserDefaults.standard.removeObject(forKey: "access_token")
                                self.Check_token = true
                            }
                    }
                    .padding(.bottom,30.0)
                    ParentView(Title: "Account")
                        .padding(.top, 50.0)
                    
                    ParentView(Title: "General")
                        .padding(.top, 30.0)
                }
                .padding(.horizontal, 30.0)
                .padding(.vertical, 30.0)
                NavigationLink(destination: SignInView(), isActive: self.$Check_token){EmptyView()}.disabled(true)
            })

            .background(Color("PrimaryBG"))
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
