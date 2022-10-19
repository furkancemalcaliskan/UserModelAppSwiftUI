//
//  NetworkService.swift
//  UserModelAppSwiftUI
//
//  Created by Furkan Cemal Çalışkan on 19.10.2022.
//

import Foundation

protocol NetworkService {
    
    func download(_ resource: String) async throws -> [User]
    var type : String { get }
    
}
