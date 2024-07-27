//
//  HistoryView.swift
//  HIITFit
//
//  Created by Sargis Khachatryan on 17.07.24.
//

import SwiftUI

struct HistoryView: View {
    @Binding var showHistory: Bool
    
    let history = HistoryStore()
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: { showHistory.toggle() }) {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
            .padding(.trailing)
            VStack {
                Text("History")
                    .font(.title)
                    .padding()
                Form {
                    ForEach(history.exerciseDays) { day in
                        Section {
                            ForEach(day.exercises, id: \.self) { exercise in
                                Text(exercise)
                            }
                        } header: {
                            Text(day.date.formatted(as: "MMM d"))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HistoryView(showHistory: .constant(true))
}
