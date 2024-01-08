import 'package:connect/controllers/motion_controller.dart';
import 'package:connect/design/colors.dart';
import 'package:connect/widgets/header_text.dart';
import 'package:connect/widgets/icon_and_text.dart';
import 'package:connect/widgets/standard_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {

  PageController pageController = PageController(viewportFraction: 0.9);
  var _currentPageValue = 0.0;
  final _scaleFactor = 0.8;
  final _height = 320;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider
        GetBuilder<MotionController>(builder: (motions){
          return Container(
              height: 320,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: motions.motionList.isEmpty ? 1 : motions.motionList.length,
                  itemBuilder: (context, position) {
                    return _buildPageItem(position);
                  })
          );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix4 = new Matrix4.identity();
    var currentScale = 0.0;
    var currentTrans = 0.0;
    if(index == _currentPageValue.floor()){ // complete value (1)
      currentScale = 1 - (_currentPageValue-index)*(1-_scaleFactor);
      currentTrans = _height*(1-currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);

    } else if(index == _currentPageValue.floor() + 1){
      currentScale = _scaleFactor+(_currentPageValue - index + 1) * (1-_scaleFactor);
      currentTrans = _height*(1-currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);

    } else if(index == _currentPageValue.floor() - 1){
      currentScale = 1 - (_currentPageValue-index)*(1-_scaleFactor);
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);

    } else {
      currentScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }

    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/image/image1.jpg'
                  )
                )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 130,
              margin: EdgeInsets.only(left: 28, right: 28, bottom: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                boxShadow:[
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0,5)
                  )
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderText(text: "Food"),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor, size: 15,)),
                        ),
                        SizedBox(width: 10),
                        StandardText(text: "4.9"),
                        SizedBox(width: 10),
                        StandardText(text: "1822"),
                        SizedBox(width: 5),
                        StandardText(text: "comments")
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        IconAndText(
                            icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: AppColors.mainColor
                        ),
                        IconAndText(
                            icon: Icons.location_on,
                            text: "1.7km",
                            iconColor: AppColors.mainColor
                        ),
                        IconAndText(
                            icon: Icons.access_time_rounded,
                            text: "32min",
                            iconColor: AppColors.mainColor
                        )
                      ],
                    )
                  ],
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}
