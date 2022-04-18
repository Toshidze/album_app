import 'dart:async';
import 'package:app_for_trood/provider/data_provider.dart';
import 'package:app_for_trood/repositories/photo_repo.dart';
import 'package:app_for_trood/screens/photos/album_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AlbumListScreen extends StatefulWidget {
  const AlbumListScreen({Key? key}) : super(key: key);

  @override
  _AlbumListScreenState createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  List _dropD = [];
  String selectedCurrency = 'quidem molestiae enim';
  File? _myPhoto;
  final ImagePicker _image = ImagePicker();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DropdownButton<String> myDropdown(StateSetter setState) {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in _dropD) {
      var newItem = DropdownMenuItem(
        child: Text(
          currency,
        ),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      isExpanded: true,
      value: selectedCurrency,
      hint: const Text('Choose'),
      items: dropdownItems,
      onChanged: (newValue) {
        setState(() {
          selectedCurrency = newValue as String;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    albumInfoList();
  }

  @override
  Widget build(BuildContext context) {
    var data = context.watch<GetData>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return ListView(
                                shrinkWrap: true,
                                children: <Widget>[
                                  const Text(
                                    'Edit post',
                                    style: TextStyle(
                                        fontSize: 26, color: Colors.grey),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: myDropdown(setState),
                                  ),
                                  ButtonBar(
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          pickerCamera(setState);
                                        },
                                        icon: const Icon(Icons.photo_camera),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          pickerImage(setState);
                                        },
                                        icon: const Icon(Icons.photo),
                                      ),
                                    ],
                                  ),
                                  if (_myPhoto != null)
                                    Image.file(_myPhoto as File)
                                  else
                                    const SizedBox(
                                        height: 200, child: Placeholder()),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Form(
                                    key: formKey,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isNotEmpty) {
                                          return null;
                                        } else {
                                          return 'Please add title';
                                        }
                                      },
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                        hintText: 'Title',
                                        hintStyle: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.zero,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Close',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            if (!formKey.currentState!
                                                .validate()) {
                                              return;
                                            }

                                            if (_myPhoto == null) {
                                              return data
                                                  .showToastValidPicture();
                                            } else {
                                              data.showPhotoToastDone();
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: const Text(
                                            'Add',
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ));
              },
              icon: const Icon(
                Icons.add,
              ))
        ],
      ),
      body: const SingleChildScrollView(child: AlbumList()),
    );
  }

  Future<void> pickerImage(StateSetter setState) async {
    final XFile? pickedFile =
        await _image.pickImage(source: ImageSource.gallery);

    setState(() {
      _myPhoto = File(pickedFile!.path);
    });
  }

  Future<void> pickerCamera(StateSetter setState) async {
    final XFile? pickedFile =
        await _image.pickImage(source: ImageSource.camera);
    setState(() {
      _myPhoto = File(pickedFile!.path);
    });
  }

  Future<List> albumInfoList() async {
    _dropD = await PhotoRepo().getNameAlbumsMap();
    return _dropD;
  }
}
