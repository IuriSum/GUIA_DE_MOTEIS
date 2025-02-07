class Periodo {
  final Map<String, dynamic> _data;

  Periodo({required Map<String, dynamic> json}) : _data = json;

  String get tempoFormatado => _data['tempoFormatado'] ?? '';
  String get tempo => _data['tempo'] ?? '';
  double get valor => _data['valor']?.toDouble() ?? 0.0;
  double get valorTotal => _data['valorTotal']?.toDouble() ?? 0.0;
  bool get temCortesia => _data['temCortesia'] ?? false;
  double? get desconto {
    if (_data['desconto'] is Map<String, dynamic> && _data['desconto']["desconto"]?.toDouble() > 0.0) {
      return _data['desconto']['desconto']?.toDouble();
    }
    return null;
  }

  @override
  String toString() {
    return 'Periodo{tempoFormatado: $tempoFormatado, tempo: $tempo, valor: $valor, valorTotal: $valorTotal, temCortesia: $temCortesia, desconto: $desconto}';
  }

  factory Periodo.fromJson(Map<String, dynamic> json) {
    return Periodo(json: json);
  }
}