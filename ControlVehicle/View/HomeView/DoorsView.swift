//
//  DoorsView.swift
//  ControlVehicle
//
//  Created by Ani Khechoyan on 9/28/21.
//

import SwiftUI

struct DoorsView: View {
    
    var lockAction: () -> ()
    var unlockAction: () -> ()
    var isLocked: Bool = false
    var loading: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Doors")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                if loading || isLocked {
                    Color("highlight").frame(width: 2)
                    let text = isLocked ? "Locked" : "..."
                    Text(text)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                }
            }
            ZStack {
                Color(.white).frame(height: 100).cornerRadius(5)
                HStack(spacing: 8.0) {
                    CircleImageButton(
                        action: lockAction,
                        imageName: "act_lock",
                        state: loading ? .loading : ( isLocked ? .selected : .none))
                    CircleImageButton(
                        action: unlockAction,
                        imageName: "act_unlock",
                        state: isLocked ? .none : .disabled)
                }
            }
            Spacer()
        }
        .padding(.leading)
    }
}

struct DoorsView_Previews: PreviewProvider {
    static var previews: some View {
        DoorsView(lockAction: {}, unlockAction: {})
    }
}
