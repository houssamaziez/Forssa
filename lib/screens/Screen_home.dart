// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:forssa/Model/works.dart';
import 'package:forssa/screens/profile_work.dart';
import 'package:forssa/screens/screen_start.dart';
import 'package:forssa/screens/screen_stg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:selection_menu/selection_menu.dart';

import '../Model/list_app.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

String dropdownvalue = 'alger';

class _ScreenHomeState extends State<ScreenHome> {
  int indextwilaya = 0;
  var listwork;
  @override
  Widget build(BuildContext context) {
    listwork = listworkd
        // ignore: prefer_if_null_operators
        .where((element) =>
            element["wilaya"] ==
            (wlaya.read("wlaya") == null ? dropdownvalue : wlaya.read("wlaya")))
        .toList();
    return ListView(
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Search'.tr,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(20))),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 150,
          width: double.infinity,
          child: Swiper(
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Container(
                    height: 200,
                    child: CachedNetworkImage(
                      fit: BoxFit.fitWidth,
                      imageUrl: listpub[index],
                      placeholder: (context, url) => spinkit,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    width: double.infinity,
                  ),
                ),
              );
            },
            index: listpub.length,
            itemCount: listpub.length,
            itemWidth: MediaQuery.of(context).size.width - 2 * 45,
            layout: SwiperLayout.STACK,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 20, bottom: 10, top: 10, right: 20),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  "All services available".tr,
                  style: GoogleFonts.fredokaOne(
                    fontSize: 20,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 0.24,
                child: DropdownButton(
                  disabledHint: Container(),
                  isExpanded: true,
                  items: wilayat.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // ignore: prefer_if_null_operators
                  value: wlaya.read("wlaya") == null
                      ? dropdownvalue
                      : wlaya.read("wlaya"),
                  icon: const Icon(Icons.pin_drop_rounded),
                  onChanged: (value) {
                    setState(() {
                      dropdownvalue = value.toString();
                      wlaya.write("wlaya", value);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        //  list of grid jop
        listcardjop(context),
      ],
    );
  }

  listcardjop(BuildContext context) {
    return AnimationLimiter(
      child: GridView.count(
        childAspectRatio: (0.77),
        controller: ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        children: List.generate(listwork.length, (index) {
          return AnimationConfiguration.staggeredList(
              duration: const Duration(milliseconds: 700),
              position: index,
              child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(child: cardjop(index, context))));
        }),
      ),
    );
  }

  cardjop(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Get.to(ProfileWORK(
            location: listwork[index]["wilaya"].toString(),
            pos: index,
            details: listwork[index]["ditails"].toString(),
            image: listwork[index]["urlimage"].toString(),
            title: listwork[index]["title"].toString(),
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
                  height: 130,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: listwork[index]["urlimage"].toString(),
                      placeholder: (context, url) => spinkit,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  listwork[index]["title"].toString(),
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
                        listwork[index]["wilaya"].toString(),
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
                                listwork[index]["id"].toString(),
                              );

                              if (c == true) {
                                int c = listfavoriid
                                    .indexOf(listwork[index]["id"].toString());
                                listfavoriid
                                    .remove(listwork[index]["id"].toString());
                                listfavori.removeAt(c);
                              } else {
                                listfavori.addNonNull(
                                  {
                                    "title":
                                        listwork[index]["title"].toString(),
                                    "ditails":
                                        listwork[index]["ditails"].toString(),
                                    "urlimage":
                                        listwork[index]["urlimage"].toString(),
                                    "id": listwork[index]["id"].toString(),
                                    "date": listwork[index]["date"].toString(),
                                    "wilaya":
                                        listwork[index]["wilaya"].toString(),
                                  },
                                );

                                listfavoriid
                                    .add(listwork[index]["id"].toString());
                              }
                            });
                          },
                          icon: listfavoriid.contains(
                                    listwork[index]["id"].toString(),
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
