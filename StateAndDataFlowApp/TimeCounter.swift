//
//  TimeCounter.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var counter = 3
    var timer: Timer?
    var buttonTitle = "Start"
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        
        buttonDidTapped()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
            print(counter)
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        
        objectWillChange.send(self)
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wate..."
        }
        
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
