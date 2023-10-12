//
//  SATScore.swift
//  19860706-VeerababuMulugu-NYCSchools
//
//  Created by Veerababu Mulugu on 8/21/23.
//  Copyright © 2023 Srinivas. All rights reserved.
//

import Foundation

struct SATScore: Codable {
    let id: String
    let schoolName: String
    let numOfTestTakers: String
    let readingScore: String
    let writingScore: String
    let mathScore: String
    
    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case schoolName = "school_name"
        case numOfTestTakers = "num_of_sat_test_takers"
        case readingScore = "sat_critical_reading_avg_score"
        case writingScore = "sat_writing_avg_score"
        case mathScore = "sat_math_avg_score"
    }
}
extension SATScore {
    static var fake: SATScore {
        let satScore = SATScore(id: "01M448", schoolName: "University Neighborhood High School", numOfTestTakers: "46", readingScore: "234", writingScore: "345", mathScore: "342")
        return satScore
    }
}
