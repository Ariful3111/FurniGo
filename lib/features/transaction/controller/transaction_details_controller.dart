import 'package:get/get.dart';
import 'package:zb_dezign/features/transaction/models/transaction_model.dart';

class TransactionDetailsController extends GetxController {
  TransactionModel transactionModel = Get.arguments as TransactionModel;
  List get transactionInfo => [
    {'title': 'Transaction Date', 'value': transactionModel.date},
    {'title': 'Transaction ID', 'value': transactionModel.id},
    {'title': 'Transaction Type', 'value': transactionModel.type},
    {'title': 'Order ID', 'value': '564654654'},
    {'title': 'Payment Method', 'value': 'Secure Card Payment'},
    {'title': 'Payment Reference ID', 'value': 'dsgdfg45fgasd54'},
    {'title': 'Charged Amount', 'value': transactionModel.amount},
    {'title': 'Status', 'value': ''},
  ];
}
