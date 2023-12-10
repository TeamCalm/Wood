//
//  TreesVM.swift
//  Woods
//
//  Created by Johannes Ahlborn on 10.12.23.
//

import Foundation
import CoreData

class TreesVM: ObservableObject {
    
    init() {
        fetchTrees()
        
        let didSaveNotification = NSManagedObjectContext.didSaveObjectsNotification
        NotificationCenter.default.addObserver(self, selector: #selector(didSave(_:)), name: didSaveNotification, object: nil)
    }
    
    
    
    // MARK: Variables
    
    @Published var treeVMs: [TreeVM] = []
    
    let container = PersistentStore.shared
    
    
    
    // MARK: Functions
    
    @objc
    private func didSave(_ notification: Notification) {
        fetchTrees()
    }
    
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
    
}

