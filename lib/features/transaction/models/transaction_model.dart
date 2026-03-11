class TransactionModel {
  final String id;
  final String type;
  final String date;
  final String status;
  final String method;
  final String amount;

  TransactionModel({
    required this.id,
    required this.type,
    required this.date,
    required this.status,
    required this.amount,
    required this.method,
  });
}
