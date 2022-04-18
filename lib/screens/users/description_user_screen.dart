import 'package:app_for_trood/screens/photos/album_list.dart';
import 'package:app_for_trood/screens/posts/post_list.dart';
import 'package:app_for_trood/utilities/main_color.dart';
import 'package:flutter/material.dart';
import 'package:app_for_trood/utilities/constants.dart';

class DescriptionUserScreen extends StatelessWidget {
  final int index;
  final List<dynamic> data;
  const DescriptionUserScreen(
      {Key? key, required this.index, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data[index].name,
          style: const TextStyle(
            color: MainColor.mainAccentColorYelow,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Personal information',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Text(
                      'Username: ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data[index].username,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Text(
                      'Email: ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data[index].email,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Text(
                      'Phone: ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data[index].phone,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Text(
                      'website: ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data[index].website,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Text(
                      'Street: ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data[index].address.street,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Text(
                      'Suite: ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data[index].address.suite,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Text(
                      'City: ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data[index].address.city,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Text(
                      'Zipcode: ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data[index].address.zipcode,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Company',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Text(
                      'Name: ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data[index].company.name,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Text(
                      'BS: ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      data[index].company.bs,
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '<< ${data[index].company.catchPhrase} >>',
                  style: kBodyTextStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Posts',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                PostList(
                  lengthList: 3,
                  userId: data[index].id,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Albums',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                AlbumList(
                  lengthList: 3,
                  userId: data[index].id,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
