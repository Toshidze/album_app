import 'package:app_for_trood/models/userModel.dart';
import 'package:app_for_trood/services/networking.dart';
import 'package:app_for_trood/utilities/mainColor.dart';
import 'package:flutter/material.dart';
import 'package:app_for_trood/utilities/constants.dart';

class DescriptionScreen extends StatefulWidget {
  final User descriptionItem;
  DescriptionScreen({Key? key, required this.descriptionItem})
      : super(key: key);

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  List<dynamic> userInfo = [];
  ApiHelper apiHelper = ApiHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTitle(),
        ],
      ),
    );
  }

  Container buildTitle() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                Container(
                  child: Text(
                    widget.descriptionItem.name.toString(),
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
                  // decoration: TextDecoration.underline,
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
                    widget.descriptionItem.username.toString(),
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
                    widget.descriptionItem.email.toString(),
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
                    widget.descriptionItem.phone.toString(),
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
                    widget.descriptionItem.website.toString(),
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
                    widget.descriptionItem.address!.street.toString(),
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
                    widget.descriptionItem.address!.suite.toString(),
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
                    widget.descriptionItem.address!.city.toString(),
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
                    widget.descriptionItem.address!.zipcode.toString(),
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
                    widget.descriptionItem.company!.name.toString(),
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
                    widget.descriptionItem.company!.catchPhrase.toString(),
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
                    widget.descriptionItem.company!.bs.toString(),
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
    );
  }

  Future<List> userInfoList() async {
    userInfo = await ApiHelper().getUsers();

    return userInfo;
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: MainColor.mainColorGrey,
      title: Text(
        'Trood.',
      ),
    );
  }
}
