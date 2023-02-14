//
//  FavoriteButton.swift
//  ios_app_feb_8
//
//  Created by Tran Thai Quyen on 10/02/2023.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet : Bool
    var body: some View {
        Button {
            isSet.toggle()//action
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
