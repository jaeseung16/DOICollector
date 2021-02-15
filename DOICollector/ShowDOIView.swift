//
//  ShowDOIView.swift
//  DOICollector
//
//  Created by Jae Seung Lee on 2/15/21.
//

import SwiftUI

struct ShowDOIView: View {
    @State var url: URL
    @Binding var presenting: Bool
    
    var body: some View {
        VStack {
            Link(destination: self.url) {
                Text("\(self.url)")
            }
            
            WebView(url: self.url)
        }
        .toolbar(content: {
            Button(action: { presenting.toggle() }) {
                Label("Dismiss", systemImage: "xmark.circle")
            }
        })
    }
}

struct ShowDOIView_Previews: PreviewProvider {
    @State static var presented = true
    @State static var url = URL(string: "https://doi.org/10.1103/PhysRevLett.94.150504")!
    
    static var previews: some View {
        ShowDOIView(url: url, presenting: $presented)
    }
}
