import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keep/constants.dart';
import 'package:keep/screens/home/components/note_card.dart';

import 'package:keep/screens/home/components/rectangular_notch.dart';
import 'package:keep/screens/home/home_controller.dart';
import 'package:keep/screens/home/note_controller.dart';
import 'package:keep/theme/size_config.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// Author : Mohammad
/// 12/10/2021
/// project : keep-clone
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        floatingActionButton: _buildNotchButton(),
        drawer: _buildDrawer(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: _buildBottomNav(),
        body: Builder(
          builder: (context) => Column(
            children: [
              const SizedBox(height: 35),
              _buildSearch(context),
              _buildList()
            ],
          ),
        ));
  }

  Widget _buildList() {
    return Obx(() {
      var controller = Get.find<NoteController>();
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
          child: StaggeredGridView.countBuilder(
            crossAxisCount:
                Get.find<HomeController>().gridDisplay.isTrue ? 2 : 1,
            physics: const BouncingScrollPhysics(),
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            itemCount: controller.myNotes.length + 1,
            itemBuilder: (context, index) {
              if (index == controller.myNotes.length) {
                controller.loadMoreNote();
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return NoteCard(controller.myNotes[index]);
            },
            staggeredTileBuilder: (index) {
              return StaggeredTile.fit(
                  index == controller.myNotes.length ? 2 : 1);
            },
          ),
        ),
      );
    });
  }

  Container _buildSearch(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      height: getProportionateScreenHeight(60),
      margin: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20)),
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(10),
          right: getProportionateScreenWidth(10)),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(33)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black54,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
          SizedBox(
            width: getProportionateScreenWidth(8),
          ),
          const Expanded(
              child: TextField(
            decoration:
                InputDecoration.collapsed(hintText: 'Search your notes'),
          )),
          Obx(() {
            return IconButton(
              icon: Icon(
                Get.find<HomeController>().gridDisplay.isTrue
                    ? Icons.view_agenda_outlined
                    : Icons.grid_view_outlined,
                color: Colors.black54,
              ),
              onPressed: () {
                Get.find<HomeController>().changeDisplay();
              },
            );
          }),
          CircleAvatar(
            radius: getProportionateScreenHeight(20),
            backgroundColor: Colors.orange[100],
            child: Icon(
              Icons.tag_faces,
              color: Colors.orange[600],
            ),
          )
        ],
      ),
    );
  }

  Container _buildNotchButton() {
    return Container(
      margin: const EdgeInsets.only(right: notchGap, bottom: notchGap),
      child: FloatingActionButton(
        elevation: 2,
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              "assets/icons/plus.png",
            )),
        backgroundColor: Colors.grey[100],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(notchShapeRadius)),
        onPressed: () {},
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomAppBar(
      color: Colors.grey[100],
      elevation: 2,
      shape: RectangularNotch(),
      notchMargin: notchMargin,
      child: Row(
        //children inside bottom appbar
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.check_box_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.brush_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.keyboard_voice_outlined,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.image_outlined,
            ),
            onPressed: () {},
          ),
          const Expanded(
            child: FractionallySizedBox(
              widthFactor: 0.4,
            ),
          )
        ],
      ),
    );
  }

  closeDrawer(BuildContext context) => Get.back();

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: FractionallySizedBox(
                      widthFactor: 0.25,
                      child: SvgPicture.asset(
                        "assets/images/Google_logo.svg",
                        fit: BoxFit.scaleDown,
                        height: 25,
                      )),
                ),
              ),
              Text(
                "Keep",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.grey[700], fontSize: 20),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb_outlined),
            title: Text(
              "Notes",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () => closeDrawer(context),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_none_rounded),
            title: Text(
              "Reminders",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () => closeDrawer(context),
          ),
          const Divider(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Labels"),
                Text("Edit"),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.label_outlined),
            title: Text(
              "document",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () => closeDrawer(context),
          ),
          ListTile(
            leading: const Icon(Icons.label_outlined),
            title: Text(
              "grocery",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () => closeDrawer(context),
          ),
          ListTile(
            leading: const Icon(Icons.label_outlined),
            title: Text(
              "market",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () => closeDrawer(context),
          ),
          ListTile(
            leading: const Icon(Icons.label_outlined),
            title: Text(
              "personal",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () => closeDrawer(context),
          ),
          ListTile(
            leading: const Icon(Icons.label_outlined),
            title: Text(
              "programming",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () => closeDrawer(context),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: Text(
              "Create new label",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () => closeDrawer(context),
          ),
          const Divider(
            height: 2,
          ),
          ListTile(
            leading: const Icon(Icons.archive_outlined),
            title: Text(
              "Archive",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () => closeDrawer(context),
          ),
          ListTile(
            leading: const Icon(Icons.delete_outlined),
            title: Text(
              "Trash",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () => closeDrawer(context),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text(
              "Settings",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () => closeDrawer(context),
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: Text(
              "Help & feedback",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () => closeDrawer(context),
          )
        ],
      ),
    );
  }
}
