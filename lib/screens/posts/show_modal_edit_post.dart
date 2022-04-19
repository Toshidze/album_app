import 'package:app_for_trood/models/post_model.dart';
import 'package:app_for_trood/provider/data_provider.dart';
import 'package:app_for_trood/repositories/post_repo.dart';
import 'package:app_for_trood/utilities/main_color.dart';
import 'package:app_for_trood/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowModalEditPost extends StatefulWidget {
  final Post? postItem;
  final Future<dynamic>? futurePost;
  const ShowModalEditPost({Key? key, this.postItem, this.futurePost})
      : super(key: key);

  @override
  State<ShowModalEditPost> createState() => _ShowModalEditPostState();
}

class _ShowModalEditPostState extends State<ShowModalEditPost> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerBody = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var data = context.watch<GetData>();
    return FloatingActionButton.small(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => Dialog(
                    child: Container(
                      color: MainColor.mainColorGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            const Text(
                              'Edit post',
                              style:
                                  TextStyle(fontSize: 26, color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                                controller: _controllerTitle,
                                postItem: widget.postItem?.title ?? ''),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                                controller: _controllerBody,
                                postItem: widget.postItem?.body ?? ''),
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
                                    onPressed: () {
                                      setState(() {
                                        PostRepo().addUserPosts(
                                            id: 100 + 1,
                                            title: _controllerTitle.text,
                                            body: _controllerBody.text,
                                            userId: 11);
                                      });

                                      data.showToastDone(context);
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Send',
                                      style: TextStyle(color: Colors.green),
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
        child: const Icon(Icons.edit));
  }
}
