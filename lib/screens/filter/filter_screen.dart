import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../stores/filter_store.dart';
import '../../stores/home_store.dart';
import 'components/order_by_field.dart';
import 'components/price_range_field.dart';
import 'components/vendor_type_field.dart';

class FilterScreen extends StatelessWidget {
  final FilterStore filterStore = GetIt.I<HomeStore>().clonedFilter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrar Busca'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OrderByField(filterStore),
                PriceRangeField(filterStore),
                VendorTypeField(filterStore),
                Observer(
                  builder: (_) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Colors.orange,
                          onSurface: Colors.orange.withAlpha(120),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                        ),
                        child: Text(
                          'FILTRAR',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: filterStore.isFormValid
                            ? () {
                                filterStore.save();
                                Navigator.of(context).pop();
                              }
                            : null,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
