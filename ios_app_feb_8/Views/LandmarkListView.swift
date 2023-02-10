//
//  LandmarkListView.swift
//  ios_app_feb_8
//
//  Created by Tran Thai Quyen on 09/02/2023.
//

import SwiftUI

struct LandmarkListView: View {
    @State private var showFavoritesOnly = true
    
    var filteredLandmarks: [LandmarkFavorite] {
           landmarks.filter { landmark in
               (!showFavoritesOnly || landmark.isFavorite)
           }
       }
    
    var body: some View {
        NavigationView{
            List(filteredLandmarks) { landmark in
                NavigationLink{
                    LandmarkDetailView(landmark: landmark)
                } label: {
                   LandmarkRowView(landmarkFavorite: landmark)
                }
            }
            .navigationTitle("Favorite Landmark")
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
    
    }
}
