import 'package:facebookcloneui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebookcloneui/models/models.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;


  const CreatePostContainer({Key? key, required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      child: Column(
        children: [
          Row(
            children: [

              ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(width: 8.0,),
              Expanded(child:
                TextField(
                  decoration: InputDecoration.collapsed(hintText: 'what/s new on your mind?'),
                )
              ),
            ],
          ),
          const Divider(height: 10.0,thickness: 0.5,),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(onPressed: () {},
                    icon: const Icon(
                        Icons.videocam,
                        color: Colors.red,
                    ),
                    label: Text('Live'),
                ),
                VerticalDivider(width: 8.0,),

                FlatButton.icon(onPressed: () {},
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: Text('Photos'),
                ),
                VerticalDivider(width: 8.0,),

                FlatButton.icon(onPressed: () {},
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label: Text('Room'),
                ),
                VerticalDivider(width: 8.0,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
