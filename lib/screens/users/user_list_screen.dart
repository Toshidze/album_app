import 'dart:ui';

import 'package:app_for_trood/main.dart';
import 'package:app_for_trood/provider/data_provider.dart';
import 'package:app_for_trood/utilities/constants.dart';
import 'package:app_for_trood/utilities/mainColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'description_user_screen.dart';

class UserListScreen extends StatefulWidget {
  UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    final themeData = context.watch<ThemeNotifier>();
    var data = context.watch<GetData>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Users',
              style: TextStyle(fontSize: 22),
            ),
            Spacer(),
            Switch(
              activeColor: MainColor.mainAccentColorYelow,
              onChanged: (value) => themeData.toggleTheme(),
              value: themeData.darkTheme,
            ),
          ],
        ),
      ),
      body: Container(
        child: FutureBuilder(
            future: data.userInfoList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: data.userInfo.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(right: 8, left: 8, top: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 5,
                                  offset: Offset(0, 2))
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
                                    return DescriptionUserScreen(
                                      index: index,
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
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.userInfo[index].name,
                                              style: kTitleTextStyle,
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5),
                                                  child: Text(
                                                    'Albums: ${data.userInfo[index].albums}',
                                                    style: kSubTitleTextStyle,
                                                  ),
                                                ),
                                                Text(
                                                  'Posts: ${data.userInfo[index].posts}',
                                                  style: kSubTitleTextStyle,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Icon(
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
                    });
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
