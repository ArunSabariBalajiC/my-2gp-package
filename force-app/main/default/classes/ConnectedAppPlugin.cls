global class ConnectedAppPlugin extends Auth.ConnectedAppPlugin {
  // Return a user’s permission set assignments
  global override Map<String, String> customAttributes(
    Id userId,
    Id connectedAppId,
    Map<String, String> formulaDefinedAttributes,
    Auth.InvocationContext context
  ) {
    // Custom metadata removed - using default values
    String OsyncId = 'default-osync-id';
    string IntegId = 'default-integ-id';
    String Hash = 'default-hash';

    Organization org = [SELECT id, Name FROM Organization];
    List<PermissionSetAssignment> psas = [
      SELECT id, PermissionSet.Name
      FROM PermissionSetAssignment
      WHERE PermissionSet.IsOwnedByProfile = FALSE AND AssigneeId = :userId
    ];
    String permsets = '[';
    for (PermissionSetAssignment psa : psas) {
      permsets += psa.PermissionSet.Name + ';';
    }
    permsets += ']';
    formulaDefinedAttributes.put('PermissionSets', permsets);
    formulaDefinedAttributes.put('OsyncID', OsyncId);
    formulaDefinedAttributes.put('IntegId', IntegId);
    formulaDefinedAttributes.put('Hash', Hash);

    return formulaDefinedAttributes;
  }
}
