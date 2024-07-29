//
//  RaisedButton.swift
//  HIITFit
//
//  Created by Sargis Khachatryan on 28.07.24.
//

import SwiftUI

struct RaisedButton: View {
    let buttonText: String
    let action: () -> Void
    
    var body: some View {
        Button(
            action: {
                action()
            },
            label: {
                Text(buttonText)
                    .raisedButtonTextStyle()
            }
        )
        .buttonStyle(RaisedButtonStyle())
    }
}

struct RaisedButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            RaisedButton(buttonText: "Get Started") {}
                .padding(20)
        }
        .background(Color("background"))
        .previewLayout(.sizeThatFits)
    }
}

struct RaisedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 12)
            .background(
                Capsule()
                    .foregroundColor(Color("background"))
                    .shadow(
                        color: Color("drop-shadow"),
                        radius: 4,
                        x: 6,
                        y: 6
                    )
                    .shadow(
                        color: Color("drop-highlight"),
                        radius: 4,
                        x: -6,
                        y: -6
                    )
            )
    }
}
