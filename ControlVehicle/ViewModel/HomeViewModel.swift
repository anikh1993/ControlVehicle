//
//  HomeViewModel.swift
//  ControlVehicle
//
//  Created by Ani Khechoyan on 9/28/21.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var loading = false
    @Published var showingAlert = false
    
    var vehicle = CurrentValueSubject<Vehicle?, Never>(nil)
    var showAlert = PassthroughSubject<Bool, Never>()
    var lockVehicle = PassthroughSubject<Bool, Never>()
    private var subscribers = Set<AnyCancellable>()
    
    init() {
        // load from the server or file system
        let car = Vehicle(
            name: "My GX55",
            gas: 120,
            isLocked: false,
            image: UIImage(named: "vehicle")!,
            updatedDate: Date()
        )
        vehicle.send(car)
        
        showAlert.sink {[unowned self] show in
            self.showingAlert = show
        }.store(in: &subscribers)
        
        lockVehicle.sink {[unowned self] lock in
            if lock {
                loading = true
                let date = Date()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.vehicle.value?.isLocked = true
                    self.vehicle.value?.updatedDate = date
                    self.loading = false
                }
            }
        }.store(in: &subscribers)
    }
}
