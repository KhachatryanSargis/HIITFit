//
//  TimerView.swift
//  HIITFit
//
//  Created by Sargis Khachatryan on 27.07.24.
//

import SwiftUI

struct TimerView: View {
    @Binding var timerDone: Bool
    @State private var timeRemaining = 3
    
    let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common
    ).autoconnect()
    
    var body: some View {
        Text("\(timeRemaining)")
            .font(.system(size: 90, design: .rounded))
            .padding()
            .onReceive(timer) { _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    timerDone = true
                }
            }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timerDone: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
