//     final informationModel = informationModelFromJson(jsonString);

import 'dart:convert';

InformationModel informationModelFromJson(String str) => InformationModel.fromJson(json.decode(str));

String informationModelToJson(InformationModel data) => json.encode(data.toJson());

class InformationModel {
  InformationModel({
    this.isStatePlaintiffCase,
    this.statePlaintiffCaseDescription,
    this.victimName,
    this.ageInYear,
    this.mobileNo,
    this.districtId,
    this.upazillaId,
    this.unionId,
    this.persecutionDateAndTime,
    this.victimAddress,
    this.informationSource,
    this.needImmediateFacilitation,
    this.needIntermediateFacilitation,
    this.needLongTermFacilitation,
    this.occurancePlaceId,
    this.occurancePlaceSpecification,
    this.hasAnyDisabilities,
    this.disabilityId,
    this.otherDisabilityName,
    this.mothersName,
    this.fathersName,
    this.husbandName,
    this.nidNo,
    this.birthCertificateNo,
    this.haveTreatmentCertificate,
    this.maritalStatusId,
    this.numberOfChild,
    this.torturerName,
    this.torturerGenderId,
    this.torturerOtherGenderName,
    this.torturerOccupationId,
    this.torturerOtherOccupationName,
    this.torturerMaritalStatusId,
    this.numberOfTorturer,
    this.torturerRelationWithVictimId,
    this.torturerOtherRelationName,
    this.torturerCurrentLocationId,
    this.torturerOtherCurrentLocationName,
    this.torturerDistrictId,
    this.torturerUpazillaId,
    this.torturerUnionId,
    this.torturerAddress,
    this.persecutionDescriptionList,
    this.persecutionReasonList,
    this.immediateFacilitationList,
    this.intermediateFacilitationList,
    this.longTermFacilitationList,
    this.relatedDocumentList,
  });

  bool? isStatePlaintiffCase;
  String? statePlaintiffCaseDescription;
  String? victimName;
  int? ageInYear;
  String? mobileNo;
  int? districtId;
  int? upazillaId;
  int? unionId;
  String? persecutionDateAndTime;
  String? victimAddress;
  String? informationSource;
  bool? needImmediateFacilitation;
  bool? needIntermediateFacilitation;
  bool? needLongTermFacilitation;
  int? occurancePlaceId;
  String? occurancePlaceSpecification;
  bool? hasAnyDisabilities;
  int? disabilityId;
  String? otherDisabilityName;
  String? mothersName;
  String? fathersName;
  String? husbandName;
  String? nidNo;
  String? birthCertificateNo;
  bool? haveTreatmentCertificate;
  int? maritalStatusId;
  int? numberOfChild;
  String? torturerName;
  int? torturerGenderId;
  String? torturerOtherGenderName;
  int? torturerOccupationId;
  String? torturerOtherOccupationName;
  int? torturerMaritalStatusId;
  int? numberOfTorturer;
  int? torturerRelationWithVictimId;
  String? torturerOtherRelationName;
  int? torturerCurrentLocationId;
  String? torturerOtherCurrentLocationName;
  int? torturerDistrictId;
  int? torturerUpazillaId;
  int? torturerUnionId;
  String? torturerAddress;
  List<PersecutionDescriptionList>? persecutionDescriptionList;
  List<PersecutionReasonList>? persecutionReasonList;
  List<ImmediateFacilitationList>? immediateFacilitationList;
  List<int>? intermediateFacilitationList;
  List<LongTermFacilitationList>? longTermFacilitationList;
  List<RelatedDocumentList>? relatedDocumentList;

