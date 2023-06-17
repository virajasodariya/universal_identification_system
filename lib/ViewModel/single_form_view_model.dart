import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:universal_identification_system/Api/Repo/single_form_repo.dart';
import 'package:universal_identification_system/Api/api_response.dart';
import 'package:universal_identification_system/Model/Response/single_form_response_model.dart';

class SingleFormViewModel extends GetxController {
  final box = GetStorage();

  ApiResponse _apiResponseSingleForm =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponseSingleForm;

  /// form 1

  TextEditingController deceasedName = TextEditingController();
  TextEditingController dateOfDeath = TextEditingController();
  TextEditingController placeOfDeath = TextEditingController();
  TextEditingController numberOnUisBand = TextEditingController();
  TextEditingController dateTimeAttached = TextEditingController();
  TextEditingController printedForm1 = TextEditingController();
  TextEditingController signatureForm1 = TextEditingController();

  /// form 2

  TextEditingController funeralPrintedForm2 = TextEditingController();
  TextEditingController
      nameFuneralDirectorOtherRepresentativeTakingCustodyEsign =
      TextEditingController();
  TextEditingController nameFuneralDirectorOtherRepresentativeTakingCustodyDt =
      TextEditingController();
  TextEditingController crematoryPrintedForm2 = TextEditingController();
  TextEditingController
      nameCrematoryCemeteryRepresentativeCustodyDeceasedEsign =
      TextEditingController();
  TextEditingController nameCrematoryCemeteryRepresentativeCustodyDeceasedDt =
      TextEditingController();

  /// form 3

  TextEditingController printedReceiveForm3 = TextEditingController();
  TextEditingController
      nameOfPersonEntitledToReceiveCrematedRemainsRelationship =
      TextEditingController();
  TextEditingController nameOfPersonEntitledToReceiveCrematedRemainsEsign =
      TextEditingController();
  TextEditingController nameOfPersonEntitledToReceiveCrematedRemainsDt =
      TextEditingController();
  TextEditingController printedReleasingForm3 = TextEditingController();
  TextEditingController nameOfPersonReleasingCrematedRemainsEsign =
      TextEditingController();
  TextEditingController nameOfPersonReleasingCrematedRemainsDt =
      TextEditingController();

  Future<void> singleFormViewModel() async {
    _apiResponseSingleForm = ApiResponse.loading(message: 'Loading');

    update();
    try {
      SingleFormResponseModel response = await SingleFormsRepo.singleFormsRepo(
        box.read("userId"),
        box.read("formID"),
      );

      _apiResponseSingleForm = ApiResponse.complete(response);

      ///form 1

      deceasedName.text = response.data.deceasedName;
      dateOfDeath.text = response.data.dateOfDeath.toString();
      placeOfDeath.text = response.data.placeOfDeath;
      numberOnUisBand.text = "100";
      dateTimeAttached.text = response.data.dateTimeAttached.toString();
      printedForm1.text = "100";
      signatureForm1.text = "100";

      /// form 2

      funeralPrintedForm2 = TextEditingController(text: "100");
      nameFuneralDirectorOtherRepresentativeTakingCustodyEsign =
          TextEditingController(
              text: response.data
                  .nameFuneralDirectorOtherRepresentativeTakingCustodyEsign);
      nameFuneralDirectorOtherRepresentativeTakingCustodyDt =
          TextEditingController(
              text: response
                  .data.nameFuneralDirectorOtherRepresentativeTakingCustodyDt
                  .toString());
      crematoryPrintedForm2 = TextEditingController(text: "100");
      nameCrematoryCemeteryRepresentativeCustodyDeceasedEsign =
          TextEditingController(
              text: response.data
                  .nameCrematoryCemeteryRepresentativeCustodyDeceasedEsign);
      nameCrematoryCemeteryRepresentativeCustodyDeceasedDt =
          TextEditingController(
              text: response
                  .data.nameCrematoryCemeteryRepresentativeCustodyDeceasedDt
                  .toString());

      /// form 3

      printedReceiveForm3 = TextEditingController(text: "100");
      nameOfPersonEntitledToReceiveCrematedRemainsRelationship =
          TextEditingController(
              text: response.data
                  .nameOfPersonEntitledToReceiveCrematedRemainsRelationship);
      nameOfPersonEntitledToReceiveCrematedRemainsEsign = TextEditingController(
          text:
              response.data.nameOfPersonEntitledToReceiveCrematedRemainsEsign);
      nameOfPersonEntitledToReceiveCrematedRemainsDt = TextEditingController(
          text: response.data.nameOfPersonEntitledToReceiveCrematedRemainsDt
              .toString());
      printedReleasingForm3 = TextEditingController(text: "100");
      nameOfPersonReleasingCrematedRemainsEsign = TextEditingController(
          text: response.data.nameOfPersonReleasingCrematedRemainsEsign);
      nameOfPersonReleasingCrematedRemainsDt = TextEditingController(
          text:
              response.data.nameOfPersonReleasingCrematedRemainsDt.toString());

      ///
      ///

      log('singleFormResponseModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponseSingleForm = ApiResponse.error(message: e.toString());

      log('singleFormViewModel-------->>>>>>$e');
    }
    update();
  }
}
