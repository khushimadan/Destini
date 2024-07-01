import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(const Destini());
}

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background3.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
              flex: 12,
              child: Center(
                child: Text(
                  storyBrain.getStory(),
                  style: const TextStyle(
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextButton(
                onPressed: () {
                  //Choice 1 made by user.
                  setState(() {
                    storyBrain.nextStory(1);
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.purple[200],
                ),
                child: Text(
                  storyBrain.getchoice1(),
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              flex: 2,
              child: Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: TextButton(
                  onPressed: () {
                    //Choice 2 made by user.
                    setState(() {
                      storyBrain.nextStory(2);
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.purple[100],
                  ),
                  child: Text(
                    storyBrain.getchoice2(),
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
