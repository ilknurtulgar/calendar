import 'package:mobx/mobx.dart';
part 'switch_on_off.g.dart';

class SwitchOnOff = SwitchOnOffBase with _$SwitchOnOff;

abstract class SwitchOnOffBase with Store{
  Observable<bool> isOn = false.obs();

  @action
  void turnOnOff() => isOn.value = !isOn.value;
}