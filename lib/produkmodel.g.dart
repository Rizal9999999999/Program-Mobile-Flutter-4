part of 'produkmodel.dart';

ProdukList _$ProdukListFromJson(Map<String, dynamic> json) => ProdukList(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Produk.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProdukListToJson(ProdukList instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

Produk _$ProdukFromJson(Map<String, dynamic> json) => Produk(
      id: json['idCategory'] as String,
      judul: json['strCategory'] as String,
      image: json['strCategoryThumb'] as String,
      deskripsi: json['strCategoryDescription'] as String,
    );

Map<String, dynamic> _$ProdukToJson(Produk instance) => <String, dynamic>{
      'idCategory' : instance.id,
      'strCategory': instance.judul,
      'strCategoryThumb': instance.image,
      'strCategoryDescription': instance.deskripsi,
    };
