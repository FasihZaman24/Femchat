//
//  Message.swift
//  FemriseChat
//
//  Created by Muhammad Fasih uz Zaman Siddiqui on 21/11/23.
//

import Foundation

struct Message: Decodable, Identifiable {
    
    enum MessageError{
        case noPhotoURL
    }
    
    let id = UUID()
    let userUid: String
    let text: String
    let photoURL: String?
    let createdAt: Date
    
    func isFromCurrentUser() -> Bool {
        guard let CurrUser = AuthManager.shared.getCurrentUser() else {
            return false
        }
        
        if CurrUser.uid == userUid {
            return true
        } else {
            return false
        }
    }
    
    func fetchPhotoURL() -> URL?{
        guard let photoURLString = photoURL, let url = URL(string: photoURLString) else {
            return nil
        }
        return url
    }
}
