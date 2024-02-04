import SwiftUI

struct FamilyMemberProfilesView: View {
    @StateObject var viewModel = FamilyMemberViewModel()
    @State private var showingAddMemberView = false
    
    var body: some View {
        List {
            ForEach(viewModel.familyMembers.indices, id: \.self) { index in
                NavigationLink(destination: FamilyMemberDetailView(viewModel: viewModel, index: index)) {
                    Text(viewModel.familyMembers[index].name)
                }
            }
            .onDelete(perform: viewModel.deleteFamilyMember)
        }
        .navigationTitle("Family Members")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showingAddMemberView = true }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddMemberView) {
            AddFamilyMemberView(viewModel: viewModel)
        }
    }
}
