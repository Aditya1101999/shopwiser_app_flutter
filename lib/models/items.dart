// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

class Model {
  static final catModel = Model._internal();
  Model._internal();
  factory Model() => catModel;
  static List<Item>? items;

  //Get Item by ID
  Item getByID(int id) =>
      items!.firstWhere((element) => element.id == id, orElse: null);

  //Get Item by position
  Item getByPos(int pos) => items![pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  final String processor;
  final String graphicsCard;
  final num displaySize;
  final String diskType;
  final num diskSpace;
  final num rating;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
    required this.processor,
    required this.graphicsCard,
    required this.displaySize,
    required this.diskType,
    required this.diskSpace,
    required this.rating
  });

  Item copyWith({
    required int id,
    required String name,
    required String desc,
    required num price,
    required String color,
    required String image,
    required String processor,
    required String graphicsCard,
    required num displaySize,
    required String diskType,
    required num diskSpace,
    required num rating
  }) {
    return Item(
      id: id,
      name: name,
      desc: desc,
      price: price,
      color: color,
      image: image,
      processor: processor,
      graphicsCard: graphicsCard,
      displaySize: displaySize,
      diskType: diskType,
      diskSpace: diskSpace,
      rating: rating
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
      'processor': processor,
      'graphicsCard': graphicsCard,
      'displaySize': displaySize,
      'diskType': diskType,
      'diskSpace': diskSpace,
      'rating': rating
    };
  }

  factory Item.fromMap(Map<dynamic, dynamic> map) {
    return Item(
      id: map['ID'] as int,
      name: map['laptop_name'] as String,
      desc: "NONE",
      price: map['discount_price'] as num,
      color: "NONE",
      image: map['img_url'] as String,
      processor: map['processor_type'] as String,
      graphicsCard: map['graphics_card'] as String,
      displaySize: map['display_size'] as num,
      diskType: map['disk_type'] as String,
      diskSpace: map['disk_space'] as num,
      rating: map['ratings_5max'] as num
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color,'
    'image: $image, processor: $processor, graphicsCard: $graphicsCard, displaySize: $displaySize,'
    'diskType: $diskType, diskSpace: $diskSpace, rating: $rating)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Item &&
        o.id == id &&
        o.name == name &&
        o.desc == desc &&
        o.price == price &&
        o.color == color &&
        o.image == image &&
        o.graphicsCard == graphicsCard &&
        o.processor == processor &&
        o.displaySize == displaySize &&
        o.diskType == diskType &&
        o.diskSpace == diskSpace &&
        o.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode ^
        graphicsCard.hashCode ^
        processor.hashCode ^
        displaySize.hashCode ^
        diskType.hashCode ^
        diskSpace.hashCode ^
        rating.hashCode;
  }

  elementAt(int index) {}
}
