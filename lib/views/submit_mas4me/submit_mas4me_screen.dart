// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/cubits/mas4me_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/components/text_form_field.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/controller/states/mas4me_statets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//this class display mas4me screen
class SubmitMas4MeScreen extends StatelessWidget {
  TextEditingController SiteName = TextEditingController();
  TextEditingController SiteURL = TextEditingController();
  TextEditingController ItemName = TextEditingController();
  TextEditingController ItemURL = TextEditingController();
  TextEditingController Options = TextEditingController();
  TextEditingController Price = TextEditingController();
  TextEditingController Quantity = TextEditingController();
  var formKey = GlobalKey<FormState>();

  SubmitMas4MeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginCubit = LoginCubit.get(context);
    var mas4meCubit = Mas4meCubit.get(context);
    return BlocConsumer<Mas4meCubit, Mas4meStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.titleMasScreen,
              style: TextStyle(color: defaultColorBlack),
            ),
            centerTitle: true,
          ),
          endDrawer: defaultDrawer(context: context),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      AppLocalizations.of(context)!.mas4meDescription,
                      style: const TextStyle(fontSize: 13.0),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    myDivider(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: defaultTextFormField(
                            controll: SiteName,
                            type: TextInputType.text,
                            label: AppLocalizations.of(context)!.siteName,
                            validat: (String? value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .siteNameError;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: defaultTextFormField(
                            controll: SiteURL,
                            type: TextInputType.text,
                            label: AppLocalizations.of(context)!.siteURL,
                            prefix: Icons.link,
                            validat: (String? value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .siteURLError;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      AppLocalizations.of(context)!.mas4meDescription2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 13.0),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    myDivider(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: defaultTextFormField(
                            controll: ItemName,
                            type: TextInputType.text,
                            label: AppLocalizations.of(context)!.itemName,
                            validat: (String? value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .itemNameError;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: defaultTextFormField(
                            controll: ItemURL,
                            type: TextInputType.text,
                            label: AppLocalizations.of(context)!.itemURL,
                            prefix: Icons.link,
                            validat: (String? value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .itemURLError;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: defaultTextFormField(
                            controll: Options,
                            type: TextInputType.text,
                            label: AppLocalizations.of(context)!.options,
                            validat: (String? value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .optionsError;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: defaultTextFormField(
                            controll: Price,
                            type: TextInputType.number,
                            label: AppLocalizations.of(context)!.price,
                            prefix: Icons.payments,
                            validat: (String? value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!.priceError;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: defaultTextFormField(
                        controll: Quantity,
                        type: TextInputType.number,
                        label: AppLocalizations.of(context)!.quantity,
                        validat: (String? value) {
                          if (value!.isEmpty) {
                            return AppLocalizations.of(context)!.quantity;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      children: [
                        //this button to clear text form filed to add new item
                        defaultButton(
                          text: AppLocalizations.of(context)!.addAnotherItem,
                          width: 200,
                          function: () {
                            SiteName.text = '';
                            SiteURL.text = '';
                            ItemName.text = '';
                            ItemURL.text = '';
                            Options.text = '';
                            Price.text = '';
                            Quantity.text = '';
                          },
                          color: defaultColorNavyBlue,
                        ),
                        const Spacer(),
                        //this button to submit mas4me
                        defaultButton(
                          text: AppLocalizations.of(context)!.submitButton,
                          width: 100,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              mas4meCubit.submitMas4Me(
                                currUserId: loginCubit.loginModel.id,
                                siteName: SiteName.text,
                                siteUrl: SiteURL.text,
                                itemName: ItemName.text,
                                itemUrl: ItemURL.text,
                                options: Options.text,
                                price: Price.text,
                                quantity: Quantity.text,
                                firstName: loginCubit.loginModel.fName,
                                phoneCountryCode:
                                    loginCubit.loginModel.phoneCountryCode,
                                mobile: loginCubit.loginModel.mob,
                                email: loginCubit.loginModel.email,
                              );
                            }
                          },
                          color: defaultColorNavyBlue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is Mas4meSuccessState) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: AppLocalizations.of(context)!.success,
              message: AppLocalizations.of(context)!.mas4MeMessageSuccess,
              contentType: ContentType.success,
              // to configure for material banner
              inMaterialBanner: true,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
        if (state is Mas4meErrorState) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: AppLocalizations.of(context)!.error,
              message: AppLocalizations.of(context)!.mas4MeMessageError,
              contentType: ContentType.failure,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      },
    );
  }
}
