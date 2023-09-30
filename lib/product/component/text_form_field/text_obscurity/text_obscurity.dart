import 'package:mobx/mobx.dart';
import '../widget/custom_text_form_field.dart';
part 'text_obscurity.g.dart';

class TextObscurity = TextObscurityBase with _$TextObscurity;

abstract class TextObscurityBase with Store{
  Observable<bool> passwordObscurity = true.obs();
  
  Observable<bool> obscureText(TextfieldType type) => type == TextfieldType.password
      ?  passwordObscurity
      :  false.obs();
  
  @action
  void changeVisibility() => passwordObscurity.value = !passwordObscurity.value;
}