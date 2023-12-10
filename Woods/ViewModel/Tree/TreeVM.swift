//
//  TreeViewModel.swift
//  Woods
//
//  Created by Johannes Ahlborn on 10.12.23.
//

import Foundation

class TreeVM: ObservableObject, Identifiable {
    
    init(tree: Tree) {
        self.tree = tree
        
        self.id = tree.id ?? UUID()
        self.name = tree.name ?? ""
        self.isFavorite = tree.isFavorite
    
    }
    
    
    
    // MARK: Variables
    
    let container = PersistentStore.shared
    
    let tree: Tree
    let id: UUID
    let name: String
    let isFavorite: Bool
    
    // MARK: Functions
    
    func favoriteTree() {
        tree.isFavorite.toggle()
        container.save()
    }
    
    func deleteTree() {
        container.context.delete(tree)
        container.save()
    }
    
}
