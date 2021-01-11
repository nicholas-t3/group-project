//
//  TeamMemberViewController.swift
//  Group App
//
//  Created by Nicholas Towery on 1/11/21.
//

import UIKit

class TeamMemberViewController: UIViewController {
    
    // MARK: - Properties
    var teamMember: TeamMember?
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var interestsLabel: UILabel!
    @IBOutlet weak var teamMemberImageView: UIImageView!
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Methods
    func setupViews(){
        guard let teamMember = teamMember else {return}
        nameLabel.text = teamMember.name
        bioLabel.text = teamMember.bio
        teamMemberImageView.image = teamMember.photo.getImage()
    }

} // End of class

