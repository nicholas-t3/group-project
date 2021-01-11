//
//  HomeViewController.swift
//  Group App
//
//  Created by Nicholas Towery on 1/11/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    var teamMemberToSegue: TeamMember?
    
    // MARK: - Outlets
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var tapToMeetLabel: UILabel!
    @IBOutlet weak var nicholasButton: UIButton!
    @IBOutlet weak var michaelButton: UIButton!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.alpha = 0
        taglineLabel.alpha = 0
        tapToMeetLabel.alpha = 0
        nicholasButton.alpha = 0
        michaelButton.alpha = 0
        
        UIView.animate(withDuration: 1.0) {
            self.welcomeLabel.alpha = 1
            self.taglineLabel.alpha = 1
            self.tapToMeetLabel.alpha = 1
            self.nicholasButton.alpha = 1
            self.michaelButton.alpha = 1
        }
        
        //
        //TeamMemberController.shared.saveToPersistence()
        TeamMemberController.shared.loadFromPersistence()
        
    }
    
    // MARK: - Actions
    @IBAction func nicholasButtonTapped(_ sender: Any) {
        teamMemberToSegue = TeamMemberController.shared.teamMembers[0]
        performSegue(withIdentifier: "toTeamMemberVC", sender: nil)
    }
    
    @IBAction func michaelButtonTapped(_ sender: Any) {
        teamMemberToSegue = TeamMemberController.shared.teamMembers[1]
        performSegue(withIdentifier: "toTeamMemberVC", sender: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTeamMemberVC"{
            guard let destinationVC = segue.destination as? TeamMemberViewController,
                  let teamMember = teamMemberToSegue else {return}
            
            destinationVC.teamMember = teamMember
        }
    }
    
} // End of class
