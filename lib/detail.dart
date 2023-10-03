import 'package:kuis/pokemon_data.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  const HalamanDetail({super.key, required this.data});
  final PokemonData data;

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isFavorite = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  String text = "";
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                  if (isFavorite == false) {
                    text = "Berhasil menambahkan ke favorite";
                  } else {
                    text = "Berhasil dihapus dari favorite";
                  }
                  var snackBar = SnackBar(
                    content: Text(text),
                    backgroundColor: (isFavorite) ? Colors.red : Colors.green,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: (isFavorite)
                    ? Icon(Icons.favorite_border_outlined)
                    : Icon(Icons.favorite),
              ),
              // IconButton(onPressed: () {}, icon: Icon(Icons.share))
            ],
          ),
        ],
        backgroundColor: Colors.deepOrange[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                _launchUrl(widget.data.image);
              },
              child: Container(
                child: Image.network(widget.data.image),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.data.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Text(
                        //   " - ${widget.data.weakness}",
                        //   style: TextStyle(
                        //       fontSize: 24,
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.grey[700]),
                        // )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Type",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.data.type[0],
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Weakness",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.data.weakness.join(', '),
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Previous Evolution",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.data.prevEvolution.join(', '),
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Next Evolution",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.data.nextEvolution.join(', '),
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        _launchUrl(widget.data.wikiUrl);
                      },
                      child: Icon(Icons.search),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception("Gagal membuka Url : ${_url}");
    }
  }
}
