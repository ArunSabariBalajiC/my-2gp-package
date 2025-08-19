({
	getUrlDetails : function(component, event, helper) {
        helper.fetchContacts(component, event, helper);
	},
    trigger : function(component, event, helper) {
        console.log("component 01" + component);
        var osyncId = component.get("v.osyncId");
        var integId = component.get("v.integId");
        var hash = component.get('v.hash');
        var eUrl =$A.get("e.force:navigateToURL");
        eUrl.setParams({
            //"url":'https://alpha.oapps.xyz/client/omessage/extension/index.html?action=send&isOmniAccount=true&phone='+ phone +'&id='+ id +'&module=Contact&leftServiceId=1352c6aa-d73b-4829-a709-7770bf71966a'
        "url":'https://mercury.rekzyl.com/client/omessage/extension/index.html?osyncId='+osyncId+'&integId='+integId+'&hash='+hash+'&orgId=https://oappstechnology-dev-ed.develop.my.salesforce.com/&leftServiceId=1352c6aa-d73b-4829-a709-7770bf71966a'
        //"url":'http://localhost.3000/app/omessage/extension/index.html?osyncId='+osyncId+'&integId='+integId+'&hash='+hash+'&leftServiceId=1352c6aa-d73b-4829-a709-7770bf71966a'
        });
        eUrl.fire();
	}
})