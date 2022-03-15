import 'package:flutter/material.dart';
import 'package:forssa/screens/var.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                      width: double.infinity,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 60,
                      backgroundImage:
                          NetworkImage(user.read("image").toString()),
                    ),
                    Text(
                      user.read("username").toString(),
                      style: GoogleFonts.lato(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                      width: double.infinity,
                    ),
                    Text(user.read("email").toString()),
                    const SizedBox(
                      height: 10,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: const Text(
                      'title of skills',
                    ),
                    subtitle: const Text(
                        "ejze fzje fzjef zejf zoeflz eflze jfkzej fzkej f"),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.edit)),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Card(
                  child: MaterialButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                          isScrollControlled: true,
                          isDismissible: true,
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: ListView(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Add skills".tr,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text("Name skills".tr),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder())),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text("details of skill".tr),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        maxLines: 5,
                                        onChanged: (vul) {},
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          filled: true,
                                          isDense: true,
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            borderSide: BorderSide(
                                                width: 1, color: Colors.red),
                                          ),
                                          border: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 5,
                                          )),
                                          hintText: "Add details of skills".tr,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Card(
                                        color: color2,
                                        child: MaterialButton(
                                          onPressed: () {},
                                          child: Text("Add skills".tr),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 270,
                                    )
                                  ],
                                ));
                          });
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('Add skills'.tr)
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
