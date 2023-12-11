//
//  TreeViewModel.swift
//  Woods
//
//  Created by Johannes Ahlborn on 10.12.23.
//

import Foundation
import CoreData

class TreeVM: ObservableObject, Identifiable {
    
    init(tree: Tree) {
        self.tree = tree
        
        self.id = tree.id ?? UUID()
        self.name = tree.name ?? ""
        self.isFavorite = tree.isFavorite
    
    }
    
    
    
    // MARK: Variables
    @Published var treeVMs: [TreeVM] = []
    let container = PersistentStore.shared
    
    let tree: Tree
    let id: UUID
    let name: String
    let isFavorite: Bool
    
    // MARK: Functions
    
    private func fetchTrees() {
        let request = NSFetchRequest<Tree>(entityName: "Tree")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        do {
            let trees = try container.context.fetch(request)
            treeVMs = trees.map { TreeVM(tree: $0) }
        } catch {
            print("error fetching: \(error)")
        }
    }
    
    func favoriteTree() {
        tree.isFavorite.toggle()
        container.save()
    }
    
    func deleteTree() {
        container.context.delete(tree)
        saveAndFetch()
    }
    func saveTree(name: String, isFavorite: Bool) {
        let tree = Tree(context: container.context)
        tree.id = UUID()
        tree.name = name
        tree.isFavorite = isFavorite
        
        
    }
    
    func saveAndFetch() {
        container.save()
        fetchTrees()
    }
    
}
