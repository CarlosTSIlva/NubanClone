import 'package:flutter/material.dart';
import 'package:nubank_clone/constants/app_colors.dart';
import 'package:nubank_clone/constants/nu_icons.dart';

class FilledContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool leftIcon;
  const FilledContainer({
    required this.icon,
    required this.text,
    this.leftIcon = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AppColors.labelButton,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: AppColors.text,
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 220,
                    child: Text(
                      text,
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                    ),
                  ),
                  if (leftIcon) ...[
                    const Spacer(),
                    const Icon(
                      NuIcons.abc_ic_go_search_api_material,
                      color: AppColors.secondaryText,
                    )
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
