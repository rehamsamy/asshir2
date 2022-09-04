import 'dart:io';

import 'package:asshir/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../custom_widgets/image_picker.dart';

class CustomImagePicker {
  static dynamic pickImage(Function(File file) onSubmit, BuildContext context) {
    final ImagePicker _picker = ImagePicker();
    FocusScope.of(navigator.currentContext!).unfocus();
    void _getPic(
      BuildContext context,
      ImageSource source,
    ) async {
      final pickedFile = await _picker.getImage(
        source: source,
        maxWidth: 400,
      );
      if (pickedFile != null) {
        Navigator.pop(context);
        FocusScope.of(context).unfocus();
        onSubmit(File(pickedFile.path));
      }
    }

    openImagePicker(
        context: context,
        onCameraTapped: () {
          _getPic(context, ImageSource.camera);
        },
        onGalleryTapped: () {
          _getPic(context, ImageSource.gallery);
        });
  }

  static dynamic openMultiImagePicker({
    Function(List<File>? list)? onMultiSubmit,
  }) async {
    FocusScope.of(navigator.currentContext!).unfocus();
    ImagePicker _pick = ImagePicker();
    List<XFile>? _xFilesList;
    List<File>? _filesList = [];
    final List<XFile>? pickedFileList = await _pick.pickMultiImage();
    _xFilesList = pickedFileList;
    for (var element in _xFilesList!) {
      _filesList.add(File(element.path));
    }
    onMultiSubmit!(_filesList);
  }
}
