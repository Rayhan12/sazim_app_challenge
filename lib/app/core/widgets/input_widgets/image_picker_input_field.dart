// ignore_for_file: unused_field

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import 'package:sazim_app/app/core/theme/asset_config.dart';
import '../../custom_controllers/file_upload_controller.dart';
import '../../theme/color_config.dart';
import '../../theme/text_config.dart';
import '../loading.dart';

class ImagePickerInputField extends StatefulWidget {
  final String imagePath;
  final FileUploaderController fileUploaderController;
  final Size imageBoxSize;
  final Size imageSize;
  final String? placeHolderImage;
  final String? placeHolderText;
  final Color? contentColor;
  final Color? backgroundColor;
  final BorderRadius? radius;
  final bool? onlyCamara;
  final bool? isNetworkImage;

  const ImagePickerInputField({
    super.key,
    required this.imageBoxSize,
    required this.imageSize,
    this.placeHolderImage,
    this.placeHolderText,
    this.contentColor,
    this.backgroundColor,
    required this.imagePath,
    this.radius,
    required this.fileUploaderController,
    this.onlyCamara,
    this.isNetworkImage,
  });

  @override
  State<ImagePickerInputField> createState() => _ImagePickerInputFieldState();
}

class _ImagePickerInputFieldState extends State<ImagePickerInputField> {
  bool pictureSelected = false;

  ///Handel Image =>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  final ImagePicker _picker = ImagePicker();
  late XFile? imageFile;

  bool showError = true;

  Future<void> _selectImage() async {
    XFile? selectedImages = await _picker.pickImage(imageQuality: 100, source: ImageSource.gallery);

    if (selectedImages!.path.isNotEmpty) {
      setState(() {
        pictureSelected = true;
      });
      imageFile = selectedImages;

      widget.fileUploaderController.setImageFile(selectedFile: selectedImages);
    }
  }

  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Future<void> _captureImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera, imageQuality: 100, maxHeight: 400, maxWidth: 400);
    final selectedImages = XFile(pickedImage!.path);
    if (selectedImages.path.isNotEmpty) {
      setState(() {
        pictureSelected = true;
      });
      imageFile = selectedImages;
    }
    widget.fileUploaderController.setImageFile(selectedFile: selectedImages);
  }

  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  void showImagePickerBottomSheet({required BuildContext context, bool? onlyCamara}) {
    showModalBottomSheet(
        context: context,
        elevation: 2,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext currentContext, StateSetter setState) {
            return SingleChildScrollView(
              controller: ScrollController(),
              child: Container(
                height: 150,
                color: AppColor.neutralsBg,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ///Camera ================
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Material(
                        color: AppColor.neutralsBg,
                        clipBehavior: Clip.hardEdge,
                        elevation: 0,
                        borderRadius: BorderRadius.circular(5),
                        child: InkWell(
                          onTap: () {
                            _captureImage().then((value) {
                              Navigator.of(context).pop();
                            });
                          },
                          splashColor: AppColor.textPrimary,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: Icon(
                                    RIcon.Camera,
                                    color: AppColor.primaryDefault,
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Camera",
                                style: AppText().caption.copyWith(color: AppColor.textPrimary.withOpacity(0.8)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    ///Gallery ================

                    if (onlyCamara == null || onlyCamara != true)
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Material(
                          color: AppColor.neutralsBg,
                          clipBehavior: Clip.hardEdge,
                          elevation: 0,
                          borderRadius: BorderRadius.circular(5),
                          child: InkWell(
                            onTap: () {
                              _selectImage().then((value) {
                                Navigator.of(context).pop();
                              });
                            },
                            splashColor: AppColor.textPrimary,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                    width: 35,
                                    height: 35,
                                    child: Icon(
                                      RIcon.Gallery,
                                      color: AppColor.primaryDefault,
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Gallery",
                                  style: AppText().caption.copyWith(color: AppColor.textPrimary.withOpacity(0.8)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          });
        });
  }


  ///Handel Image =>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


  @override
  void initState() {
    if(widget.fileUploaderController.hasImageFile())
      {
        pictureSelected = true;
        imageFile = widget.fileUploaderController.imageFile;
      }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.imageBoxSize.height,
          width: widget.imageBoxSize.width,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? AppColor.neutralsBg,
            borderRadius: widget.radius ?? BorderRadius.circular(10),
          ),
          child: widget.fileUploaderController.hasImageFile()
              ? Material(
                  color: AppColor.neutralsBg,
                  clipBehavior: Clip.hardEdge,
                  borderRadius: widget.radius ?? BorderRadius.circular(10),
                  child: InkWell(
                      onTap: () {
                        showImagePickerBottomSheet(context: context, onlyCamara: widget.onlyCamara ?? false);
                      },
                      child: Image.file(File(imageFile!.path), fit: BoxFit.cover)))
              : Material(
                  color: Colors.transparent,
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(5),
                  child: InkWell(
                    onTap: () {
                      showImagePickerBottomSheet(context: context, onlyCamara: widget.onlyCamara ?? false);
                    },
                    child: (widget.isNetworkImage ?? false)
                        ? SizedBox(
                            height: widget.imageBoxSize.height,
                            width: widget.imageBoxSize.width,
                            child: CachedNetworkImage(
                              imageUrl: widget.imagePath.toString(),
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Loading(),
                              errorWidget: (context, url, error) => const Loading(color: AppColor.semanticsError),
                            ),
                          )
                        : SizedBox(
                          width: widget.imageSize.width,
                          height: widget.imageSize.height,
                          child: Image.asset(
                            AppAssets.placeHolderImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                  ),
                ),
        ),
        if (widget.isNetworkImage ?? false)
          Positioned(
              // top: 0,
              // right: 45,
              child: InkWell(
                onTap: () {
                  showImagePickerBottomSheet(context: context, onlyCamara: widget.onlyCamara ?? false);
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  height: widget.imageBoxSize.height,
                  width: widget.imageBoxSize.width,
                  decoration: BoxDecoration(
                    color: AppColor.textPrimary.withOpacity(0.3),
                    borderRadius: widget.radius ?? BorderRadius.circular(100),
                  ),
                ),
              )),
        if (widget.isNetworkImage ?? false)
          const Positioned(
              bottom: 45,
              right: 45,
              child: Icon(
                FontAwesomeIcons.penToSquare,
                size: 30,
                color: AppColor.textWhite,
              ))
      ],
    );
  }
}
