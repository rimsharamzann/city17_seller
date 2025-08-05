// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:city17_seller/source/core/extensions/enum_methods.dart';
import 'package:city17_seller/source/features/auth/enums/user_status.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String contactNo;
  final String profilePic;
  final UserStatus status;
  final DateTime joinedDate;
  final int totalAds;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.contactNo,
    required this.profilePic,
    required this.status,
    required this.joinedDate,
    required this.totalAds,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? contactNo,
    String? profilePic,
    UserStatus? status,
    DateTime? joinedDate,
    int? totalAds,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      contactNo: contactNo ?? this.contactNo,
      profilePic: profilePic ?? this.profilePic,
      status: status ?? this.status,
      joinedDate: joinedDate ?? this.joinedDate,
      totalAds: totalAds ?? this.totalAds,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'contactNo': contactNo,
      'profilePic': profilePic,
      'status': enumToString(status),
      'joinedDate': joinedDate.millisecondsSinceEpoch,
      'totalAds': totalAds,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      contactNo: map['contactNo'] as String,
      profilePic: map['profilePic'] as String,
      status:
          enumFromString(map['status'], UserStatus.values) ?? UserStatus.buyer,
      joinedDate: DateTime.fromMillisecondsSinceEpoch(map['joinedDate'] as int),
      totalAds: map['totalAds'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
