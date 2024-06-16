import 'package:client/src/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef ErrorAction = void Function(BuildContext context);

class ErrorScreen extends ConsumerWidget {
  const ErrorScreen({
    super.key, 
    this.message = "Error.",
    this.title,
    this.actionMessage,
    this.onAction
  }) : assert(
    actionMessage != null && onAction != null || 
    actionMessage == null && onAction == null
  );

  final String message;
  final String? title;
  final String? actionMessage;
  final ErrorAction? onAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: (title != null) ? AppBar(
        title: Text(title!),
        centerTitle: true,
      ) : null,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(p8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline_sharp,
                color: Colors.red,
                size: 96,
              ),
              h8gap,
              Text(message,
                style: Theme.of(context).textTheme.headlineSmall
              ),
              h8gap,
              if (onAction != null) FilledButton(
                onPressed: () => onAction!(context),
                child: Text(actionMessage!),
              )
            ]
          ),
        )
      )
    );
  }
}