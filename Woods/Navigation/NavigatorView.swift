//
//  NavigatorView.swift
//  Woods
//
//  Created by Johannes Ahlborn on 11.12.23.
//

import SwiftUI

struct NavigatorView: View {
    var body: some View {
        TabView {
            ForEach(TabEnum.allCases) { tab in
                tab.view
                    .tabItem {Label(tab.name,
                                    systemImage: tab.icon)
                    }.tag(tab)
            }
        }
    }
}

struct NavigatorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigatorView()
    }
}
