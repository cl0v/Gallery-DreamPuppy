import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry padding;
  final String label;
  final List<TextInputFormatter>? masks;
  final TextInputType? type;

  CustomTextFieldWidget({
    super.key,
    this.controller,
    required this.hintText,
    this.isPasswordField = false,
    this.validator,
    this.label = "",
    this.padding = const EdgeInsets.symmetric(horizontal: 25.0),
    this.masks,
    this.type
  });

  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ValueListenableBuilder<bool>(
          valueListenable: _isPasswordVisible,
          builder: (_, isPasswordVisible, __) {
            return CupertinoTextFormFieldRow(
              inputFormatters: masks,
              validator: validator,
              style: isPasswordVisible
                  ? const TextStyle(
                      letterSpacing: 8,
                      fontWeight: FontWeight.bold,
                    )
                  : null,
              controller: controller,
              // Tabela verdade [v] representa [isPasswordVisible] e [f] representa [isPasswordField]
              // [r] representa resultado [!] representa que é impossível acontecer
              /*
                v    f    r
                F    T    T
                F    F    F
                T    T    F
                T    F    !
              */
              //vF && fT = fT | vF && fF = fF | vT && fT = tT | vT && fT = tF
              obscureText: !isPasswordVisible && isPasswordField,
              keyboardType: type,
              /*
              decoration: InputDecoration(
                
                
                label: Text(
                  label,
                ),
                labelStyle: const TextStyle(
                    letterSpacing: 0, fontWeight: FontWeight.normal),
                errorText: null,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                // fillColor: Colors.grey.shade200,
                fillColor: Colors.white,
                filled: true,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                ),
                suffixIcon: _buildSuffixIcon(
                  isPasswordField,
                  isPasswordVisible,
                  () => _isPasswordVisible.value = !_isPasswordVisible.value,
                ),
              ),*/
            );
          }),
    );
  }
}
