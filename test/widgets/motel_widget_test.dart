import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/presentation/widgets/motel_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('MotelWidget displays motel information correctly', (WidgetTester tester) async {
    // Mock data
    final Map<String, dynamic> json = {
      'fantasia': 'Motel Example',
      'logo': 'https://example.com/logo.png',
      'bairro': 'Example Bairro',
      'distancia': 10.5,
      'qtdFavoritos': 0,
      'suites': [
        {
          'nome': 'Suíte Example',
          'qtd': 1,
          'exibirQtdDisponiveis': true,
          'fotos': [
            "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg",
              "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_2.jpg",
              "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_3.jpg",
              "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_4.jpg"
          ],
          'periodos': [
            {
              'tempoFormatado': '3 horas',
              'tempo': '3',
              'valor': 88.0,
              'valorTotal': 88.0,
              'temCortesia': false,
              'desconto': null
            }
          ]
        }
      ],
      'qtdAvaliacoes': 2159,
      'media': 4.6
    };

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MotelWidget(json: json),
        ),
      ),
    );

    // Verify the motel information is displayed correctly
    expect(find.text('Motel Example'), findsOneWidget);
    expect(find.text('4.6'), findsOneWidget);
  });
}