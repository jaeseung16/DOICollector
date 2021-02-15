//
//  AddDOI.swift
//  DOICollector
//
//  Created by Jae Seung Lee on 2/15/21.
//

import SwiftUI

struct AddDOIView: View {
    @State private var prefix: String = ""
    @State private var suffix: String = ""
    @State private var prefixUpdated = false
    @State private var suffixUpdated = false
    
    @State private var showDOIView = false
    
    @Binding var presenting: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            Form {
                Section(header: Text("Enter a DOI")) {
                    HStack {
                        Text("Prefix:")
                        TextField("Insert prefix", text: $prefix, onCommit: {
                        prefixUpdated = true
                        })
                    }
                    
                    HStack {
                        Text("Suffix:")
                        TextField("Insert suffix", text: $suffix, onCommit: {
                            suffixUpdated = true
                        })
                    }
                    
                }
            }
            
            Link(destination: self.url) {
                Text("\(self.url)")
            }
            
            Button(
                action: {
                    showDOIView = prefixUpdated && suffixUpdated
                },
                label: {
                    HStack {
                        Text("Open DOI")
                    }
                }
            )
            .sheet(isPresented: $showDOIView,
                   onDismiss: {
                    prefixUpdated = false
                    suffixUpdated = false
                   },
                   content: {
                    ShowDOIView(url: self.url, presenting: $showDOIView)
                        .frame(width: 500, height: 500, alignment: .center)
                   }
            )
        }
        .toolbar(content: {
            Button(action: { presenting.toggle() }) {
                Label("Dismiss", systemImage: "xmark.circle")
            }
        })
    }
    
    private var url: URL {
        let urlString = "https://doi.org/\(prefix)/\(suffix)"
        print("urlString = \(urlString)")
        return URL(string: urlString)!
    }
}

struct AddDOIView_Previews: PreviewProvider {
    @State static var presented = true
    
    static var previews: some View {
        AddDOIView(presenting: $presented)
    }
}
