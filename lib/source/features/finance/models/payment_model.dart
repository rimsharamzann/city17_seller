// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:city17_seller/source/core/extensions/enum_methods.dart';
import 'package:city17_seller/source/features/finance/enums/payment_method.dart';
import 'package:city17_seller/source/features/finance/enums/payment_schedule.dart';
import 'package:city17_seller/source/features/finance/enums/payment_status.dart';

class PaymentModel {
  final String id;
  final String uid;
  final PaymentSchedule schedule;
  final String campaignName;
  final double amount;
  final DateTime dueDate;
  final DateTime paidDate;
  final PaymentMethod paymentMethods;
  final PaymentStatus status;
  PaymentModel({
    required this.id,
    required this.uid,
    required this.schedule,
    required this.campaignName,
    required this.amount,
    required this.dueDate,
    required this.paidDate,
    required this.paymentMethods,
    required this.status,
  });

  PaymentModel copyWith({
    String? id,
    String? uid,
    PaymentSchedule? schedule,
    String? campaignName,
    double? amount,
    DateTime? dueDate,
    DateTime? paidDate,
    PaymentMethod? paymentMethods,
    PaymentStatus? status,
  }) {
    return PaymentModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      schedule: schedule ?? this.schedule,
      campaignName: campaignName ?? this.campaignName,
      amount: amount ?? this.amount,
      dueDate: dueDate ?? this.dueDate,
      paidDate: paidDate ?? this.paidDate,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uid': uid,
      'schedule': enumToString(schedule),
      'campaignName': campaignName,
      'amount': amount,
      'dueDate': dueDate.millisecondsSinceEpoch,
      'paidDate': paidDate.millisecondsSinceEpoch,
      'paymentMethods': enumToString(paymentMethods),
      'status': enumToString(status),
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      id: map['id'] as String,
      uid: map['uid'] as String,
      schedule:
          enumFromString(map['schedule'], PaymentSchedule.values) ??
          PaymentSchedule.daily,
      campaignName: map['campaignName'] as String,
      amount: map['amount'] as double,
      dueDate: DateTime.fromMillisecondsSinceEpoch(map['dueDate'] as int),
      paidDate: DateTime.fromMillisecondsSinceEpoch(map['paidDate'] as int),
      paymentMethods:
          enumFromString(map['paymentMethods'], PaymentMethod.values) ??
          PaymentMethod.bankTransfer,
      status:
          enumFromString(map['status'], PaymentStatus.values) ??
          PaymentStatus.failed,
    );
  }
  String toJson() => json.encode(toMap());

  factory PaymentModel.fromJson(String source) =>
      PaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
