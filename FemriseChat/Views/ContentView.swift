//
//  ContentView.swift
//  FemriseChat
//
//  Created by Muhammad Fasih uz Zaman Siddiqui on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var showSignIn: Bool = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                ChatView()
            }
            .navigationTitle("Chat Room")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        do{
                           try AuthManager.shared.signOut()
                            showSignIn = true
                        }
                        catch{
                            print("Error Signning Out")
                        }
                    } label: {
                        Text("Sign Out")
                            .foregroundColor(.red)
                    }
                    .fullScreenCover(isPresented: $showSignIn) {
                        SignInView(showSignIn: $showSignIn)
                    }
                }
            }
            .onAppear{
                showSignIn = AuthManager.shared.getCurrentUser() == nil
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
