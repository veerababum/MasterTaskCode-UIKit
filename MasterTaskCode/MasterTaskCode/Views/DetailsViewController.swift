//
//  DetailsViewController.swift
//  MasterTaskCode
//
//  Created by Veerababu Mulugu on 10/11/23.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var readingLabel: UILabel!
    @IBOutlet weak var mathLabel: UILabel!
    @IBOutlet weak var writingLabel: UILabel!
    var selectedDbn: String = ""
    
    var schoolDeatilsModel = SchoolDeatilsModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "SAT Score"
        fetchAndReloadData()
    }
    
    fileprivate func updateUI(_ matchingScore: SATScore) {
        // You have found a matching SATScore
        DispatchQueue.main.async {
            self.schoolName.text = matchingScore.schoolName
            self.readingLabel.text = "Reading:  \(matchingScore.satCriticalReadingAvgScore)"
            self.mathLabel.text = "Math:  \(matchingScore.satMathAvgScore)"
            self.writingLabel.text = "Writing:  \(matchingScore.satWritingAvgScore)"
        }
    }
    
    private func fetchAndReloadData() {
        Task {
            await schoolDeatilsModel.fetchSchoolsDeatils()
            
            if let matchingScore = schoolDeatilsModel.schoolDetails.first(where: { $0.dbn == selectedDbn }) {
                updateUI(matchingScore)
            } else {
                // No matching SATScore found
                print("No matching school with DBN: \(selectedDbn)")
            }
        }
    }
}
