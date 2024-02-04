import Foundation

class FamilyMemberViewModel: ObservableObject {
    @Published var familyMembers: [FamilyMember] = []
    
    func addFamilyMember(_ member: FamilyMember) {
        familyMembers.append(member)
    }
    
    func deleteFamilyMember(at indexSet: IndexSet) {
        familyMembers.remove(atOffsets: indexSet)
    }
    
    func duplicateFamilyMember(_ member: FamilyMember) {
        var duplicatedMember = member
        duplicatedMember.id = UUID() // Ensure the duplicated member has a unique ID
        addFamilyMember(duplicatedMember)
    }
}
