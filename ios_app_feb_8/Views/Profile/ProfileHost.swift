//
//  ProfileHost.swift
//  ios_app_feb_8
//
//  Created by Tran Thai Quyen on 17/02/2023.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
        //thêm enviromentObject vì View con của nó sử dụng model, mặc dùng nó không dùng, nhưng
        //vẫn phải thêm
    }
}
