//
//  TeamMember.swift
//  Group App
//
//  Created by Nicholas Towery on 1/11/21.
//

import Foundation
import UIKit

struct TeamMember: Codable {
    let name: String
    let bio: String
    let photo: Image
    let interests: [Image]
}

extension TeamMember: Equatable {
    static func == (lhs: TeamMember, rhs: TeamMember) -> Bool {
        lhs.name == rhs.name
    }
}
