
import 'package:flutter/material.dart';

const double buttonSize = 80;

class CircularFabWidget extends StatefulWidget {
  const CircularFabWidget({Key? key}) : super(key: key);

  @override
  State<CircularFabWidget> createState() => _CircularFabWidgetState();
}

class _CircularFabWidgetState extends State<CircularFabWidget> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {

    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
        vsync: this
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => Flow(

      delegate: FlowMenuDelegate(controller: controller),
      children: [
        Icons.menu,
        Icons.undo,
        Icons.settings
      ].map<Widget>(buildFab).toList(),
  );

  Widget buildFab(IconData icon) => FloatingActionButton(
      elevation: 0,
      splashColor: Colors.black,
      child: Icon(icon, color: Colors.white, size: 45,),
      onPressed: () {
        if (controller.status == AnimationStatus.completed) {
          controller.reverse();
        } else {
          controller.forward();
        }
      }
  );
}

class FlowMenuDelegate extends FlowDelegate {

  final Animation<double> controller;

  const FlowMenuDelegate({required this.controller}) : super(repaint: controller);

  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = size.width - buttonSize;
    final yStart = size.height - buttonSize;
    for (int i = context.childCount - 1; i >= 0 ; i--) {
      const margin = 8;
      final childSize = context.getChildSize(i)!.width;
      final dx = (childSize + margin) * i;
      final x = xStart;
      final y = yStart - dx * controller.value;
      context.paintChild(
          i,
          transform: Matrix4.translationValues(x, y, 0)
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;

}
