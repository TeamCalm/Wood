//
//  TreeView.swift
//  Woods
//
//  Created by Johannes Ahlborn on 10.12.23.
//

import SwiftUI

struct TreeView: View {
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 0) {
                Text(name)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: isFavorite ? "heart.fill" : "heart")
            }
            
            
            .font(.footnote)
        }
    }
    

        
        // MARK: - Variables
        
        let name: String
    let isFavorite: Bool
        
        
    }
    
    struct TreeView_Previews: PreviewProvider {
        static var previews: some View {
            TreeView(name: "test", isFavorite: true)
        }
    }

