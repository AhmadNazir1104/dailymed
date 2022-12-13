import 'dart:developer';

import 'package:dailymed/Models/daily_model.dart';
import 'package:dailymed/Provider/homeprovider.dart';
import 'package:dailymed/Utils/app_Images.dart';
import 'package:dailymed/Widgets/custom_text_Widget.dart';
import 'package:dailymed/Widgets/nodata_Widget.dart';
import 'package:dailymed/Widgets/search_textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeProvider homeProvider;
  @override
  void initState() {
    
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: text(
          text: "Dailymed",
          size: 12.sp,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.w),
        child: SingleChildScrollView(
          child: Consumer<HomeProvider>(
            builder: (context, prov, child) {
              return prov.dataList.isEmpty
                  // ignore: prefer_const_constructors
                  ? Center(
                      child: const CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        TextFormField(
                            controller: homeProvider.searchController,
                            autofocus: true,
                            onChanged: ((value) {
                              if (homeProvider.searchController.text == "") {
                                log("");
                              }
                              if (homeProvider.searchController.text == " ") {
                                log("");
                              } else {
                                homeProvider.serachFunction(
                                    homeProvider.searchController.text);
                              }
                            }),
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.search,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 13.r, horizontal: 15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.r),
                                  ),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.r),
                                  ),
                                  borderSide: BorderSide.none),
                              hintText: "Search Data .....",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.sp,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                            )),
                        prov.searchController.text.isEmpty
                            ? NoDataWidget(
                                textVal: '',
                                imageVal: AppImages.searchdataImage,
                              )
                            : prov.searchdataList.isEmpty
                                ? NoDataWidget(
                                    textVal: 'No Data Found',
                                    imageVal: AppImages.nodataImage,
                                  )
                                : SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      itemCount: prov.searchdataList.isEmpty
                                          ? 0
                                          : prov.searchdataList.length,
                                      itemBuilder: (BuildContext context, i) {
                                        DataModel cate = prov.searchdataList[i];
                                        return SeachTextWidget(
                                            child: cate.title);
                                      },
                                    ),
                                  ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
