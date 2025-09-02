///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsRu extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override String get lang => 'ru';
	@override late final _TranslationsLanguagesRu languages = _TranslationsLanguagesRu._(_root);
	@override late final _TranslationsAppRu app = _TranslationsAppRu._(_root);
	@override late final _TranslationsSendRu send = _TranslationsSendRu._(_root);
	@override late final _TranslationsReceiveRu receive = _TranslationsReceiveRu._(_root);
	@override late final _TranslationsBottomBarRu bottom_bar = _TranslationsBottomBarRu._(_root);
	@override late final _TranslationsHomeRu home = _TranslationsHomeRu._(_root);
	@override late final _TranslationsTransactionsRu transactions = _TranslationsTransactionsRu._(_root);
}

// Path: languages
class _TranslationsLanguagesRu extends TranslationsLanguagesEn {
	_TranslationsLanguagesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get ru => 'Русский';
	@override String get en => 'Английский';
}

// Path: app
class _TranslationsAppRu extends TranslationsAppEn {
	_TranslationsAppRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gomining Wallet';
}

// Path: send
class _TranslationsSendRu extends TranslationsSendEn {
	_TranslationsSendRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Отправить BTC';
	@override String get recipient_address => 'Адрес получателя';
	@override String get address_hint => 'Введите BTC адрес';
	@override String get amount => 'Сумма (BTC)';
	@override String get amount_hint => 'Сумма';
	@override String get available => 'Доступно: {amount} BTC';
	@override String get send_button => 'Отправить';
	@override late final _TranslationsSendErrorsRu errors = _TranslationsSendErrorsRu._(_root);
}

// Path: receive
class _TranslationsReceiveRu extends TranslationsReceiveEn {
	_TranslationsReceiveRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Получить BTC';
	@override String get scan_qr => 'Отсканируйте QR-код для получения';
	@override String get wallet_address => 'Адрес кошелька';
	@override String get copy_button => 'Копировать';
	@override String get address_copied => 'Адрес скопирован!';
}

// Path: bottom_bar
class _TranslationsBottomBarRu extends TranslationsBottomBarEn {
	_TranslationsBottomBarRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get receive => 'Получить';
	@override String get send => 'Отправить';
}

// Path: home
class _TranslationsHomeRu extends TranslationsHomeEn {
	_TranslationsHomeRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get total_amount => 'Общая сумма';
}

// Path: transactions
class _TranslationsTransactionsRu extends TranslationsTransactionsEn {
	_TranslationsTransactionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get received => 'Получено';
	@override String get sent => 'Отправлено';
	@override String get confirmed => 'Подтверждено';
	@override String get pending => 'Ожидает';
	@override late final _TranslationsTransactionsTimeAgoRu time_ago = _TranslationsTransactionsTimeAgoRu._(_root);
}

// Path: send.errors
class _TranslationsSendErrorsRu extends TranslationsSendErrorsEn {
	_TranslationsSendErrorsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get address_empty => 'Адрес не может быть пустым';
	@override String get invalid_address => 'Неверный формат BTC адреса';
	@override String get self_send => 'Нельзя отправить самому себе';
	@override String get amount_empty => 'Сумма не может быть пустой';
	@override String get invalid_amount => 'Введите корректную сумму';
	@override String get insufficient_funds => 'Недостаточно средств.';
}

// Path: transactions.time_ago
class _TranslationsTransactionsTimeAgoRu extends TranslationsTransactionsTimeAgoEn {
	_TranslationsTransactionsTimeAgoRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get days => '{days} дн. назад';
	@override String get hours => '{hours} ч. назад';
	@override String get minutes => '{minutes} мин. назад';
	@override String get just_now => 'Только что';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'lang': return 'ru';
			case 'languages.ru': return 'Русский';
			case 'languages.en': return 'Английский';
			case 'app.title': return 'Gomining Wallet';
			case 'send.title': return 'Отправить BTC';
			case 'send.recipient_address': return 'Адрес получателя';
			case 'send.address_hint': return 'Введите BTC адрес';
			case 'send.amount': return 'Сумма (BTC)';
			case 'send.amount_hint': return 'Сумма';
			case 'send.available': return 'Доступно: {amount} BTC';
			case 'send.send_button': return 'Отправить';
			case 'send.errors.address_empty': return 'Адрес не может быть пустым';
			case 'send.errors.invalid_address': return 'Неверный формат BTC адреса';
			case 'send.errors.self_send': return 'Нельзя отправить самому себе';
			case 'send.errors.amount_empty': return 'Сумма не может быть пустой';
			case 'send.errors.invalid_amount': return 'Введите корректную сумму';
			case 'send.errors.insufficient_funds': return 'Недостаточно средств.';
			case 'receive.title': return 'Получить BTC';
			case 'receive.scan_qr': return 'Отсканируйте QR-код для получения';
			case 'receive.wallet_address': return 'Адрес кошелька';
			case 'receive.copy_button': return 'Копировать';
			case 'receive.address_copied': return 'Адрес скопирован!';
			case 'bottom_bar.receive': return 'Получить';
			case 'bottom_bar.send': return 'Отправить';
			case 'home.total_amount': return 'Общая сумма';
			case 'transactions.received': return 'Получено';
			case 'transactions.sent': return 'Отправлено';
			case 'transactions.confirmed': return 'Подтверждено';
			case 'transactions.pending': return 'Ожидает';
			case 'transactions.time_ago.days': return '{days} дн. назад';
			case 'transactions.time_ago.hours': return '{hours} ч. назад';
			case 'transactions.time_ago.minutes': return '{minutes} мин. назад';
			case 'transactions.time_ago.just_now': return 'Только что';
			default: return null;
		}
	}
}

