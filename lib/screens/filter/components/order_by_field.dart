import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/filter_store.dart';
import 'section_title.dart';

class OrderByField extends StatelessWidget {
  final FilterStore filterStore;

  const OrderByField(this.filterStore);
  @override
  Widget build(BuildContext context) {
    Widget buildOption(String title, OrderBy orderBy) {
      return GestureDetector(
        onTap: () {
          filterStore.orderBy = orderBy;
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color:
                  filterStore.orderBy == orderBy ? Colors.purple : Colors.grey,
            ),
            color: filterStore.orderBy == orderBy
                ? Colors.purple
                : Colors.transparent,
          ),
          child: Text(
            title,
            style: TextStyle(
              color:
                  filterStore.orderBy == orderBy ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Ordenar por'),
        SizedBox(
          width: 12,
        ),
        Observer(
          builder: (_) {
            return Row(
              children: [
                buildOption('Data', OrderBy.DATE),
                SizedBox(
                  width: 12,
                ),
                buildOption('Preço', OrderBy.PRICE),
              ],
            );
          },
        ),
      ],
    );
  }
}
