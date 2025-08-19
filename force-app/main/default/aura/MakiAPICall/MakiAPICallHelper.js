({
    onHandleClick : function(component, event, helper) {
        // Get the action of Controller (Apex) Class
        // 
        var metaDataAction = component.get('c.getMetaData');
        metaDataAction.setCallback(this, function(metaDataResponse){
            // get the state
            console.log("metaDataResponse >>>>>>>>>>> ",metaDataResponse);
            
            var metaList = metaDataResponse.getReturnValue();
            console.log("metaList >>>>>>>>>>> 1 >>>>>>> ",metaList);
            var companyId = metaList["company_id"];
            var userId = metaList["userId"];           
            console.log('getContact ::: userInfo >>>>>>> companyId >>>>>>>> >>>>> ',companyId);
            console.log('getContact ::: userInfo >>>>>>> userId >>>>>>>> >>>>> ',userId);

            var redirectionUrl = 'https://client5.rekzyl.com/salesforce/landing?leftServiceId=1352c6aa-d73b-4829-a709-7770bf71966a&service=salesforce&userId='+userId+'&companyId='+companyId;
            component.set("v.redirectUrl",redirectionUrl);
            
        });
        $A.enqueueAction(metaDataAction);
        
    }
})