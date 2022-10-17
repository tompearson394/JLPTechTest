//
//  JLPTechTestApp.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 30/09/2022.
//

import SwiftUI

@main
struct JLPTechTestApp: App {
    
    @StateObject private var coordinator = Coordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                coordinator.makeInitialView()
                    .navigationDestination(for: Screen.self) { screen in
                        coordinator.viewForScreen(screen)
                    }
            }
            .font(.jlpBody)
            .onAppear {
                UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont.jlpLargeNavigationBarTitleFont]
                UINavigationBar.appearance().titleTextAttributes = [.font: UIFont.jlpNavigationBarTitleFont]
                UIPageControl.appearance().currentPageIndicatorTintColor = .black
                UIPageControl.appearance().pageIndicatorTintColor = .black.withAlphaComponent(0.2)
            }
        }
    }
}
