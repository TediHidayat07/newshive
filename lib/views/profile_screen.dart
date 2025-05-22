import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newshive/views/utils/helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset('assets/images/Meliuk-liuk.png'),
              Text('Data Diri', style: headline4),
              vsTiny,
            ],
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  'Profil',
                  style: headline3.copyWith(color: cPrimary, fontWeight: bold),
                ),
                vsTiny,
                Container(
                  padding: REdgeInsets.all(12.0),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: cWhite,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundColor: cGrey,
                          radius: 70.r,
                          backgroundImage: AssetImage(
                            'assets/images/news logo.png',
                          ),
                        ),
                      ),
                      vsSmall,
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('Name', style: subtitle1),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              ': Theresa Web',
                              style: subtitle1.copyWith(fontWeight: semibold),
                            ),
                          ),
                        ],
                      ),
                      vsTiny,
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('Email', style: subtitle1),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              ': theresa_we@gmail.com',
                              style: subtitle1.copyWith(fontWeight: semibold),
                            ),
                          ),
                        ],
                      ),
                      vsTiny,
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('Number', style: subtitle1),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              ': 089876543210',
                              style: subtitle1.copyWith(fontWeight: semibold),
                            ),
                          ),
                        ],
                      ),
                      vsTiny,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('Address', style: subtitle1),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              ': Jl. Cangkring Raya, Maleer, Kec. Batununggal, Kota Bandung, Jawa Barat',
                              style: subtitle1.copyWith(fontWeight: semibold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                vsLarge,
                ListTile(
                  onTap: () {
                    log('Edit Profile onTap');
                  },
                  leading: Icon(Icons.border_color_outlined, color: cBlack),
                  title: Text(
                    'Edit Profile',
                    style: subtitle1.copyWith(fontWeight: semibold),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: cBlack,
                  ),
                ),
                Divider(color: cBlack, height: 4.0),
                ListTile(
                  onTap: () {
                    log('Edit Password onTap');
                  },
                  leading: Icon(Icons.password, color: cBlack),
                  title: Text(
                    'Edit Password',
                    style: subtitle1.copyWith(fontWeight: semibold),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: cBlack,
                  ),
                ),
                Divider(color: cBlack, height: 4.0),
                ListTile(
                  onTap: () {
                    log('Logout onTap');
                  },
                  leading: Icon(Icons.logout_rounded, color: cBlack),
                  title: Text(
                    'Logout',
                    style: subtitle1.copyWith(fontWeight: semibold),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: cBlack,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
