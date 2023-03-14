//
//  SignInView.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 08/10/22.
//

import SwiftUI

struct SignInView: View {
    
    @State private var Email = ""
    @State private var Password = ""
    @State private var SignUpPage = false
    @State private var HomePage = false
    @State private var isAlert = false
    @State private var SuccessSignIn = false
    
    @ObservedObject var AuthLoginModel = LoginViewModel()
    
    func onLogin () {
        if Email != "" && Password != "" {
            AuthLoginModel.login(email: Email, password: Password, callback: { data in
                print("Cek CallBack \(data)")
                if (UserDefaults.standard.object(forKey: "access_token") != nil)
                {
                    self.SuccessSignIn = true
                }
            })
            self.Email = ""
            self.Password = ""
        } else {
            self.isAlert = true
        }
    }
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(alignment: .leading, spacing: 0.0){
                        Text("Login")
                            .font(.custom("Poppins-SemiBold", size: 24))
                            .foregroundColor(Color("SoftGray"))
                            .padding(.top, 30.0)
                            .padding(.bottom, 2.0)
                        Text("Sign In to Continue")
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundColor(Color("Gray"))
                            .padding(.bottom, 70.0)
                        
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
                                    .foregroundColor(Color("SoftGray"))
                                    .padding()
                            }
                            .frame(minWidth: 315, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                            .background(Color("PrimaryInput"))
                            .cornerRadius(12)
                        }
                        .padding(.bottom, 30)
                        
                        Button(action: {
                            onLogin()
                        },  label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 12)
                                    .frame(minWidth: 315, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                                    .foregroundColor(Color("Primary"))
                                Text("Sign In")
                                    .font(.custom("Poppins-Medium", size: 16))
                                    .foregroundColor(Color("SoftGray"))

                            }
                        })
                        .alert(isPresented: $isAlert) {
                                                Alert(title: Text("Error"), message: Text("Authenticated Failed"), dismissButton: .default(Text("Close")))
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
                            self.SignUpPage = true
                        }
                    NavigationLink(destination: TabFooter(), isActive: self.$SuccessSignIn){EmptyView()}.disabled(true)
                    NavigationLink(destination: SignUpView(), isActive: self.$SignUpPage){EmptyView()}.disabled(true)
                }
                .padding(.top, 10.0)
            })
            .background(Color("PrimaryBG"))
            .ignoresSafeArea()
        }.navigationBarHidden(true)
                
            }
//        }
//    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
