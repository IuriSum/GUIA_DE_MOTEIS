import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guia_de_moteis/data/api/api_service.dart';
import 'package:guia_de_moteis/data/parsers/response_parser.dart';
import 'package:guia_de_moteis/presentation/colors/colors.dart';
import 'package:guia_de_moteis/presentation/widgets/motel_widget.dart';

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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 150,
            collapsedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: AppColors.accentColor2,
                padding: EdgeInsets.only(left: 30),
                child: SizedBox(
                  width: 60,
                  child: Image.asset('assets/images/logo.png', fit: BoxFit.fitWidth,),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  dataAsync.when(
                    loading: () => CircularProgressIndicator(),
                    error: (error, stack) => Text('Error: $error'),
                    data: (data) {
              
                      if (data.containsKey("error")) {
                        return Text('Error: ${data["error"]}');
                      }
              
                      List<Map<String, dynamic>> motels = ResponseParserService(responseJson: data).getMotels();
                      
                      return Column(
                        children: motels.map((motel) => MotelWidget(json: motel)).toList(),
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
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: AppColors.headerFooterColor2, // Use the second header/footer color
      //   child: Container(
      //     height: 60,
      //     child: Center(
      //       child: Text(
      //         'Footer',
      //         style: TextStyle(
      //           color: Colors.white, // Contrasting text color
      //           fontSize: 16,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}