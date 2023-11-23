//
//  ChatViewModel.swift
//  FemriseChat
//
//  Created by Muhammad Fasih uz Zaman Siddiqui on 21/11/23.
//

import SwiftUI
import Foundation

class ChatViewModel: ObservableObject {
    
    @Published var messages = [Message]()
    
    @Published var mockData = [
        
        Message(userUid: "12345", text: "Hello Hunny Bunny.", photoURL: "", createdAt: Date()),
        Message(userUid: "12346", text: "You are my sunshine.", photoURL: "", createdAt: Date()),
        Message(userUid: "12347", text: "Loose Yourself.", photoURL: "", createdAt: Date()),
        Message(userUid: "12347", text: "All glitter is not gold.", photoURL: "", createdAt: Date()),
        Message(userUid: "12345", text: "Hello Hunny Bunny.", photoURL: "", createdAt: Date()),
        Message(userUid: "12346", text: "You are my sunshine.", photoURL: "", createdAt: Date()),
        Message(userUid: "12347", text: "Loose Yourself.", photoURL: "", createdAt: Date()),
        Message(userUid: "12347", text: "All glitter is not gold.", photoURL: "", createdAt: Date()),
        Message(userUid: "12345", text: "Hello Hunny Bunny.", photoURL: "", createdAt: Date()),
        Message(userUid: "12346", text: "You are my sunshine.", photoURL: "", createdAt: Date()),
        Message(userUid: "12347", text: "Loose Yourself.", photoURL: "", createdAt: Date()),
        Message(userUid: "12347", text: "All glitter is not gold.", photoURL: "", createdAt: Date())
    
    ]
    
    init() {
        DatabaseManager.shared.fetchMessages { [weak self] result in
            switch result {
            case.success(let msgs):
                self?.messages = msgs
            case.failure(let error):
                print(error)
                
            }
            
        }
    }
    
    func sendMessage(text: String, completion: @escaping(Bool) -> Void) {
        
        guard let user = AuthManager.shared.getCurrentUser() else{
            return
        }
        let msg = Message(userUid: user.uid, text: text, photoURL: user.photoURL, createdAt: Date())
        DatabaseManager.shared.sendMessageToDataBase(message: msg) {[weak self]  success in
            if success {
                self?.messages.append(msg)
                completion(true)
            } else {
                completion(false)
            }
            
        }
        }
    }
