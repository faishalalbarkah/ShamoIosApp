//
//  SplashScreenView.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 08/10/22.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    var body: some View {
        if isActive {
            if (UserDefaults.standard.object(forKey: "access_token") != nil)
            {
                TabFooter()
            } else {
                SignInView()
            }

//           )
        } else {
            ZStack{
                Color("PrimaryBG")
                    .ignoresSafeArea()
                
                Image("Splash")
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    print("Cek Token \(UserDefaults.standard.object(forKey: "access_token"))")
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
