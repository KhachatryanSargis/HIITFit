//
//  HistoryStore.swift
//  HIITFit
//
//  Created by Sargis Khachatryan on 22.07.24.
//

import Foundation

enum FileError: Error {
    case loadFailure
    case saveFailure
    case urlFailure
}

class HistoryStore: ObservableObject {
    @Published var exerciseDays: [ExerciseDay] = []
    
    init() {}
    
    init(withChecking: Bool) throws {
        do {
            try load()
        } catch {
            throw error
        }
    }
    
    convenience init(debugData: Bool) {
        self.init()
        createDevData()
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
        
        do {
            try save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func load() throws {
        guard let dataUrl = getUrl() else {
            throw FileError.urlFailure
        }
        do {
            guard let data = try? Data(contentsOf: dataUrl) else {
                return
            }
            let plistData = try PropertyListSerialization.propertyList(
                from: data,
                options: [],
                format: nil
            )
            let convertedPlistData = plistData as? [[Any]] ?? []
            exerciseDays = convertedPlistData.map {
                ExerciseDay(
                    date: $0[1] as? Date ?? Date(),
                    exercises: $0[2] as? [String] ?? []
                )
            }
        } catch {
            throw FileError.loadFailure
        }
    }
    
    func save() throws {
        guard let dataURL = getUrl() else {
            throw FileError.urlFailure
        }
        let plistData = exerciseDays.map {
            [$0.id.uuidString, $0.date, $0.exercises]
        }
        do {
            let data = try PropertyListSerialization.data(
                fromPropertyList: plistData,
                format: .binary,
                options: .zero
            )
            
            try data.write(to: dataURL, options: .atomic)
        } catch {
            throw FileError.saveFailure
        }
    }
    
    func getUrl() -> URL? {
        guard let documentsURL = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first else {
            return nil
        }
        
        return documentsURL.appendingPathComponent("history.plist")
    }
}
