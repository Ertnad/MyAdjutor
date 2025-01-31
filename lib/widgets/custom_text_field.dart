import 'package:myadjutor/core/app_export.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool enabled;
  final TextEditingController? controller; // Обновлено: контроллер может быть null
  final FigmaTextStyles figmaTextStyles;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.controller, // Обновлено: контроллер может быть null
    required this.figmaTextStyles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // Используем контроллер, если он предоставлен
      enabled: enabled,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: figmaTextStyles.headerTextRegular.copyWith(
        color: FigmaColors.main,
      ),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: figmaTextStyles.headerTextRegular.copyWith(
          color: FigmaColors.main,
        ),
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
    );
  }
}
