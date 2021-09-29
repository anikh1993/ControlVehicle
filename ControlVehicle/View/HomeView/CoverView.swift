//
//  CoverView.swift
//  ControlVehicle
//
//  Created by Ani Khechoyan on 9/28/21.
//

import SwiftUI

struct CoverView: View {
    var image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
    }
}

struct CoverView_Previews: PreviewProvider {
    static var previews: some View {
        CoverView(image: UIImage())
    }
}
