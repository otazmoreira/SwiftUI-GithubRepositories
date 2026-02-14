//
//  ListScreen.swift
//  GithubProfiles
//
//  Created by Otávio Moreira on 12/02/26.
//

import SwiftUI

struct ListScreen : View {
    @StateObject var viewModel: ListViewModel
    
    var body : some View {
        VStack {
            TextField("Github username", text: $viewModel.username)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Spacer()
            
            Button {
                viewModel.loadRepositories()
            } label: {
                Text("Load repositories")
            }
            .buttonStyle(.borderless)
                .springLoadingBehavior(.automatic)
            
            List(viewModel.repositories ?? [], id: \.id) { repository in
                RepositoryCard(name: repository.name)
            }.frame(maxHeight: .infinity)
                
        }
    }
}

//#Preview {
//    ListScreen()
//}

