import 'package:flutter/material.dart';

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Expanded(
          child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFDEE2E6),
          border: Border.all(
            width: 1,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'MQU Campus Guide',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text(
                '(Zoom in for a better view)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Positioned(
                top: 200,
                left: 100,
                child: InteractiveViewer(
                  panEnabled: false,
                  boundaryMargin: const EdgeInsets.all(100),
                  minScale: 1,
                  maxScale: 3.5,
                  child: Image.asset(
                    'assets/images/mq-campus-map.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
