import 'dart:convert';

class DailymedModel {
  MetadataModel? autherDetails;
  List<DataModel>? datamodel;
  DailymedModel({
    this.autherDetails,
    this.datamodel,
  });

  factory DailymedModel.fromJson(Map<String, dynamic> parse) {
    List datalistModel = parse['data'] as List;

    List<DataModel>? dModelData =
        datalistModel.map((e) => DataModel.fromJson(e)).toList();
    return DailymedModel(
      autherDetails: MetadataModel.fromJson(parse['metadata']),
      datamodel: dModelData,
    );
  }
}

class MetadataModel {
  String? dbpublisheddate;
  int? elementsperpage;
  String? currentUrl;
  String? nextPageUrl;
  int? totalElements;
  int? totalPages;
  int? currentPage;
  var previousPage;
  String? previousPageUrl;
  int? nextPage;

  MetadataModel({
    this.dbpublisheddate,
    this.elementsperpage,
    this.currentUrl,
    this.nextPageUrl,
    this.totalElements,
    this.currentPage,
    this.previousPage,
    this.previousPageUrl,
    this.nextPage,
    this.totalPages,
  });
  factory MetadataModel.fromJson(Map<String, dynamic> json) {
    return MetadataModel(
      dbpublisheddate: json['db_published_date'],
      elementsperpage: json['elements_per_page'],
      currentUrl: json['current_url'],
      nextPageUrl: json['next_page_url'],
      totalElements: json['total_elements'],
      totalPages: json['total_pages'],
      currentPage: json['current_page'],
      previousPage: json['previous_page'],
      previousPageUrl: json['previous_page_url'],
      nextPage: json['next_page'],
    );
  }
}

class DataModel {
  int? splversion;
  String? publisheddate;
  String? title;
  String? setid;

  DataModel({
    this.splversion,
    this.publisheddate,
    this.title,
    this.setid,
  });

  factory DataModel.fromJson(Map<String, dynamic> pase) {
    return DataModel(
      splversion: pase['spl_version'],
      publisheddate: pase['published_date'],
      title: pase['title'],
      setid: pase['setid'],
    );
  }
}
