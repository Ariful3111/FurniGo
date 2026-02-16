class RentalModel {
  final String id;
  final String propertyType;
  final String startDate;
  final String endDate;
  final String status;
  final String shipment;
  final String payment;

  RentalModel({
    required this.id,
    required this.propertyType,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.shipment,
    required this.payment,
  });
}
