import 'package:flutter/material.dart';
import 'package:kuis/detail.dart';
import 'package:kuis/pokemon_data.dart';

class halamanutama extends StatelessWidget {
  const halamanutama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pokedex",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange[700],
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
          ),
          itemCount: listPokemon.length,
          itemBuilder: (context, index) {
            final PokemonData data = listPokemon[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HalamanDetail(data: data);
                }));
              },
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        data.image,
                        width: 460,
                        height: 200,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.name,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.more_horiz_outlined)
                            ],
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Icon(
                          //       Icons.location_pin,
                          //       color: Colors.blue,
                          //     ),
                          //     Text("data.weakness"),
                          //     Text(
                          //       " - ${data.prevEvolution} (${data.nextEvolution})",
                          //       style: TextStyle(color: Colors.grey),
                          //     )
                          //   ],
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Klik gambar untuk melihat detail",
                            style: TextStyle(
                                color: Colors.indigo[900], fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
