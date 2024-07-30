//
//  HistoryListView.swift
//  HIITFit
//
//  Created by Sargis Khachatryan on 30.07.24.
//

import SwiftUI

struct HistoryListView: View {
    @EnvironmentObject var history: HistoryStore
    
    var body: some View {
        ScrollView {
            ForEach(history.exerciseDays) { day in
                Section(
                    header:
                        HStack {
                            Text(day.date.formatted(as: "MMM d"))
                                .font(.title3)
                                .fontWeight(.medium)
                                .padding()
                            Spacer()
                        },
                    footer:
                        Divider()
                        .padding(.top, 40)
                )
                {
                    HStack(spacing: 40) {
                        ForEach(0..<min(day.exercises.count, 4), id: \.self) { index in
                            let exercise = day.exercises[index]
                            VStack {
                                IndentView {
                                    switch exercise {
                                    case "Squat":
                                        Image(systemName: "bolt.fill")
                                            .frame(minWidth: 60)
                                    case "Step Up":
                                        Image(systemName: "arrow.uturn.up")
                                            .frame(minWidth: 60)
                                    case "Burpee":
                                        Image(systemName: "hare.fill")
                                            .frame(minWidth: 60)
                                    default:
                                        Image(systemName: "sun.max.fill")
                                            .frame(minWidth: 60)
                                    }
                                }
                                .foregroundColor(Color("exercise-history"))
                                .padding(.bottom, 20)
                                Text(exercise)
                                    .font(.caption)
                                    .fontWeight(.light)
                                    .foregroundColor(Color.primary)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    HistoryListView()
        .environmentObject(HistoryStore(debugData: true))
}
