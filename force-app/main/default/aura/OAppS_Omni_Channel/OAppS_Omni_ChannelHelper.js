({
  fetchContacts: function (component, event, helper) {
    var action = component.get("c.custData");
    action.setCallback(this, function (response) {
      var state = response.getState();
      if (state === "SUCCESS") {
        var metaList = response.getReturnValue();

        console.log("metaList >>>>>>>> " + metaList);

        var integId = metaList["OAppS__IntegId__c"];
        var osyncId = metaList["OAppS__OsyncId__c"];
        var hash = metaList["OAppS__Hash__c"];
        component.set("v.osyncId", osyncId);
        component.set("v.integId", integId);
        component.set("v.hash", hash);
      }
    });
    $A.enqueueAction(action);
  }
});
