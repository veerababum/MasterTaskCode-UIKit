//
//  SATScore.swift
//  19860706-VeerababuMulugu-NYCSchools
//
//  Created by Veerababu Mulugu on 8/21/23.
//  Copyright © 2023 Srinivas. All rights reserved.
//

import Foundation

struct SATScore: Codable {
    let dbn: String
    let schoolName: String
    let numOfSatTestTakers: String
    let satCriticalReadingAvgScore: String
    let satWritingAvgScore: String
    let satMathAvgScore: String
}
