import 'package:mobx/mobx.dart';
part 'filter_store.g.dart';

class FilterStore = _FilterStore with _$FilterStore;

enum OrderBy { DATE, PRICE }

abstract class _FilterStore with Store {
  @observable
  OrderBy orderBy = OrderBy.DATE;

  @action
  void setOrderBy(OrderBy value) => orderBy = value;
}
