//
//  HistoryStore.swift
//  HIITFit
//
//  Created by Sargis Khachatryan on 22.07.24.
//

import Foundation

class HistoryStore: ObservableObject {
    @Published var exerciseDays: [ExerciseDay] = []
    
    init() {
        #if DEBUG
//        createDevData()
        #endif
    }
    
    func addDoneExercise(_ exerciseName: String) {
        let today = Date()
        
        if let firstDate = exerciseDays.first?.date,
           today.isSameDay(as: firstDate) {
            exerciseDays[0].exercises.append(exerciseName)
        } else {
            exerciseDays.insert(
                ExerciseDay(date: today, exercises: [exerciseName]),
                at: 0
            )
        }
    }
}
