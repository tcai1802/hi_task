import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshBase extends StatefulWidget {
  const RefreshBase({super.key, this.child, this.onRefresh, this.onLoading, this.scrollDirection = Axis.vertical});

  @override
  State<RefreshBase> createState() => _RefreshBaseState();
  final Widget? child;
  final Function? onRefresh;
  final Function? onLoading;
  final Axis scrollDirection;
}

class _RefreshBaseState extends State<RefreshBase> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: widget.onRefresh != null,
      enablePullUp: widget.onLoading != null,
      controller: _refreshController,
      scrollDirection: widget.scrollDirection,
      physics: const BouncingScrollPhysics(),
      footer: const ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
        completeDuration: Duration(milliseconds: 500),
      ),
      header: WaterDropMaterialHeader(
        distance: 40.h,
        color: Colors.white,
        backgroundColor: context.resources.color.brandColor_01,
      ),
      onRefresh: () async {
        if (!mounted) return;
        if (widget.onRefresh != null) {
          await widget.onRefresh!();
          await Future.delayed(const Duration(milliseconds: 400));
          _refreshController.refreshCompleted();
        }
      },
      onLoading: () async {
        if (!mounted) return;
        if (widget.onLoading != null) {
          await widget.onLoading!();
          _refreshController.loadComplete();
        }
      },
      child: widget.child ?? Container(),
    );
  }
}
