import 'dart:async';
import 'package:app_for_trood/provider/data_provider.dart';
import 'package:app_for_trood/repositories/photo_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'photo_screen.dart';
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
        title: Text('Albums'),
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
                                  Text(
                                    'Edit post',
                                    style: TextStyle(
                                        fontSize: 26, color: Colors.grey),
                                  ),
                                  SizedBox(
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
                                  if (this._myPhoto != null)
                                    Image.file(_myPhoto as File)
                                  else
                                    Container(
                                        height: 200,
                                        child: const Placeholder()),
                                  SizedBox(
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
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
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
                                          child: Text(
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
                                          child: Text(
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
              icon: Icon(
                Icons.add,
              ))
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: data.photoInfoList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: data.albumModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhotoScreen(index: index),
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 8,
                                    offset: Offset(0, 2))
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                '${data.albumModel[index].firstPhoto}',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 130,
                            child: Center(
                              child: Text(
                                data.albumModel[index].title,
                                maxLines: 1,
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
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
