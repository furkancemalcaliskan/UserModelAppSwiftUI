//
//  WebService.swift
//  UserModelAppSwiftUI
//
//  Created by Furkan Cemal Çalışkan on 19.10.2022.
//

import Foundation
import Alamofire


enum NetworkError : Error {
    
    case invalidUrl
    case invalidServerResponse
    
}

class WebService : NetworkService {
    
    var type: String = "WebService"
    
    func download(_ resource : String) async throws -> [User] {
        
        guard let url = URL(string: resource) else {
            
            throw NetworkError.invalidUrl
        }
        
        /* AF.request(url, method: .get).responseDecodable(of: User.self) { response in
            
            switch response.result {
                
            case .success(let data):
                let value = data.
                self.quoteList += value
            case .failure(let error):
                error = NetworkError.invalidServerResponse
                
            }
            
        }*/
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            
                throw NetworkError.invalidServerResponse
            
        }
        return try JSONDecoder().decode([User].self, from: data)
    }
    
    
}
