//
//  LocalService.swift
//  UserModelAppSwiftUI
//
//  Created by Furkan Cemal Çalışkan on 19.10.2022.
//

import Foundation

enum LocalNetworkError : Error {
    
    case invalidPath
    
}

class LocalService : NetworkService {
    
    var type: String = "LocalService"
    
    func download(_ resource : String) async throws -> [User] {
        
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            
            throw LocalNetworkError.invalidPath
            
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        
        return try JSONDecoder().decode([User].self, from: data)
        }
    
}
