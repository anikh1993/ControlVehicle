//
//  MainView.swift
//  ControlVehicle
//
//  Created by Ani Khechoyan on 9/27/21.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        TabView {
            HomeView(homeViewModel: homeViewModel)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            VehicleView()
                .tabItem {
                    Label("Vehicle", systemImage: "car.fill")
                }
            LocationView()
                .tabItem {
                    Label("Location", systemImage: "location.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .accentColor(Color("highlight"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
