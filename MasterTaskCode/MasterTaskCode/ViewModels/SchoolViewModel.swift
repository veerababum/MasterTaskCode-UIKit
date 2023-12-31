//
//  SchoolViewModel.swift
//  MasterTaskCode
//
//  Created by Veerababu Mulugu on 10/10/23.
//

import Foundation


class SchoolViewModel: NSObject {
    
    // Define the URL for fetching school data
    
    // Store the fetched schools and filtered schools separately
    var schools: [School] = []
    var filteredSchools: [School] = []
    
    override init() {
        super.init()
        // Initialize the arrays with empty values
        schools = []
        filteredSchools = []
    }
    
    // Function to fetch schools from the API
    func fetchSchools() async {
        do {
            // Fetch data from the API and populate both arrays
            schools = try await NetworkManager.shared.fetchData(from: NetworkConstant.schoolServiceURL)
            filteredSchools = schools
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}
