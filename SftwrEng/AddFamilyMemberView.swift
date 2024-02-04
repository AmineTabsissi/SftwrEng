import SwiftUI

struct AddFamilyMemberView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: FamilyMemberViewModel
    @State private var name: String = ""
    @State private var dateOfBirth: Date = Date()
    @State private var medicalHistory: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Name", text: $name)
                    DatePicker("Date of Birth", selection: $dateOfBirth, displayedComponents: .date)
                }
                
                Section(header: Text("Medical History")) {
                    TextEditor(text: $medicalHistory)
                }
                
                Section {
                    Button("Add Family Member") {
                        let newMember = FamilyMember(name: name, dateOfBirth: dateOfBirth, medicalHistory: medicalHistory, healthRecords: [])
                        viewModel.addFamilyMember(newMember)
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
            .navigationBarTitle("Add Family Member", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
