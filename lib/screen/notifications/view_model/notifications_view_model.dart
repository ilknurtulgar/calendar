import 'package:calendar/core/base/store/base_store.dart';
import 'package:mobx/mobx.dart';
part 'notifications_view_model.g.dart';

class NotificationsViewModel = NotificationsViewModelBase with _$NotificationsViewModel;

abstract class NotificationsViewModelBase extends BaseStore with Store{
  @override
  void onInit() {}

  @override
  void dispose() {}

}