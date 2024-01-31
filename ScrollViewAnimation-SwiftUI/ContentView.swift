//
//  ContentView.swift
//  ScrollViewAnimation-SwiftUI
//
//  Created by Kambaa on 31/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(MockData.items) { item in
                    Circle()
                        //.frame(width: 100, height: 100)
                        .containerRelativeFrame(.horizontal, count: verticalSizeClass == .regular ? 1 : 4, spacing: 16)
                        .foregroundStyle(item.color.gradient)
                        .scrollTransition{content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.5)
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3, y: phase.isIdentity ? 1.0 : 0.3)
                                .offset(y: phase.isIdentity ? 0 : 50)
                        }
                }
            }
            .scrollTargetLayout()
        }
        //.padding()
        .contentMargins(16, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
        //.scrollTargetBehavior(.paging)
        
        
    }
}

#Preview {
    ContentView()
}


struct Item: Identifiable {
    let id = UUID()
    let color : Color
}

struct MockData {
    static var items = [Item(color: .teal),
                        Item(color: .indigo),
                        Item(color: .yellow),
                        Item(color: .black),
                        Item(color: .blue),
                        Item(color: .green),
                        Item(color: .gray),
                        Item(color: .red),
                        Item(color: .cyan),
                        Item(color: .pink),
                        Item(color: .purple),
                        Item(color: .accentColor)
    ]
    
}
