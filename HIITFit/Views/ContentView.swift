//
//  ContentView.swift
//  HIITFit
//
//  Created by Sargis Khachatryan on 15.07.24.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedTab") private var selectedTab = 9
    
    var body: some View {
        ZStack {
            GradientBackground()
            TabView(selection: $selectedTab) {
                WelcomeView(selectedTab: $selectedTab)
                    .tag(9)
                ForEach(0..<Exercise.exercises.count, id: \.self) { index in
                    ExerciseView(selectedTab: $selectedTab, index: index)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
