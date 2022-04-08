import 'package:flutter/material.dart';

import 'scan_selection.dart';

class ScanOverlay extends StatelessWidget {
  const ScanOverlay({
    Key? key,
    required this.hasTorch,
    this.description,
    this.onTorchToggled,
  }) : super(key: key);

  final Widget? description;
  final VoidCallback? onTorchToggled;
  final bool hasTorch;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          const ScanSelectionOverlay(),
          if (hasTorch)
            _ToggleTorchButton(
              onTorchToggled: onTorchToggled,
            ),
          if (description != null)
            _Description(
              description: description!,
            )
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
    required this.description,
  }) : super(key: key);

  final Widget description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 400, left: 32, right: 32),
      child: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
        child: description,
      ),
    );
  }
}

class _ToggleTorchButton extends StatefulWidget {
  const _ToggleTorchButton({
    Key? key,
    required this.onTorchToggled,
  }) : super(key: key);

  final VoidCallback? onTorchToggled;

  @override
  State<_ToggleTorchButton> createState() => _ToggleTorchButtonState();
}

class _ToggleTorchButtonState extends State<_ToggleTorchButton> {
  bool isFlashlightOn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 500),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: CircleAvatar(
          backgroundColor: isFlashlightOn ? Colors.white54 : Colors.white12,
          radius: 25,
          child: IconButton(
            key: ValueKey(isFlashlightOn),
            onPressed: () {
              setState(() {
                isFlashlightOn = !isFlashlightOn;
              });
              if (widget.onTorchToggled != null) {
                widget.onTorchToggled!();
              }
            },
            color: Colors.white,
            icon: const Icon(Icons.flashlight_on),
            tooltip: 'todo',
          ),
        ),
      ),
    );
  }
}
