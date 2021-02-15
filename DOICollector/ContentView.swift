//
//  ContentView.swift
//  DOICollector
//
//  Created by Jae Seung Lee on 2/15/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Citation.date, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Citation>

    @State private var showAddDOIView = false
    
    var body: some View {
        List {
            ForEach(items) { item in
                Text("Item at \(item.created!, formatter: itemFormatter)")
            }
            .onDelete(perform: deleteItems)
        }
        .toolbar {
            Button(action: { self.showAddDOIView = true }) {
                Label("Add Item", systemImage: "plus")
            }
            .sheet(isPresented: $showAddDOIView, content: {
                AddDOIView(presenting: $showAddDOIView)
                    .frame(width: 500, height: 500, alignment: .center)
            })
        }
    }

    private func addItem() {
        /*
        withAnimation {
            let newItem = Citation(context: viewContext)
            newItem.created = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
        */
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
