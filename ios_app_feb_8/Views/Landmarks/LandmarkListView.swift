//
//  LandmarkListView.swift
//  ios_app_feb_8
//
//  Created by Tran Thai Quyen on 09/02/2023.
//

import SwiftUI

struct LandmarkListView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [LandmarkFavorite] {
        modelData.landmarks.filter { landmark in
               (!showFavoritesOnly || landmark.isFavorite)
           }
       }
    
    var body: some View {
        NavigationView{
            List {
                Toggle("Favorites only",isOn: $showFavoritesOnly)
                    .toggleStyle(.switch)
                    .tint(.brown)
                    .foregroundColor(.brown)
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink{
                        LandmarkDetailView(landmark: landmark)
                    } label: {
                        LandmarkRowView(landmarkFavorite: landmark)
                    }
                }
                ProfileSummary(profile: Profile.default)
            }
            .navigationTitle("Favorite Landmark")
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
            .environmentObject(ModelData())
    }
}
