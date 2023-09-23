trigger NewUserToGroup on User (after insert) {
    // Get the ID of the user group you want to add the user to
    Id groupId = [SELECT Id FROM Group WHERE Name = 'My User Group'].Id;
    
    // Create a list to hold the new group membership records
    List<GroupMember> groupMembers = new List<GroupMember>();
    
    // Loop through the new user records and create a new group membership record for each user
    for (User u : Trigger.new) {
        GroupMember gm = new GroupMember();
        gm.GroupId = groupId;
        gm.UserOrGroupId = u.Id;
        groupMembers.add(gm);
    }
    
    // Insert the new group membership records
    insert groupMembers;
}