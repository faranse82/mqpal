import 'package:flutter/material.dart';
import 'package:mqpal/state.dart';
import 'package:provider/provider.dart';

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final isDarkMode = Provider.of<StateModel>(context).isDarkMode;

    return Expanded(
      child: Expanded(
          child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            width: 1,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenHeight * 0.017),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MQU Campus Guide',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.2, top: screenHeight * 0.006),
                    child: GestureDetector(
                      onTap: () {
                        Provider.of<StateModel>(context, listen: false)
                            .toggleMap();
                      },
                      child: Container(
                        width: screenWidth * 0.08,
                        height: screenHeight * 0.04,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              isDarkMode
                                  ? 'assets/images/close.png'
                                  : 'assets/images/close_dark.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                '(Zoom in for a better view)',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SizedBox(height: screenHeight * 0.005),
              Positioned(
                top: screenHeight * 0.05,
                left: screenWidth * 0.05,
                child: InteractiveViewer(
                  panEnabled: false,
                  boundaryMargin: const EdgeInsets.all(100),
                  minScale: 1,
                  maxScale: 3.5,
                  child: Image.asset(
                    'assets/images/mq-campus-map.png',
                    width: screenWidth * 0.88,
                    height: screenHeight * 0.32,
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
