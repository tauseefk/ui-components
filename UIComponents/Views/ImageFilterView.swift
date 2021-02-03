//
//  ImageFilterView.swift
//  PolarrUI
//
//  Created by Md Tauseef on 2/3/21.
//

import SwiftUI

struct ImageCanvas: Shape {
  var width: CGFloat = .infinity
  var height: CGFloat = .infinity
  
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(rect: rect)
    return Path(path.cgPath)
  }
}

struct ImageFilterView: View {
  var image: UIImage? = nil
  var canvasWidth: CGFloat = 350
  @State var handlePosition: CGFloat
  let handleWidth: CGFloat = 12

  var body: some View {
    ZStack {
      ImageView(uiImage: image)
      ImageView(uiImage: image)
        .saturation(0.0)
        .clipShape(Rectangle()
                    .offset(x: handlePosition)
                    .size(width: canvasWidth - handlePosition, height: 440))
      Slider(value: $handlePosition, in: 0...canvasWidth)
        .frame(width: canvasWidth + (handleWidth * 2))
        .accentColor(Color(UIColor(.clear)))
        .zIndex(2.0)
    }
  }
}

struct ImageView: View {
  let uiImage: UIImage?
  
  var body: some View {
    if let image = uiImage.map(SwiftUI.Image.init) {
      return image
        .resizable()
        .scaledToFit()
        .frame(maxWidth: 350)
    } else {
      return SwiftUI.Image("DefaultImage")
        .resizable()
        .scaledToFit()
        .frame(maxWidth: 350)
    }
  }
}

struct ImageFilterView_Previews: PreviewProvider {
  static var previews: some View {
    ImageFilterView(handlePosition: 100)
  }
}
