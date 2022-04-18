import 'package:app_for_trood/models/post_model.dart';
import 'package:app_for_trood/provider/data_provider.dart';
import 'package:app_for_trood/utilities/main_color.dart';
import 'package:app_for_trood/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowModalEditPost extends StatelessWidget {
  final Post postItem;
  const ShowModalEditPost({Key? key, required this.postItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.watch<GetData>();
    return IconButton(
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
                            CustomTextFormField(postItem: postItem.user!.name!),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(postItem: postItem.title),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(postItem: postItem.body),
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
                                      data.showToastDone(context);
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Done',
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
        icon: const Icon(Icons.edit));
  }
}
