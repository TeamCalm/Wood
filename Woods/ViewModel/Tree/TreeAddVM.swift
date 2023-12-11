//
//  TreeDetailVM.swift
//  Woods
//
//  Created by Johannes Ahlborn on 10.12.23.
//

import Foundation
import CoreData
import SwiftUI

class TreeAddVM: ObservableObject {
    
    // MARK: Variables
    
    let container = PersistentStore.shared
    
    @Published var name = ""
    @Published var isFavorite = false
    @Published var treeImage: UIImage?
    
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
        if let image = treeImage, let imageData = image.jpegData(compressionQuality: 1.0) {
                    tree.image = imageData
                }
        container.save()
    }
    
}
