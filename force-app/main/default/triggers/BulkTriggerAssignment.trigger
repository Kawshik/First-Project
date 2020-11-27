trigger BulkTriggerAssignment on Facility__c (after insert) {
    
    List<Facility__c> updatedFacilities = [SELECT Id,Name FROM Facility__c 
                                            WHERE Id IN :Trigger.New];
    // system.debug('Updated Facilities: '  + updatedFacilities);
    
    List<Parking__c> parkingsToInsert = new List<Parking__c>();

    for (Facility__c facility : updatedFacilities) {
        
        Parking__c p = new Parking__c(Name='Parking For ' + facility.Name, 
                            Parking_for_Facility__c = facility.Id, 
                            Total_Slots__c=12);

        parkingsToInsert.add(p);
    }

    // system.debug('Parkings To Insert: ' + parkingsToInsert);
   insert parkingsToInsert;
}