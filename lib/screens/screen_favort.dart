import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forssa/Model/list_app.dart';
import 'package:forssa/Model/works.dart';
import 'package:forssa/screens/profile_work.dart';
import 'package:forssa/screens/screen_start.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Screenfavort extends StatefulWidget {
  const Screenfavort({
    Key? key,
  }) : super(key: key);

  @override
  State<Screenfavort> createState() => _ScreenfavortState();
}

class _ScreenfavortState extends State<Screenfavort> {
  @override
  Widget build(BuildContext context) {
    return listfavori.isEmpty
        ? Container(
            color: Colors.white,
            child: Center(
              child: Image.asset(
                "images/Favorite.gif",
                height: double.infinity,
              ),
            ),
          )
        : GridView.count(
            childAspectRatio: (0.780),
            controller: ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            children: List.generate(listfavori.length, (index) {
              return cardjop(index, context);
            }),
          );
  }

  cardjop(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Get.to(ProfileWORK(
            id: listfavori[index]["id"].toString(),
            location: listfavori[index]["wilaya"].toString(),
            pos: index,
            details: listfavori[index]["ditails"].toString(),
            image: listfavori[index]["urlimage"].toString(),
            title: listfavori[index]["title"].toString(),
          ));
        },
        child: Card(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: index,
                child: Container(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: listfavori[index]["urlimage"].toString(),
                      placeholder: (context, url) => spinkit,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  height: 130,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  listfavori[index]["title"].toString(),
                  style: GoogleFonts.ramaraja(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    children: [
                      const Icon(Icons.pin_drop_outlined),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        listfavori[index]["wilaya"].toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              var c = listfavoriid.contains(
                                listfavori[index]["id"].toString(),
                              );

                              if (c == true) {
                                int c = listfavoriid.indexOf(
                                    listfavori[index]["id"].toString());
                                listfavoriid
                                    .remove(listfavori[index]["id"].toString());
                                listfavori.removeAt(c);
                              } else {
                                listfavori.addNonNull(
                                  {
                                    "title":
                                        listfavori[index]["title"].toString(),
                                    "ditails":
                                        listfavori[index]["ditails"].toString(),
                                    "urlimage": listfavori[index]["urlimage"]
                                        .toString(),
                                    "id": listfavori[index]["id"].toString(),
                                    "date":
                                        listfavori[index]["date"].toString(),
                                    "wilaya":
                                        listfavori[index]["wilaya"].toString(),
                                  },
                                );

                                listfavoriid
                                    .add(listfavori[index]["id"].toString());
                              }
                            });
                            listfavorstorageg.write("listid", listfavoriid);
                            listfavorstorageg.write("listfavori", listfavori);
                          },
                          icon: listfavoriid.contains(
                                    listfavori[index]["id"].toString(),
                                  ) ==
                                  true
                              ? const Icon(
                                  Icons.favorite_outlined,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                )),
                    ],
                  )),
              const SizedBox(
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
