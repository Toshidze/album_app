import 'package:app_for_trood/models/postModel.dart';
import 'package:app_for_trood/provider/data_provider.dart';
import 'package:app_for_trood/utilities/mainColor.dart';
import 'package:app_for_trood/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:app_for_trood/utilities/constants.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  final Post postItem;
  PostScreen({Key? key, required this.postItem}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    var data = context.watch<GetData>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.postItem.user!.name.toString(),
                            style: TextStyle(
                              color: MainColor.mainAccentColorYelow,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                          child: Container(
                                            color: MainColor.mainColorGrey,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ListView(
                                                shrinkWrap: true,
                                                children: <Widget>[
                                                  Text(
                                                    'Edit post',
                                                    style: TextStyle(
                                                        fontSize: 26,
                                                        color: Colors.grey),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  CustomTextFormField(
                                                      postItem: widget.postItem
                                                          .user!.name!),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  CustomTextFormField(
                                                      postItem: widget
                                                          .postItem.title),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  CustomTextFormField(
                                                      postItem:
                                                          widget.postItem.body),
                                                  Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Close',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red),
                                                          ),
                                                        ),
                                                        TextButton(
                                                          onPressed: () async {
                                                            data.showToastDone(
                                                                context);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Done',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .green),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ));
                              },
                              icon: Icon(Icons.edit))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 250,
                    child: Text(
                      widget.postItem.title,
                      style: kSubTitleTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Text(
                      widget.postItem.body,
                      style: kSubTitleTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
