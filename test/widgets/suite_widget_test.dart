import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/domain/periodo.dart';

import 'package:guia_de_moteis/presentation/widgets/suite_widget.dart';
import 'package:mockito/mockito.dart';

import '../mocks/mock_suite_widget.mocks.dart';

void main() {
  late MockSuite mockSuite;

  setUp(() {
    mockSuite = MockSuite();
  });

  testWidgets('SuiteWidget displays suite information', (WidgetTester tester) async {
    // Mock the Suite object
    when(mockSuite.nome).thenReturn('Suíte Example');
    when(mockSuite.periodos).thenReturn([
      Periodo(json: {
        'tempoFormatado': '3 horas',
        'tempo': '3',
        'valor': 88.0,
        'valorTotal': 88.0,
        'temCortesia': false,
        'desconto': null
      }),
    ]);
    when(mockSuite.qtd).thenReturn(1);
    when(mockSuite.exibirQtdDisponiveis).thenReturn(true);
    when(mockSuite.fotos).thenReturn([
      "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg",
      "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_2.jpg",
      "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_3.jpg",
      "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_4.jpg"
    ]);

    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SuiteWidget(suite: mockSuite),
      ),
    ));

    // Verify the suite name is displayed
    expect(find.text('Suíte Example'), findsOneWidget);

    // Verify the periodos are displayed
    expect(find.text('3 horas'), findsOneWidget);
    expect(find.text('R\$ 88,00'), findsOneWidget);

    // Verify the available suites are displayed
    expect(find.text('Suítes disponíveis: 1'), findsOneWidget);

    // Verify the images are displayed
    expect(find.byType(CachedNetworkImage), findsNWidgets(3));
  });
}