import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class PlugSocketWidget extends ConsumerStatefulWidget {
  final Color bgColor, iconColor, borderColor;
  final IconData icon;
  final String text;

  const PlugSocketWidget({
    super.key,
    required this.bgColor,
    required this.iconColor,
    required this.borderColor,
    required this.icon,
    required this.text,
  });

  @override
  ConsumerState<PlugSocketWidget> createState() => _PlugSocketWidgetState();
}

class _PlugSocketWidgetState extends ConsumerState<PlugSocketWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Stack(
        children: [
          AnimatedContainer(
            height: 120,
            width: 120,
            duration: const Duration(milliseconds: 250),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.bgColor,
              border: Border.all(color: widget.borderColor, width: 1.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: 42,
              width: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.iconColor,
                border: Border.all(color: widget.borderColor, width: 4.0),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                widget.text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Icon(widget.icon, color: Colors.white, size: 20),
          )
        ],
      ),
    );
  }
}
