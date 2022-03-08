import 'package:flutter/material.dart';
import 'package:flutter_golden_girls_api/golden_girls/product/app_constants/app_strings.dart';

import 'package:kartal/kartal.dart';
import '../../home/model/golden_girls_model.dart';
import 'package:url_launcher/url_launcher.dart';

class GoldenContainer extends StatefulWidget {
  final GoldenGirlsModel? model;
  const GoldenContainer({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  State<GoldenContainer> createState() => _GoldenContainerState();
}

class _GoldenContainerState extends State<GoldenContainer> {
  final double _borderRadius = 12;
  final double _elevation = 15;
  final String _imgUrl =
      "https://static.tvmaze.com/uploads/images/original_untouched/22/55709.jpg";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: Container(
        width: context.dynamicWidth(0.4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Stack(
          children: [
            _buildImage(context),
            _buildButton(context),
          ],
        ),
      ),
    );
  }

  Positioned _buildButton(BuildContext context) {
    return Positioned(
      top: context.dynamicHeight(0.24),
      left: context.dynamicHeight(0.025),
      child: SizedBox(
        width: context.dynamicWidth(0.3),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double?>(
              _elevation,
            ),
            backgroundColor: MaterialStateProperty.all<Color?>(
                context.appTheme.primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(_borderRadius),
              ),
            ),
          ),
          onPressed: () async {
            String url = widget.model?.show?.url ?? "";
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw AppString().errorText;
            }
          },
          child: Text(AppString().getLinkText,
              style: TextStyle(
                color: context.appTheme.primaryColorDark,
              )),
        ),
      ),
    );
  }

  SizedBox _buildImage(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_borderRadius),
        child: Image.network(
          widget.model?.show?.image?.medium ?? _imgUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
