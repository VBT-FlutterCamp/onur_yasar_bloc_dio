import 'package:flutter/material.dart';
import 'package:flutter_golden_girls_api/golden_girls/home/model/golden_girls_model.dart';

import 'package:kartal/kartal.dart';

class GoldenGirlsCard extends StatefulWidget {
  final GoldenGirlsModel? model;
  const GoldenGirlsCard({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  State<GoldenGirlsCard> createState() => _GoldenGirlsCardState();
}

class _GoldenGirlsCardState extends State<GoldenGirlsCard> {
  String imageUrl =
      "https://static.tvmaze.com/uploads/images/medium_portrait/22/55709.jpg";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.1),
      child: Card(
        elevation: 7,
        child: Row(
          children: [
            Padding(
              padding: context.paddingLow,
              child:
                  Image.network(widget.model?.show?.image?.medium ?? imageUrl),
            ),
            Padding(
              padding: context.paddingLow,
              child: Text(
                widget.model?.show?.name ?? "",
              ),
            )
          ],
        ),
      ),
    );
  }
}
