import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/ad.dart';
import '../models/address.dart';
import '../models/category.dart';
import '../repositories/ad_repository.dart';
import 'cep_store.dart';
import 'user_manager_store.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  ObservableList images = ObservableList();

  @computed
  bool get imagesValid => images.isNotEmpty;
  String get imagesError {
    if (!showErrors || imagesValid) return null;
    return 'Insira imagens';
  }

  @observable
  String title = '';

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title.length >= 6;
  String get titleError {
    if (!showErrors || titleValid)
      return null;
    else if (title.isEmpty) return 'Campo obrigatório';
    return 'Título muito curto';
  }

  @observable
  String description = '';

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get descriptionValid => description.length >= 10;
  String get descriptionError {
    if (!showErrors || descriptionValid)
      return null;
    else if (description.isEmpty) return 'Campo obrigatório';
    return 'Descrição muito curto';
  }

  @observable
  Category category;

  @action
  void setCategory(Category value) => category = value;

  @computed
  bool get categoryValid => category != null;
  String get categoryError {
    if (!showErrors || categoryValid) return null;
    return 'Campo obrigatório';
  }

  @observable
  String priceText = '';

  @action
  void setPrice(String value) => priceText = value;

  @computed
  num get price {
    if (priceText.contains(',')) {
      return num.tryParse(priceText.replaceAll(RegExp('[^0-9]'), '')) / 100;
    } else {
      return num.tryParse(priceText);
    }
  }

  bool get priceValid => price != null && price <= 9999999;
  String get priceError {
    if (!showErrors || priceValid)
      return null;
    else if (priceText.isEmpty) return 'Campo obrigatório';
    return 'Preço inválido';
  }

  CepStore cepStore = CepStore();

  @computed
  Address get address => cepStore.address;
  bool get addressValid => address != null;
  String get addressError {
    if (!showErrors || addressValid) return null;
    return 'Campo obrigatório';
  }

  @observable
  bool hidePhone = false;

  @action
  void setHidePhode(bool value) => hidePhone = value;

  @computed
  bool get formValid =>
      imagesValid &&
      titleValid &&
      descriptionValid &&
      categoryValid &&
      addressValid &&
      priceValid;

  @computed
  Function get sendPressed => formValid ? _send : null;

  @observable
  bool showErrors = false;

  @observable
  bool loading = false;

  @observable
  String error;

  @observable
  Ad savedAd;

  @action
  void invalidSendPressed() => showErrors = true;

  @action
  Future<void> _send() async {
    final ad = Ad();
    ad.title = title;
    ad.description = description;
    ad.category = category;
    ad.price = price;
    ad.hidePhone = hidePhone;
    ad.images = images;
    ad.address = address;
    ad.user = GetIt.I<UserManagerStore>().user;

    try {
      loading = true;
      savedAd = await AdRepository.save(ad);
      loading = false;
    } catch (e) {
      error = e;
    }
  }
}
