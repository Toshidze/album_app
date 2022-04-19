import 'package:app_for_trood/provider/data_provider.dart';
import 'package:app_for_trood/repositories/post_repo.dart';
import 'package:app_for_trood/screens/posts/post_list.dart';
import 'package:app_for_trood/screens/posts/post_screen.dart';
import 'package:app_for_trood/utilities/constants.dart';
import 'package:app_for_trood/utilities/main_color.dart';
import 'package:app_for_trood/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  final TextEditingController _controllerTitle = TextEditingController();

  final TextEditingController _controllerBody = TextEditingController();
  Future<dynamic>? futurePost;

  @override
  Widget build(BuildContext context) {
    var getData = context.watch<GetData>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PostList(),
            futurePost == null
                ? const SizedBox()
                : FutureBuilder<dynamic>(
                    future: futurePost,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(right: 8, left: 8, top: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 5,
                                    offset: const Offset(0, 2))
                              ],
                            ),
                            child: Material(
                              borderRadius: BorderRadius.circular(5),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5),
                                splashColor: MainColor.mainAccentColorYelow
                                    .withOpacity(0.1),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return PostScreen(
                                        postItem: snapshot.data!,
                                      );
                                    },
                                  ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(right: 8),
                                            child: Icon(
                                              Icons.person,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 200,
                                                child: Text(
                                                  snapshot.data!.title,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: kTitleTextStyle,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: SizedBox(
                                                  width: 260,
                                                  child: Text(
                                                    snapshot.data!.body,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: kSubTitleTextStyle,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        Icons.arrow_right,
                                        color: MainColor.mainAccentColorYelow,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      return const CircularProgressIndicator();
                    },
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
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
                                'New post',
                                style:
                                    TextStyle(fontSize: 26, color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextFormField(
                                  controller: _controllerTitle,
                                  postItem: 'title'),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextFormField(
                                  controller: _controllerBody,
                                  postItem: 'body'),
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
                                          futurePost = PostRepo().addUserPosts(
                                              id: 100 + 1,
                                              title: _controllerTitle.text,
                                              body: _controllerBody.text,
                                              userId: 11);
                                        });

                                        getData.showToastDone(context);
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
          child: const Icon(Icons.add)),
    );
  }
}
