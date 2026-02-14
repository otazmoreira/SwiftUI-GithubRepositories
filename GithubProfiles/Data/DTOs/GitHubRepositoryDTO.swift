//
//  GitHubUserDTO.swift
//  GithubProfiles
//
//  Created by Otávio Moreira on 12/02/26.
//

import Foundation

struct GitHubRepositoryDTO: Decodable {
    
    let id: Int
    let name: String
    
    enum CodingKeys: CodingKey {
        case id
        case name
    }
}
