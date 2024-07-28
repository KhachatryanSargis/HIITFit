//
//  ExerciseDay.swift
//  HIITFit
//
//  Created by Sargis Khachatryan on 28.07.24.
//

import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}
