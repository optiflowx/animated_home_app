import 'package:animated_home_app/components/plug_socket_widget.dart';
import 'package:animated_home_app/data/plug_socket_input_data.dart';
import 'package:animated_home_app/utils/provs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/plug_socket_output_data.dart';
import '../components/left_plug.dart';
import '../components/right_plug.dart';
import '../components/rope.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isDrag = ref.watch(isPlugDraggedProvider);
    final sColor = ref.watch(borderColorProvider);
    final int li = ref.watch(leftIndexProvider);
    final int ri = ref.watch(rightIndexProvider);

    const bgColors = [Color(0xFFE5F4FB), Color(0xFFFFDCDC), Color(0xFFFFF5E6)];

    return Scaffold(
      backgroundColor: bgColors[li],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        backgroundColor: bgColors[li],
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.back, size: 28, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.home,
                  size: 28, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.add,
                  size: 28, color: Colors.black)),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        clipBehavior: Clip.none,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Input View
                Column(
                  key: const Key('Input'),
                  children: List.generate(
                    PlugSocketInputData.data.length,
                    (index) {
                      final unit = PlugSocketInputData.data[index];

                      return PlugSocketWidget(
                        text: 'I',
                        bgColor: unit.bgColor,
                        iconColor: unit.iconColor,
                        borderColor: unit.strokeColor,
                        icon: unit.icon,
                      );
                    },
                  ),
                ),

                //Output View
                Column(
                  key: const Key('Output'),
                  children: List.generate(
                    PlugSocketOutputData.data.length,
                    (index) {
                      final unit = PlugSocketOutputData.data[index];
                      final color = PlugSocketOutputData.data[li].bgColor;
                      const gClr = Color.fromARGB(255, 167, 167, 174);
                      const gSClr = Color.fromARGB(255, 116, 114, 122);

                      return PlugSocketWidget(
                        text: 'O',
                        bgColor: index == ri ? (isDrag ? gClr : color) : gClr,
                        iconColor: unit.unplugIconColor!,
                        borderColor:
                            index == ri ? (isDrag ? gSClr : sColor) : gSClr,
                        icon: unit.icon,
                      );
                    },
                  ),
                ),
              ],
            ),
            const LeftPlug(),
            const RightPlug(),
            const Rope(),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '@optiflowx',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
