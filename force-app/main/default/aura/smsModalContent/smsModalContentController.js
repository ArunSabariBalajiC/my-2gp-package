/*({
    myAction : function(component, event, helper) {
        helper.fetchContacts(component, event, helper);
    },
    handleShowModalFooter : function (component, event, helper) {
        var name = component.get("v.name");
        var phone = component.get("v.phone");
        var id = component.get("v.id");
        var osyncId = component.get("v.osyncId");
        var hash =component.get("v.hash");
        var module = component.get("v.sObjectName");
//        var url = 'https://mercury.rekzyl.com/client/omessage/extension/index.html?action=send&isOmniAccount=true&osyncId='+osyncId+'&hash='+hash+'&phone='+ phone +'&id='+ id +'&module='+module+'&leftServiceId=1352c6aa-d73b-4829-a709-7770bf71966a&serviceName=Salesforce';		
        //console.log("url >>>>>>> "+url);
//        component.set("v.iframeUrl","http://www.youtube.com/embed/n_dZNLr2cME?rel=0&hd=1");
        var modalBody;
        var modalFooter;
        $A.createComponents(
            function(components, status){
                if (status === "SUCCESS") {
                    modalBody = components[1];
                    modalFooter = components[0];
                    component.find('overlayLib').showCustomModal({
                        header: "Application Confirmation",
                        body: modalBody,
                        footer: modalFooter,
                        showCloseButton: true,
                        cssClass: "my-modal,my-custom-class,my-other-class,cModalOpener",
                        closeCallback: function() {
                            alert('You closed the alert!');
                        }
                    })
                }
            }
        );
        
    }
    
})*/

({
  myAction: function (component, event, helper) {}
});
