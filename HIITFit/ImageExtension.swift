//
//  ImageExtension.swift
//  HIITFit
//
//  Created by Sargis Khachatryan on 15.07.24.
//

import SwiftUI

extension Image {
  func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
    self
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: width, height: height)
  }
}
