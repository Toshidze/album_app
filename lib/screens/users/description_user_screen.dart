import 'package:app_for_trood/provider/data_provider.dart';
import 'package:app_for_trood/utilities/mainColor.dart';
import 'package:flutter/material.dart';
import 'package:app_for_trood/utilities/constants.dart';
import 'package:provider/provider.dart';

class DescriptionUserScreen extends StatelessWidget {
  final int index;
  DescriptionUserScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.watch<GetData>();
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: MainColor.mainColorGrey,
        title: Text(
          'User info',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      data.userInfo[index].name,
                      style: TextStyle(
                        color: MainColor.mainAccentColorYelow,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal information',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'Username: ',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data.userInfo[index].username,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'Email: ',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data.userInfo[index].email,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'Phone: ',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data.userInfo[index].phone,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'website: ',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data.userInfo[index].website,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'Street: ',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data.userInfo[index].address.street,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'Suite: ',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data.userInfo[index].address.suite,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'City: ',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data.userInfo[index].address.city,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'Zipcode: ',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data.userInfo[index].address.zipcode,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Company',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'Name: ',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data.userInfo[index].company.name,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'Catch Phrase: ',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data.userInfo[index].company.catchPhrase,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'BS: ',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data.userInfo[index].company.bs,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
