import 'package:flutter/material.dart';

import '../../../models/ad.dart';

class LocationPanel extends StatelessWidget {
  final Ad ad;
  LocationPanel(this.ad);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 18, bottom: 16),
          child: Text(
            'Localização',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CEP',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Município',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Bairro',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ad.address.cep,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    ad.address.city.name,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    ad.address.district,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
