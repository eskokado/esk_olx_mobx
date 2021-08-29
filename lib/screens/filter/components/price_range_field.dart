import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/filter_store.dart';
import 'price_field.dart';
import 'section_title.dart';

class PriceRangeField extends StatelessWidget {
  final FilterStore filterStore;
  PriceRangeField(this.filterStore);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Preço'),
        Row(
          children: [
            PriceField(
              label: 'Min',
              onChanged: filterStore.setMinPrice,
              initialValue: filterStore.minPrice,
            ),
            SizedBox(
              width: 12,
            ),
            PriceField(
              label: 'Max',
              onChanged: filterStore.setMaxPrice,
              initialValue: filterStore.maxPrice,
            ),
          ],
        ),
        Observer(builder: (_) {
          if (filterStore.priceError != null)
            return Text(
              filterStore.priceError,
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            );
          return Container();
        }),
      ],
    );
  }
}
