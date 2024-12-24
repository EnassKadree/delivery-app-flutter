import 'dart:io';

import 'package:delivery_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class UserAvatar extends StatefulWidget {
  final String? imageUrl;

  const UserAvatar({super.key, this.imageUrl});

  @override
  
  _UserAvatarState createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  String? selectedImageUrl;

  // Image picker instance
  final ImagePicker _picker = ImagePicker();

  // Method to pick image from gallery
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImageUrl = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector( onTap: _pickImage,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey[300],
        child: selectedImageUrl == null && (widget.imageUrl == null || widget.imageUrl!.isEmpty)
            ? IconButton(
                icon: const Icon(
                  Iconsax.user_add,
                  size: 40,
                  color: AppColors.blueColor,
                ),
                onPressed: _pickImage, // Open the image picker
              )
            : ClipOval(
                child: Image.file(
                  File(selectedImageUrl!),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
      ),
    );
  }
}
