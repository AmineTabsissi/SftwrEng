//
//  FamilyMember.swift
//  SftwrEng
//
//  Created by Amine Tabsissi on 04/02/2024.
//

import Foundation

struct FamilyMember: Identifiable, Codable {
    var id = UUID()
    var name: String
    var dateOfBirth: Date
    var medicalHistory: String
    var healthRecords: [HealthRecord]
    
    struct HealthRecord: Identifiable, Codable {
        var id = UUID()
        var type: String // E.g., Vaccination, Check-up
        var date: Date
        var notes: String?
    }
}
