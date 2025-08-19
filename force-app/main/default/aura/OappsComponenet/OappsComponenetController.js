({
    getContactList : function(component, event, helper) {
        helper.fetchContacts(component, event, helper);
        console.log("Hey there this is a simple print :-| ");
	},
    google:function(component, event, helper){
        var name = component.get("v.name");
        console.log("name "+ name);
        var phone = component.get("v.phone");
        console.log("phone "+ phone);
        var id = component.get("v.id");
        console.log("id "+ id);
        var eUrl =$A.get("e.force:navigateToURL");
        //"url":'https://google.com/'+phone
        eUrl.setParams({
            "url":'https://alpha.oapps.xyz/client/omessage/extension/index.html?action=send&isOmniAccount=true&phone='+ phone +'&id='+ id +'&module=Contact&leftServiceId=1234567ghjadsfhjka'
        });
        eUrl.fire();
    }
})