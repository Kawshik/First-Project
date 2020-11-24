public with sharing class SoqlQueryOnReservations {
    // Reservation__c[] reservations;
    // List<Customer_Detail__c> customers;
    // Customer_Detail__c customer;
    // Facility__c facility;
    // Pick_up_Vehicle__c vehicle;
    // Decimal total;

    List<Reservations> reservations;
    Decimal totalBillAmmount;
    public SoqlQueryOnReservations() {
        // this.reservations = [SELECT Name, Customer_Name__c, Facility__c, Pick_up_Vehicle__c FROM Reservation__c];
        // this.searchCustomerById(this.reservations[1].Customer_Name__c);
        // this.searchFacilityById(this.reservations[1].Facility__c);
        // this.searchVehicleById(this.reservations[1].Pick_up_Vehicle__c);
        // this.calculateTotalAmount();
        this.totalBillAmmount = 0;
        this.reservations = new List<Reservations>();
        this.populateReservations();
        this.calculateTotalAmount();
    }

    public void populateReservations(){
        List<Reservation__c> queriedReservation = [SELECT Name, Customer_Name__c, Facility__c, Pick_up_Vehicle__c FROM Reservation__c];
        for (Reservation__c r : queriedReservation) {
            Customer_Detail__c customer = searchCustomerById(r.Customer_Name__c);
            Facility__c facility = searchFacilityById(r.Facility__c);
            Pick_up_Vehicle__c vehicle = searchVehicleById(r.Pick_up_Vehicle__c);
            Decimal total = customer.Leaving_Amount__c + vehicle.Discounted_Price__c;    
           
            // Reservations(String reservationId, String customerName, Integer totalBill)
            this.reservations.add(new Reservations(r.Name,customer.Name,total));
        }    
    }



    public Customer_Detail__c searchCustomerById(String customerId){
        return [SELECT Address__c,Age__c,Date_of_Joining__c,Id,Leaving_Amount__c,Name FROM Customer_Detail__c WHERE Id = :customerId];
    }

    public Facility__c searchFacilityById(String facilityId){
        return [SELECT Facility_Type__c,Id,Name FROM Facility__c WHERE Id = :facilityId];
    }

    public Pick_up_Vehicle__c searchVehicleById(String vehicleId){
        return [SELECT Name,Description__c,Discounted_Price__c,Id,Parking_Area_Name__c,Price__c,Vehicle_Condition__c,Vehicle_Type__c FROM Pick_up_Vehicle__c WHERE Id = :vehicleId];
    }

    public void calculateTotalAmount(){
        for (Reservations r : this.reservations) {
            this.totalBillAmmount += r.getTotalBill();
        }
    }

    // public Decimal getTotal(){
    //     return this.total;
    // }

    // public Customer_Detail__c getCustomer(){
    //     return this.customer;
    // }

    // public Facility__c getFacility(){
    //     return this.facility;
    // }

    // public Pick_up_Vehicle__c getVehicle(){
    //     return this.vehicle;
    // }

    public List<Reservations> getReservations(){
        return this.reservations;
    }

    public Decimal getTotalBillAmmount(){
        return this.totalBillAmmount;
    }
}
