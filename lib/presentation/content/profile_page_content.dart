import 'dart:io';
import 'package:myadjutor/core/app_export.dart';

class ProfilePageContent extends StatefulWidget {

  const ProfilePageContent({Key? key}) : super(key: key);

  @override
  _ProfilePageContentState createState() => _ProfilePageContentState();
}

class _ProfilePageContentState extends State<ProfilePageContent> {
  final FigmaTextStyles figmaTextStyles = FigmaTextStyles();
  bool isEditing = false;
  TextEditingController _loginController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _patronymicController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  TextEditingController _groupIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return _loginController.text.isNotEmpty // Проверяем, загружены ли данные пользователя
        ? SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(text: "Почта", style: figmaTextStyles.caption1Medium.copyWith(color: FigmaColors.main), align: TextAlign.center,),
                SizedBox(height: 5),
                CustomTextField(
                  hintText: _loginController.text,
                  controller: _loginController,
                  figmaTextStyles: figmaTextStyles,
                  enabled: isEditing,
                ),
                SizedBox(height: 16),
                CustomText(text: "Имя", style: figmaTextStyles.caption1Medium.copyWith(color: FigmaColors.main), align: TextAlign.center,),
                SizedBox(height: 5),
                CustomTextField(
                  hintText: _nameController.text,
                  controller: _nameController,
                  figmaTextStyles: figmaTextStyles,
                  enabled: isEditing,
                ),
                SizedBox(height: 16),
                CustomText(text: "Фамилия", style: figmaTextStyles.caption1Medium.copyWith(color: FigmaColors.main), align: TextAlign.center,),
                SizedBox(height: 5),
                CustomTextField(
                  hintText: _surnameController.text,
                  controller: _surnameController,
                  figmaTextStyles: figmaTextStyles,
                  enabled: isEditing,
                ),
                SizedBox(height: 16),
                CustomText(text: "Отчество", style: figmaTextStyles.caption1Medium.copyWith(color: FigmaColors.main), align: TextAlign.center,),
                SizedBox(height: 5),
                CustomTextField(
                  hintText: _patronymicController.text,
                  controller: _patronymicController,
                  figmaTextStyles: figmaTextStyles,
                  enabled: isEditing,
                ),
                SizedBox(height: 16),
                CustomText(text: "Номер телефона", style: figmaTextStyles.caption1Medium.copyWith(color: FigmaColors.main), align: TextAlign.center,),
                SizedBox(height: 5),
                CustomTextField(
                  hintText: _phoneNumberController.text,
                  controller: _phoneNumberController,
                  figmaTextStyles: figmaTextStyles,
                  enabled: isEditing,
                ),
                SizedBox(height: 16),
                CustomText(text: "Роль", style: figmaTextStyles.caption1Medium.copyWith(color: FigmaColors.main), align: TextAlign.center,),
                SizedBox(height: 5),
                CustomTextField(
                  hintText: _roleController.text,
                  controller: _roleController,
                  figmaTextStyles: figmaTextStyles,
                  enabled: false,
                ),
                SizedBox(height: 16),
                CustomText(text: "Номер группы", style: figmaTextStyles.caption1Medium.copyWith(color: FigmaColors.main), align: TextAlign.center,),
                SizedBox(height: 5),
                CustomTextField(
                  hintText: _groupIdController.text,
                  controller: _groupIdController,
                  figmaTextStyles: figmaTextStyles,
                  enabled: false,
                ),
              ],
            ),
          ),
          SizedBox(height: 36),
          SizedBox(height: 36),
        ],
      ),
    )
        : Center(child: CircularProgressIndicator());
  }
}
