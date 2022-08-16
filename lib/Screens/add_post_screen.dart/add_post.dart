import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/post_model.dart';
import 'package:flutter_instagram/provider/user_provider.dart';
import 'package:flutter_instagram/resources/database_storage.dart';
import 'package:flutter_instagram/resources/storage_method.dart';
import 'package:flutter_instagram/utils/constants/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../../utils/utils.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  TextEditingController _descripyionController = TextEditingController();
  bool isLoading = false;

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Create a post"),
            children: [
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: const Text("Take a Photo"),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await imagePicker(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: const Text("Choose From Gallery"),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await imagePicker(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: const Text("Cancel"),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  postImage(
    String? uid,
    String? username,
    String profileImg,
  ) async {
    try {
      setState(() {
        isLoading = true;
      });
      String res = await FireStorageMethods().uploadPhoto(
          _descripyionController.text, uid!, _file!, username!, profileImg);

      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        clearImgDes();
        showSnackBar(context, "posted!");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, e.toString());
    }
  }

  @override
  void dispose() {
    _descripyionController.dispose();
    super.dispose();
  }

  void clearImgDes() {
    setState(() {
      _file = null;
      _descripyionController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    return _file == null
        ? Center(
            child: IconButton(
                onPressed: () {
                  _selectImage(context);
                },
                icon: Icon(Icons.upload)),
          )
        : Scaffold(
            backgroundColor: mobileBackgroundColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: clearImgDes, icon: Icon(Icons.arrow_back)),
              title: Text("Post to"),
              actions: [
                TextButton(
                  onPressed: () {
                    postImage(user.uid, user.username, user.profileUrl);
                  },
                  child: Text(
                    "Post",
                    style: TextStyle(color: blueColor),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                isLoading == true
                    ? LinearProgressIndicator()
                    : Padding(
                        padding: EdgeInsets.only(top: 0),
                      ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 5),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        user.profileUrl,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        controller: _descripyionController,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        scrollController: ScrollController(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Write a caption ...",
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: MemoryImage(_file!),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
                const Divider(),
              ],
            ),
          );
  }
}
