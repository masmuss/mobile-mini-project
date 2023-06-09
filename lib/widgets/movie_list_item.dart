import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String information;
  final Widget? trailing;
  final GlobalKey backgroundImageKey = GlobalKey();

  MovieListItem(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.information,
      required this.trailing
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Stack(
            children: [
              Flow(
                delegate: _ParallaxFlowDelegate(
                  scrollable: Scrollable.of(context)!,
                  listItemContext: context,
                  backgroundImageKey: backgroundImageKey,
                ),
                children: [
                  Image.network(
                    imageUrl,
                    width: double.infinity,
                    key: backgroundImageKey,
                    fit: BoxFit.cover,
                  )
                ],
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.4, 0.95],
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      information,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: trailing!,

              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ParallaxFlowDelegate extends FlowDelegate {
  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  _ParallaxFlowDelegate(
      {required this.scrollable,
      required this.listItemContext,
      required this.backgroundImageKey})
      : super(repaint: scrollable.position);

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(width: constraints.maxWidth);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // calculate the position of the list item time within the viewport
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);

    // determine the percent position of the list item within the scrollable area
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // calculate the vertical alignment og the background based on the scroll percent
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // convert the background alignment into a pixel offset for painting purpose
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // paint the background image
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(covariant _ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
