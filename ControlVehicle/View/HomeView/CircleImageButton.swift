//
//  CircleButton.swift
//  ControlVehicle
//
//  Created by Ani Khechoyan on 9/28/21.
//

import SwiftUI

struct CircleImageButton: View {

    enum ButtonState {
        case none, selected, disabled, loading
    }
    
    var action: () -> ()
    var imageName: String
    var state: ButtonState = .none
    
    var body: some View {
        VStack {
            switch state {
            case .none:
                Button(action: action) {
                    Image(imageName)
                }
                .frame(width: 40, height: 40)
                .padding()
                .background(Color(.black))
                .disabled(false)
            case .disabled:
                Button(action: action) {
                    Image(imageName)
                }
                .frame(width: 40, height: 40)
                .padding()
                .background(Color(.gray))
                .disabled(true)
            case .selected:
                Button(action: action) {
                    Image(imageName)
                }
                .frame(width: 40, height: 40)
                .padding()
                .background(Color("highlight"))
                .disabled(true)
            case .loading:
                LoadingView()
                    .frame(width: 72, height: 72)
            }
        }
        .foregroundColor(.white)
        .clipShape(Circle())
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageButton(action: {}, imageName: "", state: .loading)
        CircleImageButton(action: {}, imageName: "", state: .selected)

    }
}
