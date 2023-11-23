import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_ecommerce/src/common/constants/app_icons.dart';
import 'package:todo_ecommerce/src/pages/todo_page.dart';
import 'package:todo_ecommerce/src/view/custom_button.dart';
import 'package:todo_ecommerce/src/view/custom_drawer.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundsColor,
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
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "OverlockSC",
                              ),
                        ),
                        Builder(builder: (context) {
                          return CustomButton(
                            images: AppIcons.menuIcons,
                            backgroundColor: AppColors.buttonColor,
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: SizedBox(
                        height: 600,
                        child: ListView.builder(
                          itemCount: docs?.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final indexDocs = docs?[index];

                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
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
                                      height: 90,
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
                                                    color: AppColors.whiteColor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              indexDocs?["description"],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .copyWith(
                                                    color:
                                                        const Color(0xFFccff33),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
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
