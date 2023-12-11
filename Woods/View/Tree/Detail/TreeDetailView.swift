//
//  TreeDetailView.swift
//  Woods
//
//  Created by Johannes Ahlborn on 11.12.23.
//

import SwiftUI

struct TreeDetailView: View {
    @ObservedObject var viewModel: TreeVM
    
    var body: some View {
        VStack {
                   if let treeImage = viewModel.treeImage {
                       Image(uiImage: treeImage)
                           .resizable()
                           .scaledToFit()
                           .frame(maxWidth: .infinity, maxHeight: 200)
                           .cornerRadius(10)
                           .padding(.bottom, 10)
                   }
            Text("Tree Detail: \(viewModel.name)")
            Text("Favorite: \(viewModel.isFavorite.description)")
        }
        .padding()
        .navigationTitle(viewModel.name)
    }
}
    struct TreeDetailView_Previews: PreviewProvider {
        static var previews: some View {
            let sampleTree = Tree(context: PersistentStore.shared.context)
            sampleTree.name = "Sample Tree"
            sampleTree.isFavorite = true
            
            let viewModel = TreeVM(tree: sampleTree)
            
            return TreeDetailView(viewModel: viewModel)
                .environment(\.managedObjectContext, PersistentStore.shared.context)
        }
    }

