//
//  ContentView.swift
//  MenuNestedDemo
//
//  Created by jht2 on 3/4/22.
//

import SwiftUI

struct ContentView: View {
  @State var msg = ""
  @State var showPage1 = false
  var body: some View {
    NavigationView {
      VStack {
        NavigationLink(destination: Page1(),
                       isActive: $showPage1) {
          EmptyView()
        }
        Menu("Actions Menu") {
          Button("Duplicate", action: { report("Duplicate")})
          // button can be graphic
          Button(action: { report("Trash") }) {
            Image(systemName: "trash")
            Text("Trash")
          }
          // action: may be omitted
          Button("Rename") { report("Rename") }
          Button("Delete…") { report("Delete") }
          Menu("Copy") {
            Button("Copy") { report("Copy") }
            Button("Copy Formatted") { report("Copy Formatted") }
            Button("Copy Library Path") { report("Copy Library Path") }
          }
          Button("Goto Page1") {
            showPage1.toggle()
          }
        }
        Text(msg)
      }
    }
  }
  
  func report(_ m:String) {
    print("report" , m)
    msg = "report " + m
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
