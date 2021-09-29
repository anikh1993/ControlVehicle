//
//  HomeView.swift
//  ControlVehicle
//
//  Created by Ani Khechoyan on 9/27/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            if let vehicle = homeViewModel.vehicle.value {
                NavigationView {
                    ZStack {
                        Color("background")
                        ScrollView {
                            VStack {
                                UpdateNotifyView(lastUpdatedDate: vehicle.updatedDate)
                                CoverView(image: vehicle.image)
                                HStack(spacing: 15.0) {
                                    DoorsView(
                                        lockAction: lockAction,
                                        unlockAction: unlockAction,
                                        isLocked: vehicle.isLocked,
                                        loading: homeViewModel.loading
                                    )
                                    EngineView()
                                }
                                Spacer()
                            }
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            TopView(title: vehicle.name, gas: vehicle.gas)
                        }
                    }
                    .alert(isPresented: $homeViewModel.showingAlert, content: {
                        Alert(
                            title: Text("Are you sure?"),
                            message: Text("Please, confirm that you want to lock the doors of \(vehicle.name)."),
                            primaryButton: .default(Text("Yes, lock"), action: {
                                homeViewModel.lockVehicle()
                            }),
                            secondaryButton: .default(Text("Cancel")))
                    })
                }
            } else {
                Text("No vehicles found...")
            }
        }
    }
    
    private func lockAction() {
        homeViewModel.showAlert.send(true)
    }
    
    private func unlockAction() { }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel())
    }
}


