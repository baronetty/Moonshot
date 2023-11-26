//
//  ContentView.swift
//  Moonshot
//
//  Created by Leo  on 23.11.23.
//

import SwiftUI




struct ContentView: View {
    @State private var showingGrid = true
        var currentViewType: ViewType {
            if !showingGrid { return ViewType.Grid }
            else { return ViewType.List }
        }
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
                    Group {
                        if showingGrid {
                            GridLayout(astronauts: astronauts, missions: missions)
                        } else {
                            ListLayout(astronauts: astronauts, missions: missions)
                        }
                    }
                    .navigationTitle("Moonshot")
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Button("Show as \(currentViewType.rawValue)") {
                                showingGrid.toggle()
                            }
                        }
                    }
                    .preferredColorScheme(.dark)
                    .background(.darkBackground)
                }
            }
        }

enum ViewType: String {
    case Grid
    case List
}

#Preview {
    ContentView()
}
