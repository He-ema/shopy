import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopy/core/widgets/custom_button.dart';
import 'package:shopy/core/widgets/custom_text_form_field.dart';
import 'package:shopy/features/profile/data/user_model/user_model.dart';
import 'package:shopy/features/profile/presentation/manager/cubit/profile_cubit.dart';

import '../../../../../constants.dart';

class BottomSheetBody extends StatefulWidget {
  const BottomSheetBody(
      {super.key, required this.userModel, required this.update});
  final UserModel userModel;
  final VoidCallback update;
  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  final TextEditingController _controller = TextEditingController();

  final TextEditingController _controller2 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = widget.userModel.name;
    _controller2.text = widget.userModel.email;
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
  }

  String? filePath;
  String? imageUrl;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Padding(
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: MediaQuery.of(context).size.width * 0.25,
                    child: CachedNetworkImage(
                      imageUrl: widget.userModel.image,
                      placeholder: (context, url) => const SpinKitSpinningLines(
                        color: kPrimaryColor,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      right: 10,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: kPrimaryColor,
                        child: IconButton(
                            onPressed: () async {
                              await openDialog();
                            },
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              size: 30,
                            )),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(hint: 'Name', controller: _controller),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hint: 'Email',
                controller: _controller2,
                enabled: false,
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                text: 'Save',
                onPressed: () async {
                  CollectionReference _user = FirebaseFirestore.instance
                      .collection(kUsersCollectionReference);
                  await _user.doc(widget.userModel.email).update({
                    kName: _controller.text,
                  });
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> openDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () async {
                  await pickImageFromCamera();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 70,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Take a photo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await pickImageFromGallery();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.photo,
                      size: 70,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'From Gallery',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> pickImageFromGallery() async {
    isLoading = true;
    setState(() {});
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    Navigator.pop(context);
    if (image != null) {
      filePath = image.path;
      await uploadImage(imagePath: filePath!);
    }
    isLoading = false;
    setState(() {});
  }

  Future<void> pickImageFromCamera() async {
    isLoading = true;
    setState(() {});
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    Navigator.pop(context);
    if (image != null) {
      filePath = image.path;
      await uploadImage(imagePath: filePath!);
    }
    isLoading = false;
    setState(() {});
  }

  Future<void> uploadImage({required String imagePath}) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child('images');
    Reference referenceUploadedImage =
        referenceDirImage.child(widget.userModel.email + 'image');

    try {
      CollectionReference _user =
          FirebaseFirestore.instance.collection(kUsersCollectionReference);

      await referenceUploadedImage.putFile(File(imagePath));
      imageUrl = await referenceUploadedImage.getDownloadURL();
      await _user.doc(widget.userModel.email).update({
        kImage: imageUrl,
      });
      Navigator.of(context).pop();

      // this line above to get the url of the uploaded file
    } catch (error) {
      print(error);
    }
  }
}
