import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:guia_de_moteis/domain/motel.dart';
import 'package:guia_de_moteis/presentation/colors/colors.dart';
import 'package:guia_de_moteis/presentation/widgets/suite_widget.dart';

class MotelWidget extends StatefulWidget {
  final Map<String, dynamic> json;

  const MotelWidget({super.key, required this.json});

  @override
  _MotelWidgetState createState() => _MotelWidgetState();
}

class _MotelWidgetState extends State<MotelWidget> {
  late Motel motel;
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    motel = Motel.fromJson(widget.json);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryTextColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(imageUrl: motel.logo, width: 40, height: 40),
                    ),
                    SizedBox(width: 4),
                    Text(motel.fantasia,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: AppColors.primaryTextColor
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child:Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RatingBarIndicator(
                      rating: motel.media,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: AppColors.accentColor1,
                      ),
                      itemCount: 5,
                      itemSize: 15.0,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(width: 4,),
                    Text(
                      "${motel.media}",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.primaryTextColor
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          SizedBox(height: 10),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 450
            ),
            child: PageView.builder(
              controller: _pageController,
              itemCount: motel.suites.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              padEnds: false,
              itemBuilder: (context, index) {
                return SuiteWidget(suite: motel.suites[index]);
              },
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(motel.suites.length, (index) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }),
          ),
          
        ],
      ),
    );
  }
}