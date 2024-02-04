import SwiftUI

struct FamilyMemberDetailView: View {
    @ObservedObject var viewModel: FamilyMemberViewModel
    var index: Int

    var body: some View {
        Form {
            Section(header: Text("Personal Information")) {
                TextField("Name", text: $viewModel.familyMembers[index].name)
                DatePicker("Date of Birth",
                           selection: $viewModel.familyMembers[index].dateOfBirth,
                           displayedComponents: .date)
            }
            
            Section(header: Text("Medical History")) {
                TextEditor(text: $viewModel.familyMembers[index].medicalHistory)
            }

            Section(header: Text("Health Records")) {
                ForEach(viewModel.familyMembers[index].healthRecords) { record in
                    VStack(alignment: .leading) {
                        Text(record.type).fontWeight(.bold)
                        Text(record.date, style: .date)
                        Text(record.notes ?? "").font(.caption)
                    }
                }
            }
            
            Section {
                Button("Save Changes") {
                    // Logic to save changes can be implemented here
                    // For simplicity, we are just popping this view
                    // Normally, you would want to update the data source and sync changes
                }
            }
        }
        .navigationBarTitle("Edit Member", displayMode: .inline)
    }
}
