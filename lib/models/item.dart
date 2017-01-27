library models;

import "package:redstone_mapper/mapper.dart";
import 'package:redstone_mapper/mapper_factory.dart';
import "package:redstone_mapper_mongo/metadata.dart";

class Item {
  @Id()
  String id;
  @Field()
  String brand;
  @Field()
  String name;
  @Field()
  String imgUrl;

  @Field()
  List<Fld> flds;

  @ReferenceId()
  String user_id;

//  Contact([this.name, this.notes, this.important, this.id]);

}

class Fld {
  @Field()
  String name;
  @Field()
  String val;
}

//main() {
//  bootstrapMapper();
//  ItemField usr = new ItemField()
//    ..name = "user"
//    ..val = "mohammed aasir";
//  Item itm = new Item()
//    ..brand = "nokia"
//    ..flds = [usr, usr, usr];
//  print(encode(itm));
//}