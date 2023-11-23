//
//  ChatView.swift
//  FemriseChat
//
//  Created by Muhammad Fasih uz Zaman Siddiqui on 20/11/23.
//

import SwiftUI


struct ChatView: View {
    
    @StateObject var chatViewModel = ChatViewModel()
    @State var text = ""
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false){
                
                VStack (spacing: 8){
                    ForEach(chatViewModel.messages) { message in
                        MessageView(message: message)
                    }
                }
            }
            
            HStack {
                TextField("Hey there", text: $text, axis: .vertical)//allow multiline texts
                //.background(.red)
                    .padding()
                    .background(Color(uiColor: .systemGray5))
                    .cornerRadius(10)
                
                Button {
                    if text.count > 2 {
                        chatViewModel.sendMessage(text: text) { success in
                            if success {
                                
                                
                            } else {
                                print("Error Sending Message")
                            }
                            
                        }
                        text = ""
                    }
                    
                } label: {
                    Image(systemName: "paperplane.fill")
                        .padding()
                        .background(.ultraThickMaterial)
                        .cornerRadius(10)
                        .padding(.trailing)
                }
                
                
            }
            
        }
    }
}
#Preview {
    ChatView()
}
