import 'package:boilerplate_riverpod/shared/theme/app_colors.dart';
import 'package:boilerplate_riverpod/shared/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final double? size;
  final Color? color;
  final Color? backgroundColor;
  final double strokeWidth;
  final String? message;

  const LoadingOverlay({
    super.key,
    required this.child,
    required this.isLoading,
    this.size,
    this.color,
    this.backgroundColor,
    this.strokeWidth = AppSpacing.xs,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: backgroundColor ?? Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: size ?? AppSpacing.xl,
                      height: size ?? AppSpacing.xl,
                      child: CircularProgressIndicator(
                        strokeWidth: strokeWidth,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          color ?? AppColors.primary,
                        ),
                      ),
                    ),
                    if (message != null) ...[
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        message!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
