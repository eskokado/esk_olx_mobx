import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/filter_store.dart';
import 'section_title.dart';

class VendorTypeField extends StatelessWidget {
  final FilterStore filterStore;
  VendorTypeField(this.filterStore);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle('Tipo de anunciante'),
        Observer(
          builder: (_) {
            return Wrap(
              runSpacing: 4,
              children: [
                GestureDetector(
                  onTap: () {
                    if (filterStore.isTypeParticular) {
                      if (filterStore.isTypeProfessional)
                        filterStore.resetVendorType(VENDOR_TYPE_PARTICULAR);
                      else
                        filterStore.selectVendorType(VENDOR_TYPE_PROFESSIONAL);
                    } else {
                      filterStore.setVendorType(VENDOR_TYPE_PARTICULAR);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: filterStore.isTypeParticular
                          ? Colors.purple
                          : Colors.transparent,
                      border: Border.all(
                        color: filterStore.isTypeParticular
                            ? Colors.purple
                            : Colors.grey,
                      ),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Particular',
                      style: TextStyle(
                        color: filterStore.isTypeParticular
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    if (filterStore.isTypeProfessional) {
                      if (filterStore.isTypeParticular)
                        filterStore.resetVendorType(VENDOR_TYPE_PROFESSIONAL);
                      else
                        filterStore.selectVendorType(VENDOR_TYPE_PARTICULAR);
                    } else {
                      filterStore.setVendorType(VENDOR_TYPE_PROFESSIONAL);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: filterStore.isTypeProfessional
                          ? Colors.purple
                          : Colors.transparent,
                      border: Border.all(
                        color: filterStore.isTypeProfessional
                            ? Colors.purple
                            : Colors.grey,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Professional',
                      style: TextStyle(
                        color: filterStore.isTypeProfessional
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
