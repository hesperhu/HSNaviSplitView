//
//  HSNaviSplitThreeView.swift
//  HSNaviSplitView
//
//  Created by hsw on 2023-06-24.
//

import SwiftUI
import HSModle

struct HSNaviSplitThreeView: View {
    
    @State private var typeSelect: String? = nil
    @State private var dishSelects: Set<Dish> = []
    @State private var vehicleSelects: Set<Vehicle> = []
    var body: some View {
        NavigationSplitView {
            List(HSData.types, id: \.self ,selection: $typeSelect) { type in
                Text(type)
            }
        } content: {
            if let select = typeSelect {
                if select == HSData.dishType {
                    List(HSData.dishes, id: \.self,selection: $dishSelects) { dish in
                        Text(dish.name)
                    }
                } else {
                    List(HSData.vehicles, id: \.self,selection: $vehicleSelects) { vehicle in
                        Text(vehicle.name)
                    }
                }
            } else {
                Text("Select")
            }
        } detail: {
            List(dishSelects.sorted(by: {$0.name > $1.name}), id:\.id) { dish in
                Text(dish.detail)
            }
            List(vehicleSelects.sorted(by: {$0.name > $1.name}), id:\.id) { vehicle in
                Text(vehicle.detail)
            }

        }
    }
}

struct HSNaviSplitThreeView_Previews: PreviewProvider {
    static var previews: some View {
        HSNaviSplitThreeView()
    }
}
