//
//  ContentView.swift
//  HSNaviSplitView
//
//  Created by hsw on 2023-06-24.
//

import SwiftUI
import HSModle

struct HSNaviSplitView: View {
    @State var select: Dish? = nil
    var body: some View {
        NavigationSplitView {
            List(HSData.dishes, selection: $select) { dish in
                NavigationLink(dish.name, value: dish)
            }
        } detail: {
            if let dish = select {
                Text(dish.detail)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HSNaviSplitView()
    }
}
