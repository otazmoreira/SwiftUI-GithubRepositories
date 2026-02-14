//
//  GithubProfilesApp.swift
//  GithubProfiles
//
//  Created by Otávio Moreira on 12/02/26.
//

import SwiftUI
//import CoreData

@main
struct GithubProfilesApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ListScreen(viewModel: makeListViewModel())
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

func makeListViewModel() -> ListViewModel {
    return ListViewModel(
        getRepositoriesUseCase: GetRepositoriesUseCase(
            repositoriesRepository: RepositoriesRepositoryImpl(
                api: GitHubApiClientImpl()
            )
        )
    )
}
