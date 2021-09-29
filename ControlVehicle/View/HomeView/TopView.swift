//
//  TopView.swift
//  ControlVehicle
//
//  Created by Ani Khechoyan on 9/28/21.
//

import SwiftUI

struct TopView: View {
    var title: String
    var gas: Int
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .padding(.trailing, 5)
            Color("highlight")
                .frame(width: 2)
            Image("notif_gas")
            Text("\(gas)mi")
                .font(.headline)
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView(title: "My Vehicle", gas: 0)
    }
}