  factory InformationModel.fromJson(Map<String, dynamic> json) => InformationModel(
        isStatePlaintiffCase: json["IsStatePlaintiffCase"],
        statePlaintiffCaseDescription: json["StatePlaintiffCaseDescription"],
        victimName: json["VictimName"],
        ageInYear: json["AgeInYear"],
        mobileNo: json["MobileNo"],
        districtId: json["DistrictId"],
        upazillaId: json["UpazillaId"],
        unionId: json["UnionId"],
        persecutionDateAndTime: json["PersecutionDateAndTime"],
        victimAddress: json["VictimAddress"],
        informationSource: json["InformationSource"],
        needImmediateFacilitation: json["NeedImmediateFacilitation"],
        needIntermediateFacilitation: json["NeedIntermediateFacilitation"],
        needLongTermFacilitation: json["NeedLongTermFacilitation"],
        occurancePlaceId: json["OccurancePlaceId"],
        occurancePlaceSpecification: json["OccurancePlaceSpecification"],
        hasAnyDisabilities: json["HasAnyDisabilities"],
        disabilityId: json["DisabilityId"],
        otherDisabilityName: json["OtherDisabilityName"],
        mothersName: json["MothersName"],
        fathersName: json["FathersName"],
        husbandName: json["HusbandName"],
        nidNo: json["NidNo"],
        birthCertificateNo: json["BirthCertificateNo"],
        haveTreatmentCertificate: json["HaveTreatmentCertificate"],
        maritalStatusId: json["MaritalStatusId"],
        numberOfChild: json["NumberOfChild"],
        torturerName: json["TorturerName"],
        torturerGenderId: json["TorturerGenderId"],
        torturerOtherGenderName: json["TorturerOtherGenderName"],
        torturerOccupationId: json["TorturerOccupationId"],
        torturerOtherOccupationName: json["TorturerOtherOccupationName"],
        torturerMaritalStatusId: json["TorturerMaritalStatusId"],
        numberOfTorturer: json["NumberOfTorturer"],
        torturerRelationWithVictimId: json["TorturerRelationWithVictimId"],
        torturerOtherRelationName: json["TorturerOtherRelationName"],
        torturerCurrentLocationId: json["TorturerCurrentLocationId"],
        torturerOtherCurrentLocationName: json["TorturerOtherCurrentLocationName"],
        torturerDistrictId: json["TorturerDistrictId"],
        torturerUpazillaId: json["TorturerUpazillaId"],
        torturerUnionId: json["TorturerUnionId"],
        torturerAddress: json["TorturerAddress"],
        persecutionDescriptionList: List<PersecutionDescriptionList>.from(json["PersecutionDescriptionList"].map((x) => PersecutionDescriptionList.fromJson(x))),
        persecutionReasonList: List<PersecutionReasonList>.from(json["PersecutionReasonList"].map((x) => PersecutionReasonList.fromJson(x))),
        immediateFacilitationList: List<ImmediateFacilitationList>.from(json["ImmediateFacilitationList"].map((x) => ImmediateFacilitationList.fromJson(x))),
        intermediateFacilitationList: List<int>.from(json["IntermediateFacilitationList"].map((x) => x)),
        longTermFacilitationList: List<LongTermFacilitationList>.from(json["LongTermFacilitationList"].map((x) => LongTermFacilitationList.fromJson(x))),
        relatedDocumentList: List<RelatedDocumentList>.from(json["RelatedDocumentList"].map((x) => RelatedDocumentList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "IsStatePlaintiffCase": isStatePlaintiffCase,
        "StatePlaintiffCaseDescription": statePlaintiffCaseDescription,
        "VictimName": victimName,
        "AgeInYear": ageInYear,
        "MobileNo": mobileNo,
        "DistrictId": districtId,
        "UpazillaId": upazillaId,
        "UnionId": unionId,
        "PersecutionDateAndTime": persecutionDateAndTime,
        "VictimAddress": victimAddress,
        "InformationSource": informationSource,
        "NeedImmediateFacilitation": needImmediateFacilitation,
        "NeedIntermediateFacilitation": needIntermediateFacilitation,
        "NeedLongTermFacilitation": needLongTermFacilitation,
        "OccurancePlaceId": occurancePlaceId,
        "OccurancePlaceSpecification": occurancePlaceSpecification,
        "HasAnyDisabilities": hasAnyDisabilities,
        "DisabilityId": disabilityId,
        "OtherDisabilityName": otherDisabilityName,
        "MothersName": mothersName,
        "FathersName": fathersName,
        "HusbandName": husbandName,
        "NidNo": nidNo,
        "BirthCertificateNo": birthCertificateNo,
        "HaveTreatmentCertificate": haveTreatmentCertificate,
        "MaritalStatusId": maritalStatusId,
        "NumberOfChild": numberOfChild,
        "TorturerName": torturerName,
        "TorturerGenderId": torturerGenderId,
        "TorturerOtherGenderName": torturerOtherGenderName,
        "TorturerOccupationId": torturerOccupationId,
        "TorturerOtherOccupationName": torturerOtherOccupationName,
        "TorturerMaritalStatusId": torturerMaritalStatusId,
        "NumberOfTorturer": numberOfTorturer,
        "TorturerRelationWithVictimId": torturerRelationWithVictimId,
        "TorturerOtherRelationName": torturerOtherRelationName,
        "TorturerCurrentLocationId": torturerCurrentLocationId,
        "TorturerOtherCurrentLocationName": torturerOtherCurrentLocationName,
        "TorturerDistrictId": torturerDistrictId,
        "TorturerUpazillaId": torturerUpazillaId,
        "TorturerUnionId": torturerUnionId,
        "TorturerAddress": torturerAddress,
        "PersecutionDescriptionList": List<dynamic>.from(persecutionDescriptionList!.map((x) => x.toJson())),
        "PersecutionReasonList": List<dynamic>.from(persecutionReasonList!.map((x) => x.toJson())),
        "ImmediateFacilitationList": List<dynamic>.from(immediateFacilitationList!.map((x) => x.toJson())),
        "IntermediateFacilitationList": List<dynamic>.from(intermediateFacilitationList!.map((x) => x)),
        "LongTermFacilitationList": List<dynamic>.from(longTermFacilitationList!.map((x) => x.toJson())),
        "RelatedDocumentList": List<dynamic>.from(relatedDocumentList!.map((x) => x.toJson())),
      };
}

class ImmediateFacilitationList {
  ImmediateFacilitationList({
    this.immediateFaciliationId,
    this.specification,
  });

  int? immediateFaciliationId;
  String? specification;

  factory ImmediateFacilitationList.fromJson(Map<String, dynamic> json) => ImmediateFacilitationList(
        immediateFaciliationId: json["ImmediateFaciliationId"],
        specification: json["Specification"],
      );

  Map<String, dynamic> toJson() => {
        "ImmediateFaciliationId": immediateFaciliationId,
        "Specification": specification,
      };
}

class LongTermFacilitationList {
  LongTermFacilitationList({
    this.longTermFaciliationId,
    this.specification,
  });

  int? longTermFaciliationId;
  String? specification;

  factory LongTermFacilitationList.fromJson(Map<String, dynamic> json) => LongTermFacilitationList(
        longTermFaciliationId: json["LongTermFaciliationId"],
        specification: json["Specification"],
      );

  Map<String, dynamic> toJson() => {
        "LongTermFaciliationId": longTermFaciliationId,
        "Specification": specification,
      };
}

class PersecutionDescriptionList {
  PersecutionDescriptionList({
    this.descriptionId,
    this.specification,
  });

  int? descriptionId;
  String? specification;

  factory PersecutionDescriptionList.fromJson(Map<String, dynamic> json) => PersecutionDescriptionList(
        descriptionId: json["DescriptionId"],
        specification: json["Specification"],
      );

  Map<String, dynamic> toJson() => {
        "DescriptionId": descriptionId,
        "Specification": specification,
      };
}

class PersecutionReasonList {
  PersecutionReasonList({
    this.reasonId,
    this.specification,
  });

  int? reasonId;
  String? specification;

  factory PersecutionReasonList.fromJson(Map<String, dynamic> json) => PersecutionReasonList(
        reasonId: json["ReasonId"],
        specification: json["Specification"],
      );

  Map<String, dynamic> toJson() => {
        "ReasonId": reasonId,
        "Specification": specification,
      };
}

class RelatedDocumentList {
  RelatedDocumentList({
    this.documentTypeId,
    this.uploadedFile,
  });

  int? documentTypeId;
  UploadedFile? uploadedFile;

  factory RelatedDocumentList.fromJson(Map<String, dynamic> json) => RelatedDocumentList(
        documentTypeId: json["DocumentTypeId"],
        uploadedFile: UploadedFile.fromJson(json["UploadedFile"]),
      );

  Map<String, dynamic> toJson() => {
        "DocumentTypeId": documentTypeId,
        "UploadedFile": uploadedFile!.toJson(),
      };
}

class UploadedFile {
  UploadedFile({
    this.contentLength,
    this.contentType,
    this.fileName,
    this.inputStream,
  });

  int? contentLength;
  String? contentType;
  String? fileName;
  InputStream? inputStream;

  factory UploadedFile.fromJson(Map<String, dynamic> json) => UploadedFile(
        contentLength: json["ContentLength"],
        contentType: json["ContentType"],
        fileName: json["FileName"],
        inputStream: InputStream.fromJson(json["InputStream"]),
      );

  Map<String, dynamic> toJson() => {
        "ContentLength": contentLength,
        "ContentType": contentType,
        "FileName": fileName,
        "InputStream": inputStream!.toJson(),
      };
}

class InputStream {
  InputStream({
    this.identity,
  });

  Identity? identity;

  factory InputStream.fromJson(Map<String, dynamic> json) => InputStream(
        identity: Identity.fromJson(json["__identity"]),
      );

  Map<String, dynamic> toJson() => {
        "__identity": identity!.toJson(),
      };
}

class Identity {
  Identity();

  factory Identity.fromJson(Map<String, dynamic> json) => Identity();

  Map<String, dynamic> toJson() => {};
}
