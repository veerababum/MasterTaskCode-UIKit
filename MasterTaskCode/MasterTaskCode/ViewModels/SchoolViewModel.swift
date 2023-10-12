//
//  SchoolViewModel.swift
//  MasterTaskCode
//
//  Created by Veerababu Mulugu on 10/10/23.
//

import Foundation

class SchoolViewModel : NSObject {
    
    private let schoolServiceURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    //private let schoolDetailsUrl = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    var schools : [School]!
    var filteredSchools: [School] = []
    override init() {
        self.schools = []
    }
        
    func fetchSchools() async {
        do {
            schools = try await NetworkManager.shared.fetchData(from: schoolServiceURL)
            // Initialize filteredSchools with all schools
            filteredSchools = schools

        } catch {
            print("Error fetching data: \(error)")
        }
        
    }
}

