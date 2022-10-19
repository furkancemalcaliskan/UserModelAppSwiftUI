//
//  UserViewModel.swift
//  UserModelAppSwiftUI
//
//  Created by Furkan Cemal Çalışkan on 19.10.2022.
//

import Foundation

class UserListViewModel : ObservableObject {
    
    @Published var userList = [UserViewModel]()
    
    private var service : NetworkService
    init(service: NetworkService) {
        
        self.service = service
        
    }
    
    func downloadUsers() async {
        
        var resource = ""
        
        if service.type == "WebService" {
            
            resource = Constants.Urls.usersExtensions
            
        } else {
            
            resource = Constants.Paths.baseUrl
            
        }
        
        do {
            
            let users = try await service.download(Constants.Urls.usersExtensions)
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
