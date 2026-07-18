import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsViewWidget extends StatefulWidget {
  NewsViewWidget({
    super.key,
    required this.imagePath,
    required this.country,
    required this.title,
    required this.onTap,
  });
  void Function()? onTap;
  String? title;
  String? country;
  String? imagePath;

  @override
  State<NewsViewWidget> createState() => _NewsViewWidgetState();
}

class _NewsViewWidgetState extends State<NewsViewWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 5,
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: widget.imagePath != null
                  ? CachedNetworkImage(
                      imageUrl: widget.imagePath!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: Image.asset('assets/icons/loading.gif'),
                      ),
                    )
                  : Image.asset('assets/image/dummy_image.png'),
            ),
            Text(
              widget.country ?? 'Europe',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              widget.title ?? 'Russian warship: Moskva sinks in Black Sea ',
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
