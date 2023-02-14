//
//  UserRowView.swift
//  ios_app_feb_8
//
//  Created by Tran Thai Quyen on 09/02/2023.
//

import SwiftUI

struct LandmarkRowView: View {
    
    var landmarkFavorite: LandmarkFavorite

       var body: some View {
           HStack {
               landmarkFavorite.image
                   .resizable()
                   .frame(width: 50, height: 50)
               Text(landmarkFavorite.name)
               Spacer()
               if landmarkFavorite.isFavorite {
                   Image(systemName: "star.fill")
//                       .padding([.trailing], 20)
                       .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                       .foregroundColor(Color(.systemYellow))
               }
                   
           }       }
}

struct LandmarkRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LandmarkRowView(landmarkFavorite: ModelData().landmarks[0])
            LandmarkRowView(landmarkFavorite: ModelData().landmarks[2])
            LandmarkRowView(landmarkFavorite: ModelData().landmarks[3])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

