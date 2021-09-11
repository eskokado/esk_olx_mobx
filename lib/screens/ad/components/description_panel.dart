import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../models/ad.dart';

class DescriptionPanel extends StatelessWidget {
  final Ad ad;
  DescriptionPanel(this.ad);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Text(
            'Descrição',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: ReadMoreText(
            ad.description,
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Ver descrição completa',
            trimExpandedText: ' ... Ver menos',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
