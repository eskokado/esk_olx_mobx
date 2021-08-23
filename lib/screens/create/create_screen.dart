import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../components/custom_drawer/custom_drawer.dart';
import '../../components/error_box.dart';
import '../../stores/create_store.dart';
import 'components/category_field.dart';
import 'components/cep_field.dart';
import 'components/hide_phone_field.dart';
import 'components/images_field.dart';

class CreateScreen extends StatelessWidget {
  final CreateStore createStore = CreateStore();
  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.grey,
      fontSize: 18,
    );

    final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Criar anúncio'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Observer(builder: (_) {
              if (createStore.loading) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Salvando Anúncio',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.purple,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.purple),
                      ),
                    ],
                  ),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImagesField(createStore),
                    TextFormField(
                      onChanged: createStore.setTitle,
                      decoration: InputDecoration(
                        labelText: 'Título *',
                        labelStyle: labelStyle,
                        contentPadding: contentPadding,
                        errorText: createStore.titleError,
                      ),
                    ),
                    TextFormField(
                      onChanged: createStore.setDescription,
                      decoration: InputDecoration(
                        labelText: 'Descrição *',
                        labelStyle: labelStyle,
                        contentPadding: contentPadding,
                        errorText: createStore.descriptionError,
                      ),
                      maxLines: null,
                    ),
                    CategoryField(createStore),
                    CepField(createStore),
                    Observer(builder: (_) {
                      return TextFormField(
                        onChanged: createStore.setPrice,
                        decoration: InputDecoration(
                          errorText: createStore.priceError,
                          labelText: 'Preço *',
                          labelStyle: labelStyle,
                          contentPadding: contentPadding,
                          prefixText: 'R\$',
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RealInputFormatter(centavos: true),
                        ],
                      );
                    }),
                    HidePhoneField(createStore),
                    Observer(builder: (_) {
                      return ErrorBox(
                        message: createStore.error,
                      );
                    }),
                    Observer(builder: (_) {
                      return SizedBox(
                        height: 50,
                        child: GestureDetector(
                          onTap: createStore.invalidSendPressed,
                          child: ElevatedButton(
                            onPressed: createStore.sendPressed,
                            child: Text(
                              'Enviar',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white,
                              primary: Colors.orange,
                              onSurface: Colors.orange.withAlpha(120),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
