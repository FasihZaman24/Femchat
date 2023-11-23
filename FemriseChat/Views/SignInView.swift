//
//  SignInView.swift
//  FemriseChat
//
//  Created by Muhammad Fasih uz Zaman Siddiqui on 21/11/23.
//

import SwiftUI

struct SignInView: View {
    
    @Binding var showSignIn: Bool
    
    
    var body: some View {
        VStack(spacing: 30){
            Image("femchat")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 500, maxHeight: 600, alignment: .bottom)
                //.clipped()
                
            Spacer()
            
            Text("Welcome To FEMCHAT, Please SignIn!")
                .font(.headline)
                .frame(maxWidth: 400)
            
            
            VStack(spacing: 10){
                Button {
                    print("Apple")
                } label: {
                    Text("Sign in with Apple")
                        .padding()
                        .foregroundColor(.primary)
                        .overlay{
                            RoundedRectangle(cornerRadius: 20)
                                .stroke()
                                .foregroundColor(.primary)
                                .frame(width: 300)
                        }
                }
                .shadow(color: Color.init(uiColor: .label),radius: 15)
                
                
                Button{
                    AuthManager.shared.signInWithGoogle { result in
                        switch result {
                        case.success(_):
                            showSignIn = false
                            
                        case.failure(let error):
                            print(error .localizedDescription)
                        }
                        
                        
                    }
                    
                    
                } label: {
                    Text("Sign in with Google")
                        .padding()
                        .foregroundColor(.primary)
                        .overlay{
                            RoundedRectangle(cornerRadius: 20)
                                .stroke()
                                .foregroundColor(.primary)
                                .frame(width: 300)
                        }
                        .shadow(color: Color.init(uiColor: .label),radius: 15)
                }
                        
                }
            Spacer()
            }
        .edgesIgnoringSafeArea(.top)
        }
    }


#Preview {
    SignInView(showSignIn: .constant(true))
}
