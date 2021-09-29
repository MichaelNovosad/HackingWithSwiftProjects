//
//  ContentView.swift
//  Moonshot
//
//  Created by Michael Novosad on 30.07.2021.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State var crewMembers: [String]
    @State var changeDateAndNamePreview = true
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                            Text(mission.formattedLaunchDate)
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(
                leading: Button("Show Date/Name") {
                changeDateAndNamePreview.toggle()
                })
        }
    }
    init() {
        let missions: [Mission] = Bundle.main.decode("missions.json")
        let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
        var matches = [String]()
        for astronaut in astronauts {
            for mission in missions {
                if let match = mission.crew.first(where: {$0.name == astronaut.id}) {
                    matches.append("\(match): \(astronaut.name)")
                    break
                }
            }
        }
        self.crewMembers = matches
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*        VStack {
GeometryReader { geo in
    Image("One")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: geo.size.width)
}
}

 
 
 struct CustomText: View {
     
     var text: String
     var body: some View {
         Text(text)
     }
     
     init(_ text: String) {
         print("Creating a CustomText")
         self.text = text
     }
 }
 ScrollView(.vertical) {
     VStack(spacing: 10) {
         ForEach(0..<100) {
             CustomText("Item \($0)")
                 .font(.title)
         }
     }
     .frame(maxWidth: .infinity)
 }
 
 
 NavigationView {
     List(0..<100) { row in
         NavigationLink(
             destination: Text("Detail \(row)")) {
         Text("Row \(row)")
     }
 }
     .navigationBarTitle("SwiftUI")
 }
 */
