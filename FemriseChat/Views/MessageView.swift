//
//  MessageView.swift
//  FemriseChat
//
//  Created by Muhammad Fasih uz Zaman Siddiqui on 20/11/23.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct MessageView: View {
    var message: Message
    
    var body: some View {
        if message.isFromCurrentUser(){
            HStack{
                
                HStack {
                    Text(message.text)
                        .padding()
                        .background(Color(uiColor: .systemBlue))
                        .cornerRadius(20)
                }
                .frame(maxWidth: 260, alignment: .trailing)
                
                if let photoURL = message.fetchPhotoURL() {
                    WebImage(url: photoURL)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 50, maxHeight:50 , alignment: .top)
                        .cornerRadius(20)
                        .padding(.bottom, 24)
                        .padding(.leading, 4)
                }
                else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 50, maxHeight:50 , alignment: .top)
                        .cornerRadius(20)
                        .padding(.bottom, 24)
                        .padding(.leading, 4)
                        .foregroundColor(.gray)
                }
              
                
            }
            .frame(maxWidth: 360, alignment: .trailing)
            
        }
        else{
            HStack{
                if let photoURL = message.fetchPhotoURL() {
                    WebImage(url: photoURL)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 50, maxHeight:50 , alignment: .top)
                        .cornerRadius(20)
                        .padding(.bottom, 24)
                        .padding(.leading, 4)
                }
                else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 50, maxHeight:50 , alignment: .top)
                        .cornerRadius(20)
                        .padding(.bottom, 24)
                        .padding(.leading, 4)
                        .foregroundColor(.gray)
                }
                HStack {
                    Text(message.text)
                        .padding()
                        .background(Color(uiColor: .systemGray5))
                        .cornerRadius(20)
                }
                .frame(maxWidth: 260, alignment: .leading)
                
            }
            .frame(maxWidth: 360, alignment: .leading)
            
        }
        
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View{
        MessageView(message: Message(userUid: "123", text: "Hello, this is Fasih", photoURL: "", createdAt: Date()))
    }
}
