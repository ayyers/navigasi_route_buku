import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(MaterialApp(
    home: BookListScreen(),
  ));
}

class BookListScreen extends StatelessWidget {
  final List<Map<String, String>> books = [
    {
      'title': 'Alice in Wonderland',
      'author': 'Lewis Carroll',
      'description':
          'Alice follows a white rabbit and falls into a hole that leads her to Wonderland. There, she encounters strange characters and experiences a series of surreal adventures. '
           'From sudden changes in size to encounters with peculiar creatures and absurd challenges, Alice navigates through an illogical and fantastical world while desperately seeking a way back home.',
      'pdf': 'assets/pdf/AIW.pdf'
    },
    {
      'title': 'The Wonderful Wizard of OZ',
      'author': 'L. Frank Baum',
      'description':
          'Swept away by a sudden cyclone, ordinary farm girl Dorothy wakes up in the bizarre and magical Land of Oz. Her only ticket back home? The enigmatic Wizard of Oz. Joined by a brainless Scarecrow, a heartless Tin Man, and a Cowardly Lion, Dorothy must embark on a perilous quest to defeat the Wicked Witch of the West. But in a world ruled by magic, nothing is as it seems—especially the Wizard himself.',
      'pdf': 'assets/pdf/the_wonderful_wizard_of_oz.pdf'
    },
    {
      'title': 'Dracula',
      'author': 'Bram Stoker',
      'description':
          'A routine business trip turns into a living nightmare when young lawyer Jonathan Harker visits an isolated Transylvanian castle. He soon discovers his client, the enigmatic Count Dracula, is a bloodthirsty immortal with his sights set on London. As a dark plague of vampirism spreads across the city, a desperate group of heroes must hunt the ancient evil before it consumes everyone they love.',
      'pdf': 'assets/pdf/dracula.pdf'
    },
    {
      'title': 'Peter and Wendy',
      'author': 'J.M. Barrie',
      'description':
          'One night, a mysterious flying boy who refuses to grow up whisks Wendy Darling and her brothers away to the magical realm of Neverland. It’s a world of fairies, mermaids, and endless adventure—but deadly danger lurks in the shadows. To protect the Lost Boys, Wendy must face the ruthless pirate Captain Hook, all while torn between the allure of eternal childhood and the reality of returning home.',
      'pdf': 'assets/pdf/peter_and_wendy.pdf'
    },
    {
      'title': 'The Adventures of Pinocchio',
      'author': 'Carlo Collodi',
      'description':
          'Carved from an enchanted log, Pinocchio is a mischievous living puppet with a nose that grows with every lie. Desperate to become a real human boy, he abandons his poor creator, Geppetto, and plunges into a world of wild and dangerous misadventures. From being swindled by a cunning Fox and Cat to surviving the belly of a giant shark, Pinocchio must learn the hard way what it truly means to be brave, truthful, and unselfish.',
      'pdf': 'assets/pdf/the_adventures_of_pinocchio.pdf'
    },
    {
      'title': 'Robinson Crusoe',
      'author': 'Daniel Defoe',
      'description':
          'Shipwrecked and the sole survivor on a deserted, untamed island, young Robinson Crusoe faces the ultimate test of human endurance. Stripped of the comforts of civilization, he must battle the elements, starvation, and crushing isolation to stay alive. But as years turn into decades, Crusoe makes a chilling discovery: he is not as alone on the island as he thought. Survival is only the beginning.',
      'pdf': 'assets/pdf/robinson_crusoe.pdf'
    },
    {
      'title': 'The Call of the Wild',
      'author': 'Jack London',
      'description':
          'Snatched from his pampered life in California, Buck, a powerful dog, is thrust into the brutal, freezing hell of the Klondike Gold Rush. Forced to work as a sled dog, he must rely on dormant, primal instincts to survive cruel masters and vicious pack rivals. As the harsh environment strips away his tameness, Buck feels a deep, ancestral awakening. The wild is calling, and he must choose between the world of men and the untamed forest.',
      'pdf': 'assets/pdf/the_call_of_the_wild.pdf'
    },
    {
      'title': 'The Swiss Family Robinson',
      'author': 'Johann David Wyss',
      'description':
          'When a violent storm shatters their ship, a Swiss family of six finds themselves stranded on a lush, uncharted tropical island. Using salvaged cargo and boundless ingenuity, they build a remarkable new life—complete with a magnificent treehouse fortress. But this paradise is filled with strange beasts and unexpected challenges. What started as a desperate fight for survival quickly becomes the grandest adventure of their lives.',
      'pdf': 'assets/pdf/the_swiss_family_robinson.pdf'
    },
    {
      'title': 'Adventures of Huckleberry Finn',
      'author': 'Mark Twain',
      'description':
          'Fleeing a violent father and the stifling rules of civilized society, young Huck Finn fakes his own death and escapes down the mighty Mississippi River. He is soon joined by Jim, a runaway slave desperate to reach free territory. Together on a makeshift raft, the unlikely duo navigates treacherous waters, cunning con artists, and deadly family feuds, forcing Huck to confront everything he ever been taught about right and wrong.',
      'pdf': 'assets/pdf/adventures_of_huckleberry_finn.pdf'
    },
    {
      'title': 'Kidnapped',
      'author': 'Robert Louis Stevenson',
      'description':
          'Betrayed by his greedy uncle and sold into slavery aboard a ship bound for the Americas, young David Balfours future is violently stolen. But a twist of fate brings a fierce, sword-wielding Scottish rebel named Alan Breck Stewart aboard. To survive a shipwreck, evade ruthless soldiers, and reclaim his stolen birthright, David must form an alliance with the outlaw and trek across the treacherous Scottish Highlands.',
      'pdf': 'assets/pdf/kidnapped.pdf'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book List')),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(books[index]['title']!),
            subtitle: Text(books[index]['author']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailScreen(
                    title: books[index]['title']!,
                    author: books[index]['author']!,
                    description: books[index]['description']!,
                    pdfPath: books[index]['pdf']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BookDetailScreen extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  final String pdfPath;

  BookDetailScreen(
      {required this.title,
      required this.author,
      required this.description,
      required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: $title',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Author: $author',
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
            SizedBox(height: 12),
            Text('Description:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text(description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ReadingBookFile(pdfPath: pdfPath, title: title),
                  ),
                );
              },
              child: Text('Read the book'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReadingBookFile extends StatelessWidget {
  final String pdfPath;
  final String title;
  ReadingBookFile({required this.pdfPath, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('membaca $title'),
      ),
      body: SfPdfViewer.asset(pdfPath),
    );
  }
}
