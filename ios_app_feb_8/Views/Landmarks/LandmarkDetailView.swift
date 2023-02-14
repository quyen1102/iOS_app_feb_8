//
//  LandmarkDetailView.swift
//  ios_app_feb_8
//
//  Created by Tran Thai Quyen on 09/02/2023.
//

import SwiftUI
import CoreLocation

struct LandmarkDetailView: View {
    @EnvironmentObject var modelData: ModelData
    
    var landmark: LandmarkFavorite
    var landmarkIndex : Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!// tìm trong list, lấy ra item giống như item hiển thị ở detail
    }
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 350)
                .ignoresSafeArea(edges: .top)
            CircleImage(image: landmark.image)
                .offset(y: -140)
                .padding(.bottom, -140)
            VStack(alignment: .leading) {
                HStack{
                    Text(landmark.name)
                        .font(.custom("AmericanTypewriter", fixedSize: 36))
                        .fontWeight(.semibold)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack{
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                Text("About \(landmark.name)")
                    .font(.title)
                    .fontWeight(.semibold)
                Text(landmark.description)
                    .font(.subheadline)
                
            }.padding()
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        LandmarkDetailView(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
