//
//  RepositoryCard.swift
//  GithubProfiles
//
//  Created by Otávio Moreira on 12/02/26.
//

import SwiftUI

struct RepositoryCard : View {
    let name: String
    
    var body: some View {
        HStack {
            Text(name)
        }.padding()
    }
}

#Preview {
    RepositoryCard(name: "iOS")
}
