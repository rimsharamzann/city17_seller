// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/information_text.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class DisplayDataTab extends StatefulWidget {
  const DisplayDataTab({super.key});

  @override
  State<DisplayDataTab> createState() => _DisplayDataTabState();
}

class _DisplayDataTabState extends State<DisplayDataTab> {
  String? _scannedQrCode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomContainer(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _dataWidget('Brand', _scannedQrCode ?? 'TCL', context),
                const SizedBox(height: 10),
                _dataWidget('Model', 'Android TV', context),
                const SizedBox(height: 10),
                _dataWidget('Resolution', '1920x1080', context),
                const SizedBox(height: 14),
                CustomElevatedButtonWidget(
                  width: context.width,
                  color: MyColors.backgroundColor,
                  onPressed: () async {
                    final qrResult = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScanQrCodeWidget(),
                      ),
                    );

                    if (qrResult != null) {
                      setState(() {
                        _scannedQrCode = qrResult.toString();
                      });
                    }
                  },
                  buttonText: 'Scan QR Code',
                  textColor: Colors.white,
                  prefix: AssetString.qrcode,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Widget _dataWidget(String title, String value, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.textTheme.bodyMedium),
        Text(
          value,
          style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}

class DisplayDataInfo extends StatefulWidget {
  const DisplayDataInfo({super.key});

  @override
  State<DisplayDataInfo> createState() => _DisplayDataInfoState();
}

class _DisplayDataInfoState extends State<DisplayDataInfo> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _dataWidget('Brand', 'TCL', context),
          SizedBox(height: 10),
          _dataWidget('Model', 'Android TV', context),
          SizedBox(height: 10),
          _dataWidget('Resolution', '1920x1080', context),
          SizedBox(height: 14),
          CustomElevatedButtonWidget(
            width: context.width,
            color: MyColors.backgroundColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScanQrCodeWidget()),
              );
            },
            buttonText: 'Scan QR Code',
            textColor: Colors.white,
            prefix: AssetString.qrcode,
            iconColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _dataWidget(String title, String value, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(
          value,
          style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}

class ScanQR extends StatefulWidget {
  final ValueChanged<String>? onImagePicked;
  final ValueChanged<String>? onQRScanned;

  const ScanQR({super.key, this.onImagePicked, this.onQRScanned});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                color: Colors.grey.shade400,
                stackFit: StackFit.loose,
                strokeWidth: 1.5,
                dashPattern: const [9, 3],
                strokeCap: StrokeCap.butt,
                radius: const Radius.circular(16),
                child: Container(
                  height: context.height / 3.6,
                  width: context.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              CustomElevatedButtonWidget(
                width: context.width,
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();

                  PermissionStatus status = await Permission.camera.request();

                  if (status.isGranted) {
                    showModalBottomSheet(
                      
                      context: context,
                      builder: (context) {
                        return SafeArea(
                          child: Wrap(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.camera_alt),
                                title: const Text('Take a photo'),
                                onTap: () async {
                                  final XFile? pickedFile = await picker
                                      .pickImage(source: ImageSource.camera);
                                  if (pickedFile != null) {
                                    widget.onImagePicked?.call(pickedFile.path);
                                  }
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.photo_library),
                                title: const Text('Choose from gallery'),
                                onTap: () async {
                                  final XFile? pickedFile = await picker
                                      .pickImage(source: ImageSource.gallery);
                                  if (pickedFile != null) {
                                    widget.onImagePicked?.call(pickedFile.path);
                                  }
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    openAppSettings();
                  }
                },
                buttonText: 'Add Display Image',
                color: MyColors.containerBg,
                iconColor: MyColors.primaryColor,
                textColor: MyColors.primaryColor,
                prefix: Icons.camera_alt_outlined,
              ),

              const SizedBox(height: 10),

              InformationText(
                iconSize: 24,
                fontSize: 11,
                icon: Icons.warning_rounded,
                iconColor: MyColors.primaryColor,
                textColor: MyColors.textColor,
                maxLines: 3,
                text:
                    'Upload a clear image of your display to help buyers better understand its visibility and real-world placement.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ScanQrCodeWidget extends StatefulWidget {
  const ScanQrCodeWidget({super.key});

  @override
  State<ScanQrCodeWidget> createState() => _ScanQrCodeWidgetState();
}

class _ScanQrCodeWidgetState extends State<ScanQrCodeWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR Code')),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: result != null
                  ? Text(
                      // ignore: deprecated_member_use
                      'Barcode Type: ${describeEnum(result!.format)}\nData: ${result!.code}',
                    )
                  : const Text('Scan a code'),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      Navigator.pop(context, scanData.code);
    });
  }

  @override
  void dispose() {
    // ignore: deprecated_member_use
    controller?.dispose();
    super.dispose();
  }
}
