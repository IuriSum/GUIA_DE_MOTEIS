import 'package:guia_de_moteis/domain/periodo.dart';

class Suite {
  final Map<String, dynamic> _data;

  Suite({required Map<String, dynamic> json}) : _data = json;

  String get nome => _data['nome'] ?? '';
  int get qtd => _data['qtd'] ?? 0;
  bool get exibirQtdDisponiveis => _data['exibirQtdDisponiveis'] ?? false;
  List<String> get fotos => List<String>.from(_data['fotos'] ?? []);
  List<Periodo> get periodos => (_data['periodos'] as List).map((periodo) => Periodo.fromJson(periodo)).toList();

  @override
  String toString() {
    return 'Suite{nome: $nome, qtd: $qtd, exibirQtdDisponiveis: $exibirQtdDisponiveis, fotos: $fotos, periodos: $periodos}';
  }

  factory Suite.fromJson(Map<String, dynamic> json) {
    return Suite(json: json);
  }
}