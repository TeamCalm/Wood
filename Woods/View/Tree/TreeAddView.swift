//
//  TreeDetailView.swift
//  Woods
//
//  Created by Johannes Ahlborn on 10.12.23.
//

import SwiftUI
import CoreData

struct TreeAddView: View {
    
    var body: some View {
           NavigationStack {
               Form {
                   Section {
                       TextField("Name", text: $treeAddVM.name)
                           .keyboardType(.numberPad)
                   }

                   Section {
                       Toggle("Favorit", isOn: $treeAddVM.isFavorite)
                   }

                   Button(action: saveTree) {
                       Text("Speichern")
                   }
                   .disabled(!treeAddVM.enableSaving)
               }
               .navigationTitle("Neuer Baum")
           }
       }
            
            
            
            // MARK: - Variables
            
            @StateObject private var treeAddVM = TreeAddVM()
            
            @Binding var isPresented: Bool
            
            
            
            // MARK: - Functions
            
            private func saveTree() {
                treeAddVM.createTree()
                isPresented.toggle()
            }
            
        }
        
        struct TreeDetailView_Previews: PreviewProvider {
            static var previews: some View {
                TreeAddView(isPresented: .constant(false))
            }
        }
    
    

