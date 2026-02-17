import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_generator/presentation/provider/image_provider.dart';
import 'package:shimmer/shimmer.dart';

class ImageWidget extends StatefulWidget {
  final ImageGeneratingProvider provider;

  const ImageWidget({super.key, required this.provider});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 512),
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Card(
              child: widget.provider.currentImage != null
                  ? CachedNetworkImage(
                      imageUrl: widget.provider.currentImage!.url,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.teal.shade300,
                        highlightColor: Colors.teal.shade100,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 512),
                          child: AspectRatio(aspectRatio: 1 / 1, child: Card()),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: Icon(
                        Icons.image,
                        size: 300,
                        color: Colors.grey.shade300,
                      ),
                    ),
            ),
          ),
        ),
        widget.provider.currentImage == null
            ? Text(
                "Generate an image by prompting",
                style: TextStyle(color: Colors.grey),
              )
            : Text('Last Prompt : ${widget.provider.getCurrentImage!.prompt}'),
      ],
    );
  }
}
