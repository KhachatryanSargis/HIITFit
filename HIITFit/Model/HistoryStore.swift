//
//  HistoryStore.swift
//  HIITFit
//
//  Created by Sargis Khachatryan on 22.07.24.
//

import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

struct HistoryStore {
    var exerciseDays: [ExerciseDay] = []
    
    init() {
        #if DEBUG
        createDevData()
        #endif
    }
}
