import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guia_de_moteis/data/api/api_service.dart';
import 'package:guia_de_moteis/presentation/colors/colors.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final dataProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.fetchData();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(dataProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Home Screen',
          style: TextStyle(
            color: Colors.white, // Contrasting text color for the app bar
          ),
        ),
        backgroundColor: AppColors.headerFooterColor1, // Use the first header/footer color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the App!',
              style: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'This is a sample home screen.',
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 40),
            dataAsync.when(
              loading: () => CircularProgressIndicator(),
              error: (error, stack) => Text('Error: $error'),
              data: (data) {
                if (data.containsKey("error")) {
                  return Text('Error: ${data["error"]}');
                }
                return Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.accentColor1, // Use the first accent color
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Data: ${data.toString()}',
                    style: TextStyle(
                      color: Colors.white, // Contrasting text color
                      fontSize: 16,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.refresh(dataProvider);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentColor2, // Use the second accent color
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: Text(
                'Refresh Data',
                style: TextStyle(
                  color: Colors.white, // Contrasting text color
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.headerFooterColor2, // Use the second header/footer color
        child: Container(
          height: 60,
          child: Center(
            child: Text(
              'Footer',
              style: TextStyle(
                color: Colors.white, // Contrasting text color
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}