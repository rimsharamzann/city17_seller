import 'dart:convert';

class DisplayLocationModel {
  final String name;
  final String brand;
  final String address;
  final String category;
  final int totalDisplays;
  final int draftDisplays;
  final int onlineDisplays;
  final int offlineDisplays;
  DisplayLocationModel({
    required this.name,
    required this.brand,
    required this.address,
    required this.category,
    required this.totalDisplays,
    required this.draftDisplays,
    required this.onlineDisplays,
    required this.offlineDisplays,
  });

  DisplayLocationModel copyWith({
    String? name,
    String? brand,
    String? address,
    String? category,
    int? totalDisplays,
    int? draftDisplays,
    int? onlineDisplays,
    int? offlineDisplays,
  }) {
    return DisplayLocationModel(
      name: name ?? this.name,
      brand: brand ?? this.brand,
      address: address ?? this.address,
      category: category ?? this.category,
      totalDisplays: totalDisplays ?? this.totalDisplays,
      draftDisplays: draftDisplays ?? this.draftDisplays,
      onlineDisplays: onlineDisplays ?? this.onlineDisplays,
      offlineDisplays: offlineDisplays ?? this.offlineDisplays,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'brand': brand,
      'address': address,
      'category': category,
      'totalDisplays': totalDisplays,
      'draftDisplays': draftDisplays,
      'onlineDisplays': onlineDisplays,
      'offlineDisplays': offlineDisplays,
    };
  }

  factory DisplayLocationModel.fromMap(Map<String, dynamic> map) {
    return DisplayLocationModel(
      name: map['name'] as String,
      brand: map['brand'] as String,
      address: map['address'] as String,
      category: map['category'] as String,
      totalDisplays: map['totalDisplays'] as int,
      draftDisplays: map['draftDisplays'] as int,
      onlineDisplays: map['onlineDisplays'] as int,
      offlineDisplays: map['offlineDisplays'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DisplayLocationModel.fromJson(String source) =>
      DisplayLocationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
