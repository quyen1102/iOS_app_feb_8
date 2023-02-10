//
//  LandmarkDetailView.swift
//  ios_app_feb_8
//
//  Created by Tran Thai Quyen on 09/02/2023.
//

import SwiftUI
import CoreLocation

struct LandmarkDetailView: View {
    var landmark: LandmarkFavorite
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 350)
                .ignoresSafeArea(edges: .top)
            CircleImage(image: landmark.image)
                .offset(y: -140)
                .padding(.bottom, -140)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.custom("AmericanTypewriter", fixedSize: 36))
                    .fontWeight(.semibold)
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
    static var previews: some View {
        LandmarkDetailView(landmark: landmarks[0])
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
    }
}
