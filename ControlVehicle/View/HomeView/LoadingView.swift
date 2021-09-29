//
//  LoadingView.swift
//  ControlVehicle
//
//  Created by Ani Khechoyan on 9/28/21.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var isCircleRotating = true
    @State private var animateStart = false
    @State private var animateEnd = true
    
    var body: some View {
        Circle()
            .trim(from: animateStart ? 1/3 : 1/9, to: animateEnd ? 2/5 : 1)
            .stroke(lineWidth: 4)
            .rotationEffect(.degrees(isCircleRotating ? 360 : 0))
            .foregroundColor(Color("highlight"))
            .onAppear() {
                withAnimation(Animation
                                .linear(duration: 1)
                                .repeatForever(autoreverses: false)) {
                    self.isCircleRotating.toggle()
                }
                withAnimation(Animation
                                .linear(duration: 1)
                                .delay(0.5)
                                .repeatForever(autoreverses: true)) {
                    self.animateStart.toggle()
                }
                withAnimation(Animation
                                .linear(duration: 1)
                                .delay(1)
                                .repeatForever(autoreverses: true)) {
                    self.animateEnd.toggle()
                }
            }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
