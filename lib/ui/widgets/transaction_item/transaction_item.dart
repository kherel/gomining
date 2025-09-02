import 'package:flutter/material.dart';
import 'package:gomining_kherel/config/translations.g.dart';
import 'package:gomining_kherel/logic/models/transaction.dart';
import 'package:gomining_kherel/ui/theme/brand_colors.dart';
import 'package:gomining_kherel/ui/theme/brand_typo.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: BrandColors.gray50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: BrandColors.gray10, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: transaction.isIncoming
                  ? BrandColors.green.withValues(alpha: 0.1)
                  : BrandColors.red.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              transaction.isIncoming
                  ? Icons.arrow_downward
                  : Icons.arrow_upward,
              color: transaction.isIncoming
                  ? BrandColors.green
                  : BrandColors.red,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      transaction.isIncoming
                          ? t.transactions.received
                          : t.transactions.sent,
                      style: ThemeTypo.smallBoldStrong,
                    ),
                    const Spacer(),
                    Text(
                      '${transaction.isIncoming ? '+' : '-'}${transaction.amountBtc.toStringAsFixed(8)} BTC',
                      style: ThemeTypo.smallBoldStrong.copyWith(
                        color: transaction.isIncoming
                            ? BrandColors.green
                            : BrandColors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      _formatTxId(transaction.txid),
                      style: ThemeTypo.tinyRegular,
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: transaction.confirmed
                            ? BrandColors.green.withValues(alpha: 0.1)
                            : BrandColors.gray10.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        transaction.confirmed
                            ? t.transactions.confirmed
                            : t.transactions.pending,
                        style: ThemeTypo.tinyRegular.copyWith(
                          color: transaction.confirmed
                              ? BrandColors.green
                              : BrandColors.textWeak,
                        ),
                      ),
                    ),
                  ],
                ),
                if (transaction.blockTime != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    _formatDate(transaction.blockTime!),
                    style: ThemeTypo.tinyRegular,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTxId(String txid) {
    if (txid.length <= 16) return txid;
    return '${txid.substring(0, 8)}...${txid.substring(txid.length - 8)}';
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return t.transactions.time_ago.days.replaceAll(
        '{days}',
        difference.inDays.toString(),
      );
    } else if (difference.inHours > 0) {
      return t.transactions.time_ago.hours.replaceAll(
        '{hours}',
        difference.inHours.toString(),
      );
    } else if (difference.inMinutes > 0) {
      return t.transactions.time_ago.minutes.replaceAll(
        '{minutes}',
        difference.inMinutes.toString(),
      );
    } else {
      return t.transactions.time_ago.just_now;
    }
  }
}
