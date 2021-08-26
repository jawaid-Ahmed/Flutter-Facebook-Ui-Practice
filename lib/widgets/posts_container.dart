import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookcloneui/config/palette.dart';
import 'package:facebookcloneui/models/models.dart';
import 'package:facebookcloneui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class PostContainer extends StatelessWidget {

  final Post post;

  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostHeader(post: post),
                const SizedBox(height: 4.0,),
                Text(post.caption),
                post.imageUrl != null
                    ? SizedBox.shrink()
                    : const SizedBox(height: 6.0
                ),

              ],
            ),
          ),
          post.imageUrl != null
            ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(imageUrl: post.imageUrl),
            )
            : const SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: _PostStats(post: post),
          )
        ],
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final Post post;
  const PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8.1,),
        Expanded(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.user.name,style: const TextStyle(fontWeight: FontWeight.w600),),
              Row(children: [
                Text('${post.timeAgo} . ',
                  style: TextStyle(
                    color: Colors.grey[600],fontSize: 12.0,
                  ),
                ),
                Icon(Icons.public,color: Colors.grey[600],size: 12.0,),
              ],)
            ],
          ),
        ),
        IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_horiz),
        )
      ],
    );
  }
}


class _PostStats extends StatelessWidget {

  final Post post;

  const _PostStats({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                color: Palette.facebookblue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              child: Text(
                '${post.likes} .',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(width: 8.0),
            Text(
              '${post.shares} Shares',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),

          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Like',
              onTap: (){},

            ),
            _PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comment',
              onTap: (){},

            ),
            _PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Share',
              onTap: (){},

            ),
          ],
        )
      ],
    );
  }
}


class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap.call(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0,),
                Text(label),
              ],

            ),
          ),
        ),
      ),
    );
  }
}
