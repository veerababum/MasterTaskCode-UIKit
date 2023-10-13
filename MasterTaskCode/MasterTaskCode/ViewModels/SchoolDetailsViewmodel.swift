//
//  SchoolDetailsViewmodel.swift
//  MasterTaskCode
//
//  Created by Veerababu Mulugu on 10/12/23.
//

import UIKit

class SchoolDeatilsModel: NSObject {
    
    // Define the URL for fetching school data
    
    // Store the fetched schools and filtered schools separately
    var schoolDetails: [SATScore] = []
    var filteredSchools: [SATScore] = []
    
    override init() {
        super.init()
        // Initialize the arrays with empty values
        schoolDetails = []
    }
    
    // Function to fetch schools from the API
    func fetchSchoolsDeatils() async {
        do {
            // Fetch data from the API and populate both arrays
            schoolDetails =  try await NetworkManager.shared.fetchData(from: NetworkConstant.schoolDetailsUrl)
            
            filteredSchools = schoolDetails
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}

