import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_instagram/utils/constants/colors.dart';

class PostFeed extends StatefulWidget {
  const PostFeed({Key? key}) : super(key: key);

  @override
  State<PostFeed> createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //top userdetail
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: blueColor,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      "username",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Container(
                            height: 100,
                            width: 150,
                            child: ListView(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 24),
                              shrinkWrap: true,
                              children: [
                                "Delete",
                              ]
                                  .map(
                                    (e) => Center(
                                      child: Container(
                                        color: Colors.grey.withOpacity(0.5),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 12),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            e.toString(),
                                            style:
                                                TextStyle(color: primaryColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
          // Image section
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4),
            height: MediaQuery.of(context).size.height * 0.40,
            width: double.infinity,
            child: Image.network(
              "https://images.unsplash.com/photo-1660627256248-74c0efd59349?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
              fit: BoxFit.cover,
            ),
          ),
          //likes comment button
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.comment_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.bookmark_outline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // more details
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1,232 likes",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyText1,
                    children: [
                      TextSpan(
                        text: "username",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                          text: "  Hey! the description may be change later "),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "View all 200 comments",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                Text(
                  "16/08/2022",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
