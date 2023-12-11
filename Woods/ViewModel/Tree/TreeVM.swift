//
//  TreeViewModel.swift
//  Woods
//
//  Created by Johannes Ahlborn on 10.12.23.
//

import Foundation
import CoreData
import SwiftUI

class TreeVM: ObservableObject, Identifiable {
    
    init(tree: Tree) {
        self.tree = tree
        
        self.id = tree.id ?? UUID()
        self.name = tree.name ?? ""
        self.isFavorite = tree.isFavorite
        if let imageData = tree.image {
            self.treeImage = UIImage(data: imageData)
        }
        
    }
    
    
    
    // MARK: Variables
    @Published var treeVMs: [TreeVM] = []
    let container = PersistentStore.shared
    @Published var treeImage: UIImage?
    
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
    func saveTree(name: String, isFavorite: Bool, image: UIImage?) {
        let tree = Tree(context: container.context)
        tree.id = UUID()
        tree.name = name
        tree.isFavorite = isFavorite
        
        if let image = image, let imageData = image.jpegData(compressionQuality: 1.0) {
            tree.image = imageData
        }
        
        saveAndFetch()
    }
    
    
    func saveAndFetch() {
        container.save()
        fetchTrees()
    }
    
}
