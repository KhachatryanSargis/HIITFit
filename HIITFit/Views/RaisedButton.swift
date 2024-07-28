//
//  RaisedButton.swift
//  HIITFit
//
//  Created by Sargis Khachatryan on 28.07.24.
//

import SwiftUI

struct RaisedButton: View {
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Get Started")
                .raisedButtonTextStyle()
        })
    }
}

struct RaisedButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            RaisedButton()
                .padding(20)
        }
        .background(Color("background"))
        .previewLayout(.sizeThatFits)
    }
}
