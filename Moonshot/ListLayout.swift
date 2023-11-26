//
//  ListLayout.swift
//  Moonshot
//
//  Created by Leo  on 26.11.23.
//

import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack(spacing: 18) {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(mission.displayName)
                                .font(.headline)
                            
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
    }
}

//#Preview {
//    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
//    let missions: [Mission] = Bundle.main.decode("missions.json")
//    
//    return ListLayout(astronauts: astronauts, missions: missions)
//}
