import 'dart:ui';

import 'package:client/src/common/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SizeControllerWidget extends StatefulWidget {
  const SizeControllerWidget({
    super.key,
    required this.maxHeight,
    required this.builder
  });

  final double maxHeight;
  final WidgetBuilder builder;

  @override
  State<SizeControllerWidget> createState() => _SizeControllerWidgetState();
}

class _SizeControllerWidgetState extends State<SizeControllerWidget> 
  with SingleTickerProviderStateMixin 
  {

  bool isShown = false;

  late AnimationController animationController;
  late Animation<double> gradientAnimation;
  late Animation<double> widgetHeightAnimation;

  @override
  void initState() { 
    super.initState();
    animationController = AnimationController(
      vsync: this, 
      duration: const Duration(seconds: 2),
    );
    gradientAnimation = Tween<double>(begin: widget.maxHeight, end: 0)
      .animate(animationController)
      ..addListener(() {
        setState(() {

        });
      });
    widgetHeightAnimation = Tween<double>(begin: 0, end: 1)
      .animate(animationController)
      ..addListener(() {
        setState(() {

        });
      });
  }
  
  GlobalKey k = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    // final w = widget.builder(context);
    final w = Container(key: k, height: 100, color: Colors.amber);

    print("${animationController.value} ${gradientAnimation.value} ${widgetHeightAnimation.value}");
    return LayoutBuilder(
      builder: (context, constraints) {
        print('layout = $constraints');
        return InkWell(
          onTap: () {
            setState(() {
              final height = k.currentContext!.size?.height;
              if (height == null) return;
              final diff = height - widget.maxHeight;
              
              if (isShown) {
                isShown = false;
                animationController.reverse(from: height != null ? height / 100 : null);
                printInfo('now it is hidden');
              } else {
                isShown = true;
                animationController.forward(from: height != null ? height / 100 : null);
                printInfo('now it is shown');
              }
            });
          },
          child: w
          // child: isShown 
          //   ? w 
          //   : SizedBox(
          //     height: widget.maxHeight,
          //     child: Viewport(
          //       offset: ViewportOffset.fixed(widget.maxHeight),
          //       slivers: [
          //         SliverFillViewport(
          //           delegate: SliverChildBuilderDelegate((context, index) => w)
          //         )
          //       ],
          //     ),
          //   )
        );
      }
    );
    /*
    return GestureDetector(
      onTap: () {
        setState(() => isShown = !isShown);
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedSize(
              curve: Curves.linear,
              duration: const Duration(seconds: 2),
              child: isShown ? w : Viewport(
                offset: ViewportOffset.fixed(widget.maxHeight),
                slivers: [
                  SliverFillViewport(
                    delegate: SliverChildBuilderDelegate((context, index) => w)
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: gradientAnimation.value,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.background,
                    Theme.of(context).colorScheme.background.withAlpha(0),
                  ],
                )
              )
            )
          )
        ]
      )
    );
    */
    // return GestureDetector(
    //   onTap: () {
    //     setState(() {
    //       isShown = !isShown;
    //     });
    //   },
    //   child: isShown 
    //     ? w
    //     : SizedBox(
    //       height: widget.maxHeight,
    //       child: Stack(
    //         children: [
    //           Viewport(
    //             offset: ViewportOffset.fixed(widget.maxHeight),
    //             slivers: [
    //               SliverFillViewport(
    //                 delegate: SliverChildBuilderDelegate((context, index) => w)
    //               )
    //             ],
    //           ),
    //           Positioned.fill(
    //             child: Container(
    //               decoration: BoxDecoration(
    //                 gradient: LinearGradient(
    //                   begin: Alignment.topCenter,
    //                   end: Alignment.bottomCenter,
    //                   tileMode: TileMode.decal,
    //                   stops: [ 0.2, 0.9 ],
    //                   colors: [
    //                     // Theme.of(context).colorScheme.background,
    //                     // Theme.of(context).colorScheme.background.withAlpha(0),
    //                     Colors.red,
    //                     Colors.green,
    //                   ],
    //                 )
    //               ),
    //             )
    //           ),
    //         ]
    //       )
    //     ),
    // );
  }
}