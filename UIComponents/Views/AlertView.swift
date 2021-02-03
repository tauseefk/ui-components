//
//  AlertView.swift
//  PolarrUI
//
//  Created by Md Tauseef on 2/2/21.
//

import SwiftUI

struct AlertView: View {
  let header: String
  let alertBody: String
  let onDismissAlert: () -> Void
  
  var body: some View {
    ZStack {
      Color("BackgroundOverlayColor")
        .ignoresSafeArea()
      VStack(spacing: 1) {
        VStack(spacing: 10) {
          AlertHeader(content: header)
          AlertBody(content: alertBody)
        }
        .padding()
        Divider()
        ButtonGroup(onDismissAlert: onDismissAlert)
      }
      .frame(maxWidth: 300)
      .background(Color("BackgroundColor"))
      .cornerRadius(21)
      .shadow(radius: 10, x: 3, y: 3)
    }
  }
}

struct AlertHeader: View {
  let content: String
  
  var body: some View {
    Text(content)
      .font(.headline)
      .padding(.bottom, 10)
  }
}

struct AlertBody: View {
  let content: String
  let image: UIImage? = nil
  
  var body: some View {
    if (image != nil) {
      Image(systemName: "person.square")
    }
    Text(content)
      .font(.subheadline)
  }
}

struct AlertView_Previews: PreviewProvider {
  static var previews: some View {
    AlertView(header: "Header", alertBody: "This is a fairly long Alert, so hang tight! it'll probably take a couple of lines and then some. It's not very informative though, so you might as well just dismiss it..", onDismissAlert: {})
      .previewLayout(.fixed(width: 528, height: 320))
    AlertView(header: "Header", alertBody: "Be Alerted!", onDismissAlert: {})
      .previewLayout(.fixed(width: 528, height: 320))
      .preferredColorScheme(.dark)
    AlertView(header: "Header", alertBody: "This is an Alert!", onDismissAlert: {})
      .previewLayout(.fixed(width: 320, height: 528))
    AlertView(header: "Header", alertBody: "This is a fairly long Alert, so hang tight! it'll probably take a couple of lines and then some. It's not very informative though, so you might as well just dismiss it..", onDismissAlert: {})
      .previewLayout(.fixed(width: 320, height: 528))
      .preferredColorScheme(.dark)
  }
}
