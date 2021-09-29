//
//  EngineView.swift
//  ControlVehicle
//
//  Created by Ani Khechoyan on 9/28/21.
//

import SwiftUI

struct EngineView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Engine").fontWeight(.bold).multilineTextAlignment(.leading)
            ZStack {
                Color(.white).frame(height: 100).cornerRadius(5)
                HStack(spacing: 8.0) {
                    CircleTextButton(action: {}, text: "START")
                    CircleTextButton(action: {}, text: "STOP")
                }
            }
            
            Spacer()
        }
        .padding(.trailing)
    }
}

struct EngineView_Previews: PreviewProvider {
    static var previews: some View {
        EngineView()
    }
}
