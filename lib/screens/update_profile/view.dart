import 'package:asshir/helper/custom_widgets/app_bar.dart';
import 'package:asshir/helper/utils_functions/image_picker.dart';
import 'package:flutter/material.dart';

import '../../helper/core_classes/app_theme.dart';
import '../../helper/custom_widgets/images_container.dart';
import 'input_data.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({Key? key}) : super(key: key);

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  final _inputData = AuthInputData();
  @override
  void initState() {
     super.initState();
    setState(() {
      _inputData.image = AppTheme.defaultImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context,  "update profile" ),
      body: ListView(
        children: [
          ProfileContainer(_inputData.image, () {
            CustomImagePicker.pickImage((val) {
              setState(() {
                _inputData.image = val;
              });
            }, context);
          }),
        ],
      ),
    );
  }
}
