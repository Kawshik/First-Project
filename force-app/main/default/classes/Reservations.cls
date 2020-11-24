public with sharing class Reservations {
    String reservationId;
    String customerName;
    Decimal totalBill;
    
    public Reservations() {

    }

    public Reservations(String reservationId, String customerName, Decimal totalBill){
        this.reservationId = reservationId;
        this.customerName = customerName;
        this.totalBill = totalBill;
    }

    public String getReservationId(){ return this.reservationId; }
    public String getCustomerName(){ return this.customerName; }
    public Decimal getTotalBill(){ return this.totalBill; }
}
