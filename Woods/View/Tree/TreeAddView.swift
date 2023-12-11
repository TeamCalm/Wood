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
                   Section{
                       Button("photo"){
                           showingImagePicker = true
                       }
                       if let treeImage = treeImage{
                           Image(uiImage: treeImage)
                               .resizable()
                               .scaledToFit()
                       }
                   }

                   Button(action: saveTree) {
                       Text("Speichern")
                   }
                   .disabled(!treeAddVM.enableSaving)
               }
               .navigationTitle("Neuer Baum")
           }
           .sheet(isPresented: $showingImagePicker) {
               ImagePicker(image: $treeImage)
           }
       }
            
            
            
            // MARK: - Variables
            
    @StateObject private var treeAddVM = TreeAddVM()
    @State private var showingImagePicker = false
    @State private var treeImage: UIImage?
    @Binding var isPresented: Bool
            
            
            
            // MARK: - Functions
            
            private func saveTree() {
                treeAddVM.createTree()
                isPresented.toggle()
            }
            
        }
        
        struct TreeAddView_Previews: PreviewProvider {
            static var previews: some View {
                TreeAddView(isPresented: .constant(false))
            }
        }
    
    

