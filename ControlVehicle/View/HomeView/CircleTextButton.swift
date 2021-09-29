//
//  CircleTextButton.swift
//  ControlVehicle
//
//  Created by Ani Khechoyan on 9/28/21.
//

import SwiftUI

struct CircleTextButton: View {
    
    var action: () -> ()
    var text: String
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.system(size: 12))
                .fontWeight(.bold)
                .padding(-6.0)
        }
        .frame(width: 40, height: 40)
        .padding()
        .foregroundColor(.white)
        .background(Color(.black))
        .clipShape(Circle())
    }
}

struct CircleTextButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleTextButton(action: {}, text: "")
    }
}
