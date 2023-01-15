import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

part 'produkmodel.g.dart';

@JsonSerializable()
class ProdukList {
  ProdukList({required this.categories});
  final List<Produk> categories;
  factory ProdukList.fromJson(Map<String, dynamic> json) =>
      _$ProdukListFromJson(json);
  Map<String, dynamic> toJson() => _$ProdukListToJson(this);
}

@JsonSerializable()
class Produk {
  Produk(
      {required this.id,
      required this.judul,
      required this.image,
      required this.deskripsi});
  final String id;
  final String judul;
  final String image;
  final String deskripsi;
  factory Produk.fromJson(Map<String, dynamic> json) => _$ProdukFromJson(json);
  Map<String, dynamic> toJson() => _$ProdukToJson(this);
}

Future<ProdukList> getProdukList() async {
  const url = 'https://www.themealdb.com/api/json/v1/1/categories.php';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return ProdukList.fromJson(json.decode(response.body));
  } else {
    throw HttpException('Error ${response.reasonPhrase}', uri: Uri.parse(url));
  }
}
