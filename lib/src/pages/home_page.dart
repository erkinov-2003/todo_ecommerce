import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_ecommerce/src/common/constants/app_icons.dart';
import 'package:todo_ecommerce/src/pages/details_page.dart';
import 'package:todo_ecommerce/src/pages/todo_page.dart';
import 'package:todo_ecommerce/src/view/custom_button.dart';
import 'package:todo_ecommerce/src/view/custom_drawer.dart';
import 'package:todo_ecommerce/src/view/delete_dialog.dart';

import '../common/constants/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool values = true;
  final _firebaseReadData =
      FirebaseFirestore.instance.collection("todo_ecommerce").snapshots();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void navigationPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TodoPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 15, bottom: 30),
        child: FloatingActionButton(
          backgroundColor: AppColors.yellowColor,
          onPressed: navigationPage,
          child: const Image(
            image: AssetImage(AppIcons.addIcons),
            color: Colors.black,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
      ),
      endDrawer: const CustomDrawer(),
      body: StreamBuilder(
        stream: _firebaseReadData,
        builder: (context, snapshot) {
          var docs = snapshot.data?.docs;
          if (snapshot.hasError) {
            return const Text("snapshots error hasdata");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Notes",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF0096c7),
                                fontFamily: "OverlockSC",
                              ),
                        ),
                        Builder(builder: (context) {
                          return CustomButton(
                            images: AppIcons.personIcons,
                            backgroundColor: const Color(0xFF3c096c),
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                          );
                        }),
                      ],
                    ),
                    SizedBox(height: size.height * 0.035),
                    Expanded(
                      child: SizedBox(
                        height: size.height * 0.708,
                        child: ListView.builder(
                          itemCount: docs?.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final indexDocs = docs?[index];
                            final docsIndex = indexDocs?.id;
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPage(
                                            title: indexDocs?["title"],
                                            description:
                                                indexDocs?["description"],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      color: const Color(0xFF184e77),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        side: BorderSide(
                                          color: Colors.white,
                                          width: 0.5,
                                        ),
                                      ),
                                      child: SizedBox(
                                        height: size.height * 0.106,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 10, right: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                indexDocs?["title"],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                height: size.height * 0.011,
                                              ),
                                              Text(
                                                indexDocs?["description"],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                      color: const Color(
                                                          0xFFccff33),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    onLongPress: () =>
                                        deleteDialog(context, docsIndex!),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
