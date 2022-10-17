//
//  LoadableView.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 30/09/2022.
//

import SwiftUI

struct LoadableView<T, Content>: View where Content: View {
    private let state: ViewState<T>
    private let load: () async -> Void
    @ViewBuilder private let content: (T) -> Content
    
    init(state: ViewState<T>, load: @escaping () async -> Void, @ViewBuilder content: @escaping (T) -> Content) {
        self.state = state
        self.load = load
        self.content = content
    }
    
    var body: some View {
        switch state {
        case .loading:
            ProgressView()
                .task {
                    await load()
                }
        case .loaded(let loadedState):
            content(loadedState)
        case .error(let error):
            ErrorRetryView(error: error) {
                await load()
            }
        }
    }
}
