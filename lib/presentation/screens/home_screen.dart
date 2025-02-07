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
      body: RefreshIndicator(
        onRefresh: () async{
          ref.refresh(dataProvider);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 130,
              collapsedHeight: 80,
              floating: true,
              backgroundColor: AppColors.accentColor2,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/images/logo.png', 
                    fit: BoxFit.fitWidth
                  ),
                )
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}