import 'package:app_for_trood/main.dart';
import 'package:app_for_trood/provider/data_provider.dart';
import 'package:app_for_trood/utilities/constants.dart';
import 'package:app_for_trood/utilities/main_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'description_user_screen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

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
            const Text(
              'Users',
              style: TextStyle(fontSize: 22),
            ),
            const Spacer(),
            Switch(
              activeColor: MainColor.mainAccentColorYelow,
              onChanged: (value) => themeData.toggleTheme(),
              value: themeData.darkTheme,
            ),
          ],
        ),
      ),
      body: FutureBuilder(
          future: data.userInfoList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var ssData = snapshot.data as List;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: ssData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 8, left: 8, top: 8),
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
                                        return DescriptionUserScreen(
                                          index: index,
                                          data: ssData,
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
                                              padding:
                                                  EdgeInsets.only(right: 8),
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
                                                  ssData[index].name,
                                                  style: kTitleTextStyle,
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5),
                                                      child: Text(
                                                        'Albums: ${ssData[index].albums}',
                                                        style:
                                                            kSubTitleTextStyle,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Posts: ${ssData[index].posts}',
                                                      style: kSubTitleTextStyle,
                                                    ),
                                                  ],
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
                        }),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
