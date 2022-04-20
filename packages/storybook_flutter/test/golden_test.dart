import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

Widget simpleStorybook(String initialStory) => Storybook(
      plugins: initializePlugins(
        contentsSidePanel: true,
        knobsSidePanel: true,
      ),
      initialStory: initialStory,
      stories: [
        Story(
          name: 'Button',
          builder: (_) => TextButton(
            onPressed: () {},
            child: const Text('Push me'),
          ),
        ),
        Story(
          name: 'Customizable Button',
          builder: (context) => TextButton(
            onPressed: () {},
            child: Text(context.knobs.text(label: 'Text', initial: 'Push me')),
          ),
        )
      ],
    );

void main() {
  goldenTest(
    'Simple story layout',
    fileName: 'simple_story_layout',
    constraints: const BoxConstraints(maxWidth: 1384, maxHeight: 1050),
    builder: () => simpleStorybook('Button'),
  );

  goldenTest(
    'Story layout',
    fileName: 'story_layout',
    constraints: const BoxConstraints(maxWidth: 1384, maxHeight: 1050),
    builder: () => simpleStorybook('Customizable Button'),
  );
}
