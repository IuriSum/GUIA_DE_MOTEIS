import 'package:guia_de_moteis/domain/suite.dart';

class Motel {
  final Map<String, dynamic> _data;

  Motel({required Map<String, dynamic> json}) : _data = json;

  String get fantasia => _data['fantasia'] ?? '';
  String get logo => _data['logo'] ?? '';
  String get bairro => _data['bairro'] ?? '';
  double get distancia => _data['distancia']?.toDouble() ?? 0.0;
  int get qtdFavoritos => _data['qtdFavoritos'] ?? 0;
  List<Suite> get suites => (_data['suites'] as List).map((suite) => Suite.fromJson(suite)).toList();
  int get qtdAvaliacoes => _data['qtdAvaliacoes'] ?? 0;
  double get media => _data['media']?.toDouble() ?? 0.0;

  factory Motel.fromJson(Map<String, dynamic> json) {
    return Motel(json: json);
  }

  @override
  String toString() {
    return 'Motel{fantasia: $fantasia, logo: $logo, bairro: $bairro, distancia: $distancia, qtdFavoritos: $qtdFavoritos, suites: $suites, qtdAvaliacoes: $qtdAvaliacoes, media: $media}';
  }
}

// class Item {
//   final Map<String, dynamic> _data;

//   Item({required Map<String, dynamic> json}) : _data = json;

//   String get nome => _data['nome'] ?? '';

//   @override
//   String toString() {
//     return 'Item{nome: $nome}';
//   }

//   factory Item.fromJson(Map<String, dynamic> json) {
//     return Item(json: json);
//   }
// }

// class CategoriaItem {
//   final Map<String, dynamic> _data;

//   CategoriaItem({required Map<String, dynamic> json}) : _data = json;

//   String get nome => _data['nome'] ?? '';
//   String get icone => _data['icone'] ?? '';

//   @override
//   String toString() {
//     return 'CategoriaItem{nome: $nome, icone: $icone}';
//   }

//   factory CategoriaItem.fromJson(Map<String, dynamic> json) {
//     return CategoriaItem(json: json);
//   }
// }

// class Desconto {
//   final Map<String, dynamic> _data;

//   Desconto({required Map<String, dynamic> json}) : _data = json;

//   double get desconto => _data['desconto']?.toDouble() ?? 0.0;

//   @override
//   String toString() {
//     return 'Desconto{desconto: $desconto}';
//   }

//   factory Desconto.fromJson(Map<String, dynamic> json) {
//     return Desconto(json: json);
//   }
// }