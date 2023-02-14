//
//  CircleImage.swift
//  ios_app_feb_8
//
//  Created by Tran Thai Quyen on 08/02/2023.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: 250, height: 250)
//            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: ModelData().landmarks[0].image)
    }
}
