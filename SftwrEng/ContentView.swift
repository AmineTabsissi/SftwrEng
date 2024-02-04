//
//  ContentView.swift
//  SftwrEng
//
//  Created by Amine Tabsissi on 04/02/2024.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: FamilyMemberProfilesView()) {
                    Text("Family Member Profiles")
                }
                NavigationLink(destination: VaccinationScheduleView()) {
                    Text("Vaccination Schedule")
                }
                NavigationLink(destination: HealthCheckupSchedulerView()) {
                    Text("Health Check-up Scheduler")
                }
                NavigationLink(destination: DocumentUploadView()) {
                    Text("Document Upload")
                }
            }
            .navigationTitle("HestiaHub Dashboard")
        }
    }
}

#Preview {
    DashboardView()
}
