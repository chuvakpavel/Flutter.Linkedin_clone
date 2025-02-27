import 'package:flutter/material.dart';

import '../../../../../../../models/user.dart';
import '../widgets/company_info_view.dart';

class CompanyView extends StatelessWidget {
  const CompanyView({
    super.key,
    required this.user,
    required this.width,
  });

  final User user;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.network(
              'https://media.licdn.com/dms/image/v2/C4E1BAQH9YtxS0Q2QvQ/company-background_10000/company-background_10000/0/1594112462737/xamazing_cover?e=1741158000&v=beta&t=UbV3R85AvTDz5iIdgdDd0fll2dVfxBF84ZAE1swBl3I',
              fit: BoxFit.cover,
              alignment: Alignment(0.0,-0.8),
              height: width > 225 ? 70 : 30,
              width: double.infinity,
            ),
            Positioned(
              top: width > 225 ? 50 : 16,
              left: 16,
              child: Image.network(
                "https://media.licdn.com/dms/image/v2/C4E0BAQEFYW4DtfLdhg/company-logo_200_200/company-logo_200_200/0/1630629241128/xamazing_logo?e=1746662400&v=beta&t=VGJjtR61fedn9MxTGJi3l15nsAjaVY126Wpjv0Idy0U",
                height: 40,
                width: 40,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('Igniscor', style: Theme.of(context).textTheme.headlineMedium),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(height: 0.5, width: 100, color: Colors.grey),
        ),
        const CompanyInfoView()
      ],
    );
  }
}
