({
    fetchContacts : function(component, event, helper) {
        return new Promise((resolve, reject) => {
            var action = component.get("c.contactQuery");
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
                console.log("DIENSH - SABARI :::::::: contactList >>>>>>>>>>",contactList);
                var elements = contactList[0];
                
                console.log(elements);
                var id = elements.Id;
                name = elements.Name;
                phone = elements.Phone;
                var email = elements.Email;
                var accId = elements.AccountId;
                
                console.log("getContact ::: action >>>>>>> ID "+ id);
                console.log("getContact ::: action >>>>>>> Name : "+ name);
                console.log("getContact ::: action >>>>>>> Phone : "+ phone);
                console.log("getContact ::: action >>>>>>> Email "+ email);
                console.log("getContact ::: action >>>>>>> AccountId "+ accId)
                
                
                
                component.set("v.name",name);
                component.set("v.phone",phone);
                component.set("v.id",accountId);
                
                var meta = component.get("c.custData");
                meta.setCallback(this, function(response){
                    var state =response.getState();
                    if(state === 'SUCCESS'){
                        var metaList = response.getReturnValue();
                        console.log('metaList >>>>>>>> '+ metaList);
                        var osyncId = metaList["OAppS__OsyncId__c"];
                        var hash = metaList["OAppS__Hash__c"];
                        console.log('getContact ::: META >>>>>>> osyncId >>>>>>>> >>>>> ',osyncId);
                        console.log('getContact ::: META >>>>>>> hash >>>>>>>> >>>>> ',hash);
                        component.set('v.osyncId', osyncId);
                        component.set('v.hash',hash);
                        
                        resolve();
                    }
                });
                $A.enqueueAction(meta);
                
                
                var userInfo = component.get("c.userData");
                userInfo.setCallback(this, function(response){
                    var state =response.getState();
                    if(state === 'SUCCESS'){
                        var metaList = response.getReturnValue();
                        console.log('metaList >>>>>>>> '+ metaList);
                        var companyId = metaList["company_id"];
                        var userId = metaList["userId"];
                        console.log('getContact ::: userInfo >>>>>>> companyId >>>>>>>> >>>>> ',companyId);
                        console.log('getContact ::: userInfo >>>>>>> userId >>>>>>>> >>>>> ',userId);
                        component.set('v.companyId', companyId);
                        component.set('v.userId',userId);
                        
                        resolve();
                    }
                });
                $A.enqueueAction(userInfo);
            }
            else{
                alert('Error in fetching the required details');
            }
        });
        $A.enqueueAction(action);
    	});
	}
 })