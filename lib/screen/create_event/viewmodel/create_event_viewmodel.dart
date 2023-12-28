import 'package:mobx/mobx.dart';
import '../../../core/base/store/base_store.dart';

// Include generated file
part 'create_event_viewmodel.g.dart';

// This is the class used by rest of your codebase
class CreateEventViewmodel = _CreateEventViewmodel with _$CreateEventViewmodel;

// The store-class
abstract class _CreateEventViewmodel extends BaseStore with Store {
  @observable
  bool isTime = false;
  @override
  void onInit() {}

  @override
  void dispose() {}

  @action
  void changeIsTime() {
    isTime = !isTime;
  }
}
