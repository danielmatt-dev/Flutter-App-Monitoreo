import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ListTileCustom extends StatefulWidget {

  final bool withIcon;
  final IconData? icon;
  final String title;
  final Color? titleColor;
  final FontWeight? fontWeightTitle;
  final double titlePercent;
  final bool withSubtitle;
  final String? subtitle;
  final bool withText;
  final String? text;
  final bool isSelected;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final double paddingRight;
  final double paddingLeft;

  const ListTileCustom({
    super.key,
    this.withIcon = true,
    this.icon,
    required this.title,
    this.titleColor,
    this.fontWeightTitle,
    this.titlePercent = 0.022,
    this.withSubtitle = true,
    this.subtitle,
    this.withText = true,
    this.text,
    required this.isSelected,
    this.onTap,
    this.onChanged,
    this.paddingRight = 5,
    this.paddingLeft = 0
  });

  @override
  State<StatefulWidget> createState() => _ListTileCustomState();

}

class _ListTileCustomState extends State<ListTileCustom> {

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return ListTile(
      contentPadding: EdgeInsets.only(right: widget.paddingRight, left: widget.paddingLeft),
      leading: widget.withIcon
          ? CircleAvatar(child: Icon(widget.icon ?? Icons.person_rounded),)
          : null,
      title: AppTextStyles.autoBodyStyle(
          text: widget.title,
          color: widget.titleColor ?? colorScheme.secondary,
          height: height,
          percent: widget.titlePercent,
          maxLines: 3,
          fontWeight: widget.fontWeightTitle ?? FontWeight.w500
      ),
      subtitle: widget.withSubtitle ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextStyles.autoBodyStyle(
            text: widget.subtitle ??  '',
            color: widget.titleColor ?? colorScheme.secondary,
            height: height,
            percent: 0.018,
            maxLines: 3
          ),
          if(widget.withText)
          AppTextStyles.autoBodyStyle(
              text: widget.text ??  '',
              color: widget.titleColor ?? colorScheme.secondary,
              height: height,
              percent: 0.018,
              maxLines: 3
          ),
        ],
      ) : null,
      trailing: Icon(
        widget.isSelected
            ? Icons.check_circle_rounded
            : Icons.circle_outlined,
        color: widget.isSelected
            ? Colors.green
            : widget.titleColor ?? colorScheme.primary,
      ),
      onTap: widget.onTap,
    );
  }

}