//
//  TeamMemberController.swift
//  Group App
//
//  Created by Nicholas Towery on 1/11/21.
//

import Foundation
import UIKit

class TeamMemberController {
    
    static let shared = TeamMemberController()
    
    // MARK: - Properties
    var teamMembers: [TeamMember] = []
    var teamMembersToEncode = [
        
        TeamMember(name: "Nicholas", bio: "When not writing fire code that melts his laptop, Nicholas enjoys producing hardstyle music and searching AirBNB for places that he can't go to due to the pandemic.", photo: Image(withImage: UIImage(named: "nicholas_cropped")!), interests: [Image(withImage: UIImage(named: "nicholas_full_image")!)]),
        TeamMember(name: "Michael", bio: "When he isn't working on learning the ins and outs of Swift, Michael enjoys quiet with a good read. A newcomer to the iOS development sphere, he's dedicated to improving and making the best out of himself.", photo: Image(withImage: UIImage(named: "michael_full")!), interests: [
                    Image(withImage: UIImage(named: "Image-1")!),
            Image(withImage: UIImage(named: "Image-2")!),
            Image(withImage: UIImage(named: "Image-3")!)

        ])
    ]
    
    // MARK: - Persistence
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let filename = "teamMembers2.json"
        let fullURL = documentsDirectory.appendingPathComponent(filename)
        return fullURL
    }
    
    func saveToPersistence() {
        do {
            let data =  try JSONEncoder().encode(teamMembersToEncode)
            print(data)
            print(String(data: data, encoding: .utf8)!)
            try data.write(to: fileURL())
        } catch let error {
            print("Error saving team members \(error)")
        }
    }
    
    func loadFromPersistence() {
        do {
            let data = try Data(contentsOf: fileURL())
            let decodedTeamMembers = try JSONDecoder().decode([TeamMember].self, from: data)
            self.teamMembers = decodedTeamMembers
        } catch let error {
            print("Error loading data from disk \(error)")
        }
    }
    
} // End of class
