({
	fetchContacts : function(component, event, helper) {
		var action = component.get("c.soqlQuery");
        var accountId = component.get("v.recordId");
        action.setParams({
            accountIds: accountId
        })
        action.setCallback(this, function(response){
            var name;
            var phone;
            var state = response.getState();
            if(state === 'SUCCESS'){
                var contactList =response.getReturnValue();
                console.log(contactList);
                component.set("v.contactList",contactList);
                for (let elements of contactList) {
                    console.log(elements);
                    var id = elements.Id;
                    name = elements.Name;
                    phone = elements.Phone;
                    var email = elements.Email;
                    var accId = elements.AccountId;
                    
                    console.log("ID "+ id);
                    console.log("Name : "+ name);
                    console.log("Phone : "+ phone);
                    console.log("Email "+ email);
                    console.log("AccountId "+ accId)
                }
                component.set("v.name",name);
                component.set("v.phone",phone);
                component.set("v.id",accountId);
            }
            else{
                alert('Error in fetching the required details');
            }
        });
        $A.enqueueAction(action);
	}
})