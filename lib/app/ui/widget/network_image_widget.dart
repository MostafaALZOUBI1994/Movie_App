import 'package:flutter/material.dart';

// this is reusable widget that show images in entire application
class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;

  const NetworkImageWidget({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.asset("assets/noposter.jpeg");
      },
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(15.0), child: child);
        }
        // this will show while the image is loaded
        return Container(
          height: 100,
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
    );
  }
}
