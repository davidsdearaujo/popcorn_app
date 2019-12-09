import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';

import '../../models/movie_model.dart';

class MovieWidget extends StatelessWidget {
  final MovieModel model;
  final bool tapEnabled;

  MovieWidget({@required this.model, Key key, this.tapEnabled = true})
      : assert(model != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: debugDefaultTargetPlatformOverride == TargetPlatform.fuchsia
          ? Image.network(
              model.images.poster ?? "http://loden.org/wp-content/uploads/2016/09/No_Image_Available.png",
              fit: BoxFit.cover,
              width: 117,
            )
          : CachedNetworkImage(
              imageUrl: model.images.poster ?? "http://loden.org/wp-content/uploads/2016/09/No_Image_Available.png",
              fit: BoxFit.cover,
              width: 117,
              errorWidget: (context, message, ex) => Text(model.title),
              placeholder: (context, _) => Container(
                    width: 117,
                    child: Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
            ),
    );
  }
}
