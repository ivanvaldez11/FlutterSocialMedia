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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'MyMedia',
                          style: GoogleFonts.ubuntu(
                              color: Colors.blueAccent,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.person,
                              color: Colors.blueAccent,
                            ))
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
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
                                child: InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                child: Icon(Icons.add),
                                backgroundColor: Colors.white,
                              ),
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
                  Column(children: const [
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
      child: Container(
        height: 175,
        width: 125,
        color: Colors.grey,
      ),
    );
  }
}

class PostsCard extends StatefulWidget {
  final onLike;
  final postId;
  const PostsCard({Key? key, this.onLike, this.postId}) : super(key: key);

  @override
  State<PostsCard> createState() => _PostsCardState();
}

class _PostsCardState extends State<PostsCard> {
  bool like = false;
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
            const Divider(),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Walking the Dog',
              style: GoogleFonts.alice(),
              textAlign: TextAlign.left,
            ),
            Image.network(
                'https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  child: like == false
                      ? Icon(Icons.favorite_border_outlined)
                      : Icon(Icons.favorite),
                  onPressed: () {
                    setState(() {
                      like = like == false ? true : false;
                    });
                    widget.onLike;
                  },
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
