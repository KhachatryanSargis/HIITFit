//
//  HistoryStore.swift
//  HIITFit
//
//  Created by Sargis Khachatryan on 22.07.24.
//

import Foundation

struct HistoryStore {
    var exerciseDays: [ExerciseDay] = []
    
    init() {
        #if DEBUG
        createDevData()
        #endif
    }
}
