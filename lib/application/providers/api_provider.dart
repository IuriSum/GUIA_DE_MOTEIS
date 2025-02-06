import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guia_de_moteis/data/api/api_service.dart';

// Provider for ApiService
final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

// Provider to fetch data
final dataProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.fetchData();
});