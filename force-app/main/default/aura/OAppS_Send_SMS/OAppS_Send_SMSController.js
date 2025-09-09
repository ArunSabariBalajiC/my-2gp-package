({
  getContact: function (component, event, helper) {
    helper.fetchContacts(component, event, helper).then(function () {
      var phone = component.get("v.phone");
      console.log("getContact 1111 ::::::::::::: phone " + phone);
      var id = component.get("v.id");
      console.log("getContact 1111 ::::::::::::: id " + id);
      var module = component.get("v.sObjectName");
      console.log("module " + module);
      var osyncId = component.get("v.osyncId");
      console.log("getContact 1111 ::::::::::::: osyncId " + osyncId);
      var hash = component.get("v.hash");
      console.log("getContact 1111 ::::::::::::: hash " + hash);
      var companyId = component.get("v.companyId");
      console.log("companyId " + companyId);
      var userId = component.get("v.userId");
      console.log("userId " + userId);
      var url =
        "https://client5.rekzyl.com/sendsms?leftServiceId=1352c6aa-d73b-4829-a709-7770bf71966a&service=salesforce&userId=" +
        userId +
        "&companyId=" +
        companyId +
        "&selectedIds=" +
        id +
        "&resource=" +
        module +
        "&view=details&sideBar=false&topBar=false";
      component.set("v.iframeUrl", url);
    });
  },
  openModel: function (component, event, helper) {
    // Set isModalOpen attribute to true
    //component.set("v.isModalOpen", true);

    var name = component.get("v.name");
    console.log("name " + name);
    var phone = component.get("v.phone");
    console.log("phone " + phone);
    var id = component.get("v.id");
    console.log("id " + id);
    var osyncId = component.get("v.osyncId");
    console.log("osyncId " + osyncId);
    var hash = component.get("v.hash");
    console.log("hash " + hash);
    var module = component.get("v.sObjectName");
    console.log("module " + module);
    var companyId = component.get("v.companyId");
    console.log("companyId " + companyId);
    var userId = component.get("v.userId");
    console.log("userId " + userId);
    var url =
      "https://client5.rekzyl.com/sendsms?leftServiceId=1352c6aa-d73b-4829-a709-7770bf71966a&service=salesforce&userId=" +
      userId +
      "&companyId=" +
      companyId +
      "&selectedIds=" +
      id +
      "&resource=" +
      module +
      "&view=details&sideBar=false&topBar=false";
    console.log("url >>>>>>>> " + url);
    component.set("v.iframeUrl", url);
  },
  closeModel: function (component, event, helper) {
    // Set isModalOpen attribute to false
    component.set("v.isModalOpen", false);
  }
});
