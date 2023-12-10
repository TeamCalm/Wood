//
//  TreeListView.swift
//  Woods
//
//  Created by Johannes Ahlborn on 10.12.23.
//

import SwiftUI

struct TreeListView: View {
    
    var body: some View {
        NavigationStack {
            List(treesVM.treeVMs) { viewModel in
                TreeView(name: viewModel.name,isFavorite: viewModel.isFavorite)
                    .swipeActions {
                        Button(role: .destructive) {
                            viewModel.deleteTree()
                        } label: {
                            Label("Löschen", systemImage: "trash")
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button {
                            viewModel.favoriteTree()
                        } label: {
                            Label("Favorit", systemImage: "heart.fill")
                        }
                        .tint(.blue)
                    }
            }
            .navigationTitle("trees")
            .toolbar {
                Button(action: createTree) {
                    Image(systemName: "plus.circle.fill")
                }
            }
            .sheet(isPresented: $showAddTree) {
                TreeDetailView(isPresented: $showAddTree)
            }
        }
    }
    
    
    // MARK: Variables
    
    @StateObject private var treesVM = TreesVM()
    
    @State private var showAddTree = false
    
    
    
    // MARK: - Functions
    
    private func createTree() {
        showAddTree.toggle()
    }
    
}

struct TreeListView_Previews: PreviewProvider {
    static var previews: some View {
        TreeListView()
    }
}

