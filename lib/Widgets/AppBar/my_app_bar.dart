import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({super.key, this.title, this.bellOnTap, this.size});
  String? title;
  void Function()? bellOnTap;
  var size;
  @override
  // Define the preferred size here
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      toolbarHeight: size,
      title: Text(
        title!,
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500, fontSize: 18.sp, color: Colors.white),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[Color(0xff23c2ea), Color(0xff792efd)],
          ),
        ),
      ),
      // actions: [
      //   GestureDetector(
      //     onTap: bellOnTap,
      //     child: Container(
      //         margin: const EdgeInsets.only(right: 30).r,
      //         child: SvgPicture.asset('assets/images/bellicon.svg')),
      //   )
      // ],
    );
  }
}
