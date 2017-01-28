library models;

import "package:redstone_mapper/mapper.dart";
import "package:redstone_mapper_mongo/metadata.dart";

class Item {
  @Id()
  String id;

  @Field()
  @NotEmpty()
  String brand;

  @Field()
  @NotEmpty()
  String name;

  @Field()
  String imgUrl;

  @Field()
  List<Fld> flds;

  @ReferenceId()
  String user_id;

//  Item([this.name, this.notes, this.important, this.id]);
}

class Fld {
  @Field()
  String name;
  @Field()
  String val;

  Fld([this.name, this.val]);
}
