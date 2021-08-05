import 'dart:async';
import 'dart:ui';
import 'package:app_for_trood/services/networkingAlbum.dart';
import 'package:app_for_trood/services/networkingUsers.dart';
import 'package:app_for_trood/utilities/mainColor.dart';
import 'package:flutter/material.dart';
import 'photoScreen.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AlbumListScreen extends StatefulWidget {
  const AlbumListScreen({Key? key}) : super(key: key);

  @override
  _AlbumListScreenState createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  List<dynamic> albumModel = [];
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainColor.mainColorGrey,
        title: Text('Trood.'),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => Dialog(
                          child: Container(
                            color: MainColor.mainColorGrey,
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
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              if (!formKey.currentState!
                                                  .validate()) {
                                                return;
                                              }

                                              if (_myPhoto == null) {
                                                return showToastValidPicture();
                                              } else {
                                                showToastDone();
                                                Navigator.pop(context);
                                              }
                                            },
                                            child: Text(
                                              'Add',
                                              style: TextStyle(
                                                  color: Colors.green),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ),
                        ));
              },
              icon: Icon(
                Icons.add,
              ))
        ],
      ),
      backgroundColor: Colors.blueGrey[800],
      body: Container(
        child: FutureBuilder(
          future: userInfoList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: albumModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PhotoScreen(idPhoto: albumModel[index].id),
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 8,
                                    offset: Offset(0, 2))
                              ]),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      albumModel[index].firstPhoto))),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 130,
                            child: Center(
                              child: Text(
                                albumModel[index].title,
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

  Future<List> userInfoList() async {
    albumModel = await AlbumClass().fetchAlbum();
    return albumModel;
  }

  Future<List> albumInfoList() async {
    _dropD = await ApiHelper().getNameAlbumsMap();
    return _dropD;
  }

  showToastDone() async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        content: Text(
          'Photo added',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    await Future.delayed(Duration(seconds: 3));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  showToastValidPicture() async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'no photo',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    await Future.delayed(Duration(seconds: 3));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
