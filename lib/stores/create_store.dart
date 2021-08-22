import 'package:mobx/mobx.dart';

import '../models/category.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  ObservableList images = ObservableList();

  @observable
  Category category;

  @action
  void setCategory(Category value) => category = value;

  @observable
  bool hidePhone = false;

  @action
  void setHidePhode(bool value) => hidePhone = value;
}
