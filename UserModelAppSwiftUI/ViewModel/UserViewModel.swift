//
//  UserViewModel.swift
//  UserModelAppSwiftUI
//
//  Created by Furkan Cemal Çalışkan on 19.10.2022.
//

import Foundation

class UserListViewModel : ObservableObject {
    
    @Published var userList = [UserViewModel]()
    
    let webservice = WebService()
    
    func downloadUsers() async {
        
        do {
            
            let users = try await webservice.download(Constants.Urls.usersExtensions)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
            
        } catch {
            
            
        }
        
    }
    
}

struct UserViewModel {
    
    let user : User
    
    var id : Int {
        
        user.id
        
    }
    
    var name : String {
        
        user.name
        
    }
    
    var username : String {
        
        user.username
        
    }
    
    var email : String {
        
        user.email
        
    }
    
}
