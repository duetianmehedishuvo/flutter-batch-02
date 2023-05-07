import 'package:flutter/material.dart';
import 'package:hello_world/add_contact_screen.dart';
import 'package:hello_world/database/pages/add_employee_screens.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {required this.title,
      this.fromContactListScreen = false,
      this.goForAddEmployeeScreen = false,
      this.isWorkForFunction = false,
      this.function,
      this.isShowBackButton = true,
      Key? key})
      : super(key: key);

  final String title;
  final bool fromContactListScreen;
  final bool isShowBackButton;
  final bool goForAddEmployeeScreen;
  final bool isWorkForFunction;
  final Function? function;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.maxFinite, 53);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.isShowBackButton
          ? IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back))
          : SizedBox.shrink(),
      title: Text(widget.title),
      actions: [
        widget.isWorkForFunction
            ? InkWell(
                onTap: () {
                  widget.function!();
                },
                child: Text('Click'))
            : SizedBox(),
        widget.fromContactListScreen
            ? IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddContactScreen()));
                },
                icon: Icon(Icons.add))
            : widget.goForAddEmployeeScreen
                ? IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddEmployeeScreen())).then((value) {
                        print('shuvo   a a a  a a a $value');

                        if (value == 1) {
                          setState(() {});
                        }
                      });
                    },
                    icon: Icon(Icons.add))
                : SizedBox.shrink()
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 53);
}

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar2({required this.title, this.fromContactListScreen = false, this.isShowBackButton = true, this.height = 80, Key? key})
      : super(key: key);

  final String title;
  final bool fromContactListScreen;
  final bool isShowBackButton;
  final double height;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(double.maxFinite, height),
      child: Container(
        height: height,
        padding: EdgeInsets.only(top: 20, left: 20, right: 10),
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isShowBackButton
                ? IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.white))
                : SizedBox.shrink(),
            Expanded(child: Text(title, style: TextStyle(color: Colors.white))),
            fromContactListScreen
                ? IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddContactScreen()));
                    },
                    icon: Icon(Icons.add, color: Colors.white))
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, height);
}
