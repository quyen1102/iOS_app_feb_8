//
//  CategoriesHome.swift
//  ios_app_feb_8
//
//  Created by Tran Thai Quyen on 16/02/2023.
//

import SwiftUI

struct CategoriesHome: View {
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    Text(key)
                }
            }
            .navigationTitle("Featured")
        }
    }
}

struct CategoriesHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesHome()
            .environmentObject(ModelData())
    }
}
