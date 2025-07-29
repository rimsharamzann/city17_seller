// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:city17_seller/source/core/extensions/enum_methods.dart';
import 'package:city17_seller/source/features/home/enums/display_enum.dart';

class DisplayModel {
  final String id;
  final String name;
  final String size;
  final String description;
  final ScreenType screenType;
  final LocationType locationType;
  final Placement placement;
  final ScreenOrientation orientation;
  final String brand;
  final String model;
  final String resolution;
  final String imageUrl;
  final bool? isDraft;
  final DateTime createdAt;
  DisplayModel({
    required this.id,
    required this.name,
    required this.size,
    required this.description,
    required this.screenType,
    required this.locationType,
    required this.placement,
    required this.orientation,
    required this.brand,
    required this.model,
    required this.resolution,
    required this.imageUrl,
    this.isDraft,
    required this.createdAt,
  });

  DisplayModel copyWith({
    String? id,
    String? name,
    String? size,
    String? description,
    ScreenType? screenType,
    LocationType? locationType,
    Placement? placement,
    ScreenOrientation? orientation,
    String? brand,
    String? model,
    String? resolution,
    String? imageUrl,
    bool? isDraft,
    DateTime? createdAt,
  }) {
    return DisplayModel(
      id: id ?? this.id,
      name: name ?? this.name,
      size: size ?? this.size,
      description: description ?? this.description,
      screenType: screenType ?? this.screenType,
      locationType: locationType ?? this.locationType,
      placement: placement ?? this.placement,
      orientation: orientation ?? this.orientation,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      resolution: resolution ?? this.resolution,
      imageUrl: imageUrl ?? this.imageUrl,
      isDraft: isDraft ?? this.isDraft,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'size': size,
      'description': description,
      'screenType': enumToString(screenType),
      'locationType': enumToString(locationType),
      'placement': enumToString(placement),
      'orientation': enumToString(orientation),
      'brand': brand,
      'model': model,
      'resolution': resolution,
      'imageUrl': imageUrl,
      'isDraft': isDraft,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory DisplayModel.fromMap(Map<String, dynamic> map) {
    return DisplayModel(
      id: map['id'] as String,
      name: map['name'] as String,
      size: map['size'] as String,
      description: map['description'] as String,
      screenType:
          enumFromString(map['screenType'], ScreenType.values) ??
          ScreenType.fixed,
      locationType:
          enumFromString(map['locationType'], LocationType.values) ??
          LocationType.restaurant,
      placement:
          enumFromString(map['placement'], Placement.values) ??
          Placement.facingOutside,
      orientation:
          enumFromString(map['orientation'], ScreenOrientation.values) ??
          ScreenOrientation.horizontal,
      brand: map['brand'] as String,
      model: map['model'] as String,
      resolution: map['resolution'] as String,
      imageUrl: map['imageUrl'] as String,
      isDraft: map['isDraft'] != null ? map['isDraft'] as bool : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory DisplayModel.fromJson(String source) =>
      DisplayModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
