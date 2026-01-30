import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/borrowWidgets/summary_list.dart';
import 'package:flutter_prototype/widgets/utilties/nav_button.dart';

class BorrowStep9 extends StatefulWidget {
  final List<SummaryItem> list;
  final VoidCallback onNext;

  const BorrowStep9({super.key, required this.list, required this.onNext});

  @override
  State<BorrowStep9> createState() => _BorrowStep9State();
}

class _BorrowStep9State extends State<BorrowStep9> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
      child: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            /// Main content
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Vi estimerer at du kan låne ",
                          style: AppTextStyles.pageTitle,
                        ),
                        TextSpan(
                          text: "2.000.000 kr",
                          style: AppTextStyles.pageTitle.copyWith(
                            color: AppColors.contrastColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: AppSizes.spacing),

                  SummaryList(list: widget.list, label: "Opsummering"),

                  SizedBox(height: AppSizes.spacing),

                  Text("Supplerende gæld:", style: AppTextStyles.pText),
                  SizedBox(height: AppSizes.spacingInside),

                  SizedBox(height: AppSizes.spacing),
                ],
              ),
            ),

            /// Bottom button
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  NavButton(label: "Forsæt", onPressed: () {}),
                  SizedBox(height: AppSizes.spacing),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
