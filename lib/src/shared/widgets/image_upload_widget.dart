import 'dart:io';

import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadWidget extends StatefulWidget {
  final String title;

  const ImageUploadWidget({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _ImageUploadWidgetState();

}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: AppTextStyles.autoBodyStyle(
            text: widget.title,
            color: colorScheme.primary,
            size: SizeIcon.size16,
            textAlign: TextAlign.left,
          ),
        ),
        AppSizeBoxStyle.sizeBox(height: height),
        Stack(
          children: [
            Container(
              width: width*0.4,
              height: width*0.4,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: _imageFile == null
                  ? Center(
                child: TextButton(
                  onPressed: () => _showPickerOptions(context),
                  child: AppTextStyles.autoBodyStyle(
                    text: 'Subir',
                    color: colorScheme.secondary,
                    size: SizeIcon.size16,
                  ),
                ),
              )
                  : ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(_imageFile!.path),
                  fit: BoxFit.cover,
                  width: width*0.4,
                  height: width*0.4,
                ),
              ),
            ),
            if (_imageFile != null)
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _imageFile = null;
                    });
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  void _showPickerOptions(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: AppTextStyles.autoBodyStyle(
                  text: 'Galería',
                  color: colorScheme.primary,
                  size: SizeIcon.size16,
                ),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: AppTextStyles.autoBodyStyle(
                  text: 'Cámara',
                  color: colorScheme.primary,
                  size: SizeIcon.size16,
                ),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
