//
//  TreeDetailVM.swift
//  Woods
//
//  Created by Johannes Ahlborn on 10.12.23.
//

import Foundation
import CoreData

class TreeAddVM: ObservableObject {
    
    // MARK: Variables
    
    let container = PersistentStore.shared
    
    @Published var name = ""
    @Published var isFavorite = false
    
    
    
    // MARK: - Computed Properties
    
    var enableSaving: Bool {
        !name.isEmpty
    }
    
    
    
    // MARK: Functions
    
    
    
    func createTree() {
        let tree = Tree(context: container.context)
        tree.id = UUID()
        tree.name = name
        tree.isFavorite = isFavorite
       
        container.save()
    }
    
}
