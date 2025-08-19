public with sharing class ContactSelectedRecords {
    public List<Contact> getIDs;
    public List<Contact> selectedRecords { get; set;}  
    public String Url {get; set;}
    public String Ids = null;
    public ContactSelectedRecords(ApexPages.StandardSetController controller){
        getIDs = controller.getSelected();
        selectedRecords = new List<Contact>();
        for (Contact acc : getIDs) {
            Contact record =[Select Name, phone From Contact Where Id = :acc.Id];
            selectedRecords.add(record);
            if(Ids!=null){
                Ids += ','+record.Id;  
            }else{
                Ids = record.Id;
            }
        } 
        String organisationId = (String)UserInfo.getOrganizationId();
        String userId = (String)UserInfo.getUserId();
        Url = 'https://client5.rekzyl.com/campaign?leftServiceId=1352c6aa-d73b-4829-a709-7770bf71966a&service=salesforce&userId='+userId+'&companyId='+organisationId+'&selectedIds='+Ids+'&resource=Contact&view=list&sideBar=false&topBar=false&fullView=false';
    }

}