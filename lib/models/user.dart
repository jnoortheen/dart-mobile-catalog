library models;

import "package:redstone_mapper/mapper.dart";
import "package:redstone_mapper_mongo/metadata.dart";

class Item {
  @Id()
  String id;
  @Field()
  String name;
  @Field()
  String imgUrl;
  @Field()
  String email;
}
