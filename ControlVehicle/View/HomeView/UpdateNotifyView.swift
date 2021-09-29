//
//  UpdateNotifyView.swift
//  ControlVehicle
//
//  Created by Ani Khechoyan on 9/28/21.
//

import SwiftUI

struct UpdateNotifyView: View {
    
    var lastUpdatedDate: Date
    
    var body: some View {
        Label(
            "Updated \(RelativeDateTimeFormatter().localizedString(for: lastUpdatedDate, relativeTo: Date()))",
              image: "btn_refresh"
        )
            .padding(.top, 25.0)
            .font(.subheadline)
            .foregroundColor(.gray)
    }
}

struct UpdateNotifyView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateNotifyView(lastUpdatedDate: Date())
    }
}
