import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../mocks/mock_api_service.mocks.dart';
import 'dart:convert';

void main() {

  TestWidgetsFlutterBinding.ensureInitialized();

  group('ApiService Tests', () {
    late MockApiService mockApiService;

    setUp(() {
      mockApiService = MockApiService();
    });

    test('fetchData returns data from JSON file when the call is successful', () async {
      // Arrange
      final mockJson = await rootBundle.loadString('assets/data/mock_response.json');
      final mockData = jsonDecode(mockJson) as Map<String, dynamic>;
      when(mockApiService.fetchData()).thenAnswer((_) async => mockData);
      // Act
      final result = await mockApiService.fetchData();
      // Assert
      expect(result, isA<Map<String, dynamic>>());
      verify(mockApiService.fetchData()).called(1);
    });

    test('fetchData throws an exception when the call fails', () async {
      // Arrange
      when(mockApiService.fetchData()).thenThrow(Exception('Failed to load data'));

      // Act
      try {
        await mockApiService.fetchData();
      } catch (e) {
        // Assert
        expect(e, isException);
      }
      verify(mockApiService.fetchData()).called(1);
    });
  });
}