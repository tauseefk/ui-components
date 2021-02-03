//
//  ContentView.swift
//  PolarrUI
//
//  Created by Md Tauseef on 2/2/21.
//

import SwiftUI

struct ContentView: View {
  @State var isAlertVisible = false
  func onDismissAlert() {
    withAnimation {
      isAlertVisible = false
    }
  }
  
  func onShowAlert() {
    withAnimation {
      isAlertVisible = true
    }
  }
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea()
      VStack {
        Spacer()
        ImageFilterView(handlePosition: 100)
        Spacer()
        Button("Show Alert", action: onShowAlert)
          .foregroundColor(Color("TextColor"))
      }
      if isAlertVisible {
        AlertView(header: "Be Alert!", alertBody: "This is a fairly long Alert, so hang tight! it'll probably take a couple of lines and then some. It's not very informative though, so you might as well just dismiss it..", onDismissAlert: onDismissAlert)
          .zIndex(5)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
