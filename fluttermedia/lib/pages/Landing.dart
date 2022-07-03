import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final controller = TextEditingController();
  final decorationTextField = InputDecoration(
      hintText: 'Whats on your Mind',
      hintStyle: GoogleFonts.alice(color: Colors.grey),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'MyMedia',
                      style: GoogleFonts.ubuntu(
                          color: Colors.blueAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      controller: controller,
                      decoration: decorationTextField,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 175,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Card(
                          child: Container(
                            height: 175,
                            width: 125,
                            color: Colors.grey,
                            child: Center(
                                child: CircleAvatar(
                              child: Icon(Icons.add),
                              backgroundColor: Colors.white,
                            )),
                          ),
                        ),
                        StoryCard()
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'New Posts',
                        style: GoogleFonts.alice(
                            color: Colors.blueAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(children: [
                    PostsCard(),
                    PostsCard(),
                  ])
                ],
              ),
            ),
          ),
        ));
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(height: 175, width: 125, color: Colors.grey),
    );
  }
}

class PostsCard extends StatelessWidget {
  const PostsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Code Addict',
                    style: GoogleFonts.alice(color: Colors.grey))
              ],
            ),
            Divider(),
            Text(
              'Walking the Dog',
              style: GoogleFonts.alice(),
              textAlign: TextAlign.left,
            ),
            Image.network(
                'https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  child: Icon(Icons.favorite),
                  onPressed: () {},
                ),
                MaterialButton(
                  child: Icon(Icons.comment),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
