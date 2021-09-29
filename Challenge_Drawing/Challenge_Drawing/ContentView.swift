//
//  ContentView.swift
//  Challenge_Drawing
//
//  Created by Michael Novosad on 17.08.2021.
//

import SwiftUI
//
//struct Arrow: Shape {
//    struct Triangle: Shape {
//
//    }
//    struct Rectangle: Shape {
//
//    }
//}

struct ContentView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 500))
            path.addLine(to: CGPoint(x: 500, y: 100))
            path.addLine(to: CGPoint(x: 300, y: 300))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
