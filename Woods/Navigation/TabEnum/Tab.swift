//
//  Tab.swift
//  Woods
//
//  Created by Johannes Ahlborn on 11.12.23.
//

import SwiftUI

enum TabEnum: String, Identifiable, CaseIterable {
    case Tree
    
    
    var id: String  {rawValue}
    
    var name: String{
        switch self {
        case.Tree: return "Trees"
        }
    }
    
    var icon: String {
        switch self {
        case .Tree: return "tree"
        }
    }
    
    var view: AnyView {
        switch self {
        case .Tree: return AnyView(TreeListView())
        }
    }
}
