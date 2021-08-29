﻿import 'package:flutter/material.dart';

import '../../stores/filter_store.dart';
import 'components/order_by_field.dart';

class FilterScreen extends StatelessWidget {
  final FilterStore filterStore = FilterStore();
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
              children: [
                OrderByField(filterStore),
              ],
            ),
          ),
        ),
      ),
    );
  }
}