import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../utilities/mainColor.dart';
import '../services/networkingUsers.dart';
import 'descriptionUserScreen.dart';

// import 'package:app_for_trood/models/providerModel.dart';

class UserListScreen extends StatefulWidget {
  UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<dynamic> userInfo = [];
  int? albumInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: userInfoList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: userInfo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
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
                          color: MainColor.mainColorGrey,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(5),
                            splashColor:
                                MainColor.mainAccentColorYelow.withOpacity(0.1),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return DescriptionScreen(
                                    descriptionItem: userInfo[index],
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
                                            userInfo[index].name,
                                            style: kTitleTextStyle,
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: Text(
                                                  'Albums: ${userInfo[index].albums}',
                                                  style: kSubTitleTextStyle,
                                                ),
                                              ),
                                              Text(
                                                'Posts: ${userInfo[index].posts}',
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
    );
  }

  Future<List> userInfoList() async {
    userInfo = await ApiHelper().getUsers();

    return userInfo;
  }
}
