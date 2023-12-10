//
//  TreeDetailView.swift
//  Woods
//
//  Created by Johannes Ahlborn on 10.12.23.
//

import SwiftUI
import CoreData

struct TreeDetailView: View {
    
    var body: some View {
           NavigationStack {
               Form {
                   Section {
                       TextField("Name", text: $treeDetailVM.name)
                           .keyboardType(.numberPad)
                   }

                   Section {
                       Toggle("Favorit", isOn: $treeDetailVM.isFavorite)
                   }

                   Button(action: saveTree) {
                       Text("Speichern")
                   }
                   .disabled(!treeDetailVM.enableSaving)
               }
               .navigationTitle("Neuer Baum")
           }
       }
            
            
            
            // MARK: - Variables
            
            @StateObject private var treeDetailVM = TreeDetailVM()
            
            @Binding var isPresented: Bool
            
            
            
            // MARK: - Functions
            
            private func saveTree() {
                treeDetailVM.createTree()
                isPresented.toggle()
            }
            
        }
        
        struct TreeDetailView_Previews: PreviewProvider {
            static var previews: some View {
                TreeDetailView(isPresented: .constant(false))
            }
        }
    
    

