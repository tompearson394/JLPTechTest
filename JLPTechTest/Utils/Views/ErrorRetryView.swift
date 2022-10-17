//
//  ErrorRetryView.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 30/09/2022.
//

import SwiftUI

struct ErrorRetryView: View {
    let error: Error
    let retryAction: () async -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.title)
                .foregroundColor(.yellow)
            
            Text("Whoops, an error occured")
                .font(.title2)
            
            #if DEBUG
            Text(error.localizedDescription)
                .multilineTextAlignment(.center)
            #endif
            
            Button("Retry") {
                Task {
                    await retryAction()
                }
            }
            .font(.title2)
        }
        .padding()
    }
}

struct ErrorRetryView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorRetryView(error: NSError(domain: "This is the error message", code: 123), retryAction: {})
    }
}

