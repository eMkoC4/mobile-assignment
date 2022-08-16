//
//  Accelerometer.swift
//  mobile-assignment
//
//  Created by IvanQ on 20.06.2022.
//

import CoreMotion
import Foundation

func Accelerometer() -> Bool {
    //returns true if phone in horizontal position
    
    let manager = CMMotionManager()
    manager.accelerometerUpdateInterval = 0.5
    manager.startAccelerometerUpdates()
    
    let data = manager.accelerometerData
    
    let x = data?.acceleration.x
    let y = data?.acceleration.y
    let z = data?.acceleration.z
    
//    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//        if let data = manager.accelerometerData
//        {
//            var x = data.acceleration.x
//            var y = data.acceleration.y
//            var z = data.acceleration.z
//        }
//
//    {
    if (x == 0 && y == 0 && z == 0) || (x == nil && y == nil && z == nil) {
        print("x: \(String(describing: x)), y: \(String(describing: y)), z: \(String(describing: z))")
        return false
    } else {
        return true
    }
}
