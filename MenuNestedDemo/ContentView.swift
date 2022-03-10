//
//  ContentView.swift
//  MenuNestedDemo
//
//  Created by jht2 on 3/4/22.
//

import SwiftUI

struct ContentView: View {
  @State var msg = ""
  @State var page1Active = false
  var body: some View {
    NavigationView {
      VStack {
        NavigationLink(destination: Page1(),
                       isActive: $page1Active) {
          EmptyView()
        }
        Menu("Actions Menu") {
          Button("Duplicate", action: { report("Duplicate")})
          Button("Rename", action: { report("Rename")})
          Button("Delete…", action: { report("Delete") } )
          Menu("Copy") {
            Button("Copy", action: { report("Copy") })
            Button("Copy Formatted", action: { report("Copy Formatted") })
            Button("Copy Library Path", action: { report("Copy Library Path") })
          }
          Button("Page1", action: { page1Active.toggle() })
        }
        Text(msg)
      }
    }
  }
  
  func report(_ m:String) {
    print("report" , msg)
    msg = m
  }
}

struct Page1: View {
  var body: some View {
    VStack {
      Text("Page1")
        .font(.headline)
      Image(systemName: "1.square.fill")
        .resizable()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
