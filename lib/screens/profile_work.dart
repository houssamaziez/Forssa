import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forssa/screens/screen_start.dart';
import 'package:forssa/screens/var.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileWORK extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final pos, image, title, details, location;

  const ProfileWORK(
      {Key? key,
      this.pos,
      this.image,
      this.title,
      this.details,
      required this.location})
      : super(key: key);

  @override
  State<ProfileWORK> createState() => _ProfileWORKState();
}

class _ProfileWORKState extends State<ProfileWORK> {
  final TextEditingController numberCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
    numberCtrl.text = "085921191121";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Hero(
                    tag: widget.pos,
                    child: Container(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25)),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: widget.image,
                          placeholder: (context, url) => spinkit,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.4,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Spacer(),
                    const Spacer(),
                    Text(
                      widget.title,
                      style: GoogleFonts.ramaraja(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border)),
                    ),
                  ],
                ),
                ListTile(
                  subtitle: Text(
                    widget.details,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.bungalow_outlined,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Name of campany".tr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Company".tr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.pin_drop_rounded,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Location".tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      widget.location.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.timelapse_outlined,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Time".tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      " 17:00 / 22:00",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.monetization_on,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Price".tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      "140 \$",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                      color: Colors.red,
                    ),
                    title: Text(
                      "phone number".tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      "0523894289342 , 0723984238423",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //  BOTUN GO TO WORK
                MaterialButton(
                  onPressed: () async {
                    launch('tel:+0348304834983945');
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: color2,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7))),
                      height: 50,
                      width: double.infinity,
                      child: Center(child: Text("Call me".tr))),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
