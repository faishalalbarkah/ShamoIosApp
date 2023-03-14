//
//  SignUpView.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 09/10/22.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var FullName: String = ""
    @State private var Password: String = ""
    @State private var Username: String = ""
    @State private var Email: String = ""
    
    @State private var SignInPage = false
    @State private var SuccessSignUp = false
    @State private var isAlert = false
    
    @ObservedObject var AuthRegisModel = RegisterViewModel()
    
    func OnRegister () {
        if FullName != "" && Password != "" && Username != "" && Email != ""
        {
            AuthRegisModel.register(
                name: FullName, username: Username, email: Email, password: Password, callback: { data in
                    print(data)
                    if (UserDefaults.standard.object(forKey: "access_token") != nil)
                    {
                        self.SuccessSignUp = true
                    }
                }
            )
            self.FullName = ""
            self.Username = ""
            self.Password = ""
            self.Email = ""
            
        } else {
            self.isAlert = true
            Swift.print("Response View Failed \(AuthRegisModel.resMessage)")
//            Swift.print("lengkapi Field")
        }
    }
    
    var body: some View {
       
        NavigationView{
            ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(alignment: .leading, spacing: 0.0){
                        Text("Sign Up")
                            .font(.custom("Poppins-SemiBold", size: 24))
                            .foregroundColor(Color("SoftGray"))
                            .padding(.top, 30.0)
                            .padding(.bottom, 2.0)
                        Text("Register and Happy Shopping")
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundColor(Color("Gray"))
                            .padding(.bottom, 50.0)
                        
                        //FullName
                        VStack(alignment:.leading, spacing: 0.0){
                            Text("Full Name")
                                .font(.custom("Poppins-Medium", size: 16))
                                .foregroundColor(Color("SoftGray"))
                                .padding(.bottom, 12.0)
                            
                            HStack{
                                Image("Icon_Email")
                                    .padding(.vertical, 19.0)
                                    .padding(.horizontal, 17.0)
                                TextField("Your Full Name", text: $FullName)
                                    .disableAutocorrection(true)
                                    .padding()
                                    .foregroundColor(Color("SoftGray"))
                            }
                            .frame(minWidth: 315, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                            .background(Color("PrimaryInput"))
                            .cornerRadius(12)
                        }
                        .padding(.bottom, 20.0)
                        
                        //UserName
                        VStack(alignment:.leading, spacing: 0.0){
                            Text("Username")
                                .font(.custom("Poppins-Medium", size: 16))
                                .foregroundColor(Color("SoftGray"))
                                .padding(.bottom, 12.0)
                            
                            HStack{
                                Image("Icon_Password")
                                    .padding(.vertical, 19.0)
                                    .padding(.horizontal, 17.0)
                                TextField("Your Username", text: $Username)
                                    .disableAutocorrection(true)
                                    .padding()
                                    .foregroundColor(Color("SoftGray"))
                            }
                            .frame(minWidth: 315, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                            .background(Color("PrimaryInput"))
                            .cornerRadius(12)
                        }
                        .padding(.bottom, 30)
                        
                        //Email
                        VStack(alignment:.leading, spacing: 0.0){
                            Text("Email Address")
                                .font(.custom("Poppins-Medium", size: 16))
                                .foregroundColor(Color("SoftGray"))
                                .padding(.bottom, 12.0)
                            
                            HStack{
                                Image("Icon_Email")
                                    .padding(.vertical, 19.0)
                                    .padding(.horizontal, 17.0)
                                TextField("Your Email Address", text: $Email)
                                    .disableAutocorrection(true)
                                    .padding()
                                    .foregroundColor(Color("SoftGray"))
                            }
                            .frame(minWidth: 315, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                            .background(Color("PrimaryInput"))
                            .cornerRadius(12)
                        }
                        .padding(.bottom, 20.0)
                        
                        //Password
                        VStack(alignment:.leading, spacing: 0.0){
                            Text("Password")
                                .font(.custom("Poppins-Medium", size: 16))
                                .foregroundColor(Color("SoftGray"))
                                .padding(.bottom, 12.0)
                            
                            HStack{
                                Image("Icon_Password")
                                    .padding(.vertical, 19.0)
                                    .padding(.horizontal, 17.0)
                                SecureField("Your Password", text: $Password)
                                    .disableAutocorrection(true)
                                    .padding()
                                    .foregroundColor(Color("SoftGray"))
                            }
                            .frame(minWidth: 315, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                            .background(Color("PrimaryInput"))
                            .cornerRadius(12)
                        }
                        .padding(.bottom, 30)
                        
//                        Text(ViewModel.resMessage)
                        
                        Button(action: {
//                            print("Faisal")
                            OnRegister()
                            
                        },label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 12)
                                        .frame(minWidth: 315, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                                        .foregroundColor(Color("Primary"))
                                    Text("Sign In")
                                        .font(.custom("Poppins-Medium", size: 16))
                                        .foregroundColor(Color("SoftGray"))
                                }
                                
                            }
                        )
                        .alert(isPresented: $isAlert) {
                                                Alert(title: Text("Error"), message: Text("Complete Your Fields"), dismissButton: .default(Text("Got it!")))
                                            }
                       
                    }
                    .padding(.horizontal, 30.0)
                    .padding(.top, 30.0)
                
                HStack(alignment:.center){
                    Text("Don't have an account?")
                        .foregroundColor(Color("Gray"))
                        .font(.custom("Poppins-Regular", size: 12))
                    
                    Text("Sign Up")
                        .foregroundColor(Color("Primary"))
                        .font(.custom("Poppins-Bold", size: 12))
                        .onTapGesture {
                            self.SignInPage = true
                        }
                    NavigationLink(destination: TabFooter(), isActive: self.$SuccessSignUp){EmptyView()}.disabled(true)
                }
                .padding(.top, 10.0)
                
                
            })
            .background(Color("PrimaryBG"))
            .ignoresSafeArea()
        }
        .navigationBarHidden(true)
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
