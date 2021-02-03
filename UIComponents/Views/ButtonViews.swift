//
//  ButtonViews.swift
//  PolarrUI
//
//  Created by Md Tauseef on 2/2/21.
//

import SwiftUI

struct PrimaryButtonText: View {
  let content: String
  
  var body: some View {
    Text(content)
      .foregroundColor(Color("AccentColor"))
  }
}


struct SecondaryButtonText: View {
  let content: String
  
  var body: some View {
    Text(content)
      .foregroundColor(Color("TextColor"))
  }
}

struct DestructiveButtonText: View {
  let content: String
  
  var body: some View {
    Text(content)
      .foregroundColor(.red)
  }
}

struct ButtonGroup: View {
  var onDismissAlert: () -> Void
  
  var body: some View {
    HStack(alignment: .center, spacing: 50) {
      Button(action: onDismissAlert, label: {
        SecondaryButtonText(content: "Okay")
      })
      Divider()
      Button(action: onDismissAlert, label: {
        PrimaryButtonText(content: "Dismiss")
      })
    }
    .frame(height: 50)
  }
}

struct ButtonViews_Previews: PreviewProvider {
    static var previews: some View {
      ButtonGroup(onDismissAlert: {})
        .previewLayout(.fixed(width: 528, height: 320))
      ButtonGroup(onDismissAlert: {})
        .previewLayout(.fixed(width: 528, height: 320))
        .preferredColorScheme(.dark)
      ButtonGroup(onDismissAlert: {})
        .previewLayout(.fixed(width: 320, height: 528))
      ButtonGroup(onDismissAlert: {})
        .previewLayout(.fixed(width: 320, height: 528))
        .preferredColorScheme(.dark)
    }
}
