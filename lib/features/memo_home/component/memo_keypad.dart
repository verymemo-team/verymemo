import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:image_picker/image_picker.dart';

class MemoKeypad extends StatefulWidget {
  const MemoKeypad({super.key});

  @override
  State<MemoKeypad> createState() => _MemoKeypadState();
}

class _MemoKeypadState extends State<MemoKeypad> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  final quill.QuillController quillController = quill.QuillController.basic();

// 갤러리에서 이미지 선택
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
    }
  }

  // 카메라로 사진 촬영
  Future<void> _captureImageWithCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Flutter Quill 에디터
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(12.0),
                child: quill.QuillEditor.basic(controller: quillController),
              )),
              // 사진 앨범에서 불러오기 버튼
              Container(
                height: 57,
                // decoration: BoxDecoration(border: Border(
                //   top: BorderSide(
                //     // color: Color(0xffF2F2F2),
                //     color: Color(0xffB9B9B9),
                //     width: 0.4,
                //   ),
                // ),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // 카메라 실행 아이콘 버튼
                        IconButton(
                          icon: Icon(Icons.camera_alt_outlined),
                          onPressed: () async {
                            await _captureImageWithCamera();
                            setState(() {});
                          },
                          tooltip: '카메라로 촬영', // 툴팁 (선택 사항)
                        ),
                        IconButton(
                          icon: Icon(Icons.photo_size_select_actual_outlined),
                          onPressed: () async {
                            await _pickImageFromGallery();
                            setState(() {});
                          },
                          tooltip: '사진 앨범에서 선택', // 툴팁 (선택 사항)
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.abc)

                    )
                  ],
                ),
              )

              // // 선택된 이미지 미리보기
              // if (_selectedImage != null)
              //   Padding(
              //     padding: const EdgeInsets.only(top: 16.0),
              //     child: Image.file(_selectedImage!, height: 200),
              //   ),
            ],
          ),
        );
      },
    );
  }
}
