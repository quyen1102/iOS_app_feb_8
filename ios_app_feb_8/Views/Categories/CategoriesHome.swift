//
//  CategoriesHome.swift
//  ios_app_feb_8
//
//  Created by Tran Thai Quyen on 16/02/2023.
//

import SwiftUI

struct CategoriesHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    var body: some View {
        NavigationView {
//            CategoryRow(categoryName: "Favorites", items: modelData.landmarks)
            List {
                modelData.features[0].image
                                   .resizable()
                                   .scaledToFill()
                                   .frame(height: 200)
                                   .clipped()
                                   .listRowInsets(EdgeInsets())
                

                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                ToolbarItem(placement: .automatic){
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
//                            .font(.title2)
                            .font(.system(size: 26))
                            .foregroundColor(.brown)
                    }
                }
            }
            .sheet(isPresented: $showingProfile) {
                NavigationView {
                    ProfileHost()
                        .environmentObject(modelData)
                        .toolbar {
                            Button {
                                showingProfile.toggle()
                            } label: {
                                Label("User Profile", systemImage: "chevron.down")
                                    .fontWeight(.bold)
                                    .foregroundColor(.brown)
                            }
                        }
                }
                    
            }
        }
    }
}

struct CategoriesHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesHome()
            .environmentObject(ModelData())
    }
}
