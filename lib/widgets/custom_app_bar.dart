import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../core/assets_manager.dart';
import '../core/dimensions.dart';
import 'custom_search_bar.dart';

class CustomAppBar extends StatelessWidget {
  final double height, width;
  final bool canCancel, showDelivery;
  final TextEditingController searchController;
  final Widget title;
  final Widget? suffix, prefix;

  const CustomAppBar(
      {Key? key,
      required this.height,
      required this.width,
      required this.title,
      this.suffix,
      this.prefix,
      required this.canCancel,
      required this.searchController,
      required this.showDelivery})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: showDelivery,
          child: Container(
            color: const Color(0xfff2f2f2),
            height: height + 40,
            padding: EdgeInsets.only(top: height, left: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on_outlined),
                Text('Delivery in ', style: TextStyle(fontSize: AppDimensions.fontSize4),),
                Text('Lagos, NG',style: TextStyle(fontSize: AppDimensions.fontSize4, fontWeight: FontWeight.w600),)
              ],
            ),
          ),
        ),
        Container(
          height: height,
          width: width,
          padding: EdgeInsets.only(
            top: MediaQuery.viewPaddingOf(context).top,
            bottom: height * 0.1,
            right: width * 0.06,
            left: width * 0.06,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff7a08fa), Color(0xffad3bfc)],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(AppDimensions.appBarBorderRadius),
              bottomRight: Radius.circular(AppDimensions.appBarBorderRadius),
            ),
          ),
          child: Stack(
            children: [
              SvgPicture.asset(
                AppImages.ringsSVG,
                alignment: Alignment.center,
                fit: BoxFit.cover,
                height: height,
                width: width,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: (prefix != null),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: prefix ?? const Placeholder(),
                        ),
                      ),
                      Expanded(child: title),
                      Visibility(
                        visible: (suffix != null),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: suffix ?? const Placeholder(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.1),
                  SizedBox(
                    height: height * 0.25,
                    child: CustomSearchBar(
                      canCancel: canCancel,
                      controller: searchController,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
