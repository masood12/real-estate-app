import 'package:assesment_task/core/cubit/helper.dart';
import 'package:assesment_task/core/extensions/build_context_extension.dart';
import 'package:assesment_task/core/extensions/widget_extension.dart';
import 'package:assesment_task/core/widgets/svg_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Navbar extends StatefulWidget {
  final List<(String, Widget)> items;
  final int initialIndex;
  final Handler<int> handler;

  const Navbar({
    super.key,
    required this.items,
    required this.handler,
    this.initialIndex = 0,
  }) : assert(items.length > 2, 'Nav bar items must be more 1 ');

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late final Handler<int> _handler;

  @override
  void initState() {
    super.initState();
    _handler = widget.handler;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: const Color(0xff2B2B2B),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            widget.items.length,
            (index) {
              final icon = widget.items[index].$1;
              return BlocBuilder<Handler<int>, int>(
                bloc: _handler,
                builder: (context, selectedIndex) {
                  return GestureDetector(
                    onTap: () {
                      _handler.update(index);
                    },
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        color: selectedIndex == index ? context.primary : Colors.black,
                        borderRadius: BorderRadius.circular(44.0),
                      ),
                      constraints: const BoxConstraints.tightFor(width: 44.0, height: 44.0),
                      duration: const Duration(milliseconds: 200),
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                            color: selectedIndex != index ? Colors.black : null,
                            borderRadius: BorderRadius.circular(50.0)),
                        margin: const EdgeInsets.all(2.0),
                        duration: const Duration(milliseconds: 200),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgAssets(
                            icon,
                            color: context.onSecondary,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ).childrenPadding(const EdgeInsets.all(4.0)).paddingSymmetric(vertical: 2.0),
      ),
    );
  }
}
