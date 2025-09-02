///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'en'
	String get lang => 'en';

	late final TranslationsLanguagesEn languages = TranslationsLanguagesEn.internal(_root);
	late final TranslationsAppEn app = TranslationsAppEn.internal(_root);
	late final TranslationsSendEn send = TranslationsSendEn.internal(_root);
	late final TranslationsReceiveEn receive = TranslationsReceiveEn.internal(_root);
	late final TranslationsBottomBarEn bottom_bar = TranslationsBottomBarEn.internal(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn.internal(_root);
	late final TranslationsTransactionsEn transactions = TranslationsTransactionsEn.internal(_root);
}

// Path: languages
class TranslationsLanguagesEn {
	TranslationsLanguagesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Russian'
	String get ru => 'Russian';

	/// en: 'English'
	String get en => 'English';
}

// Path: app
class TranslationsAppEn {
	TranslationsAppEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Gomining Wallet'
	String get title => 'Gomining Wallet';
}

// Path: send
class TranslationsSendEn {
	TranslationsSendEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Send BTC'
	String get title => 'Send BTC';

	/// en: 'Recipient Address'
	String get recipient_address => 'Recipient Address';

	/// en: 'Enter BTC address'
	String get address_hint => 'Enter BTC address';

	/// en: 'Amount (BTC)'
	String get amount => 'Amount (BTC)';

	/// en: 'Amount'
	String get amount_hint => 'Amount';

	/// en: 'Available: {amount} BTC'
	String get available => 'Available: {amount} BTC';

	/// en: 'Send'
	String get send_button => 'Send';

	late final TranslationsSendSuccessEn success = TranslationsSendSuccessEn.internal(_root);
	late final TranslationsSendErrorsEn errors = TranslationsSendErrorsEn.internal(_root);
}

// Path: receive
class TranslationsReceiveEn {
	TranslationsReceiveEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Receive BTC'
	String get title => 'Receive BTC';

	/// en: 'Scan QR code to receive'
	String get scan_qr => 'Scan QR code to receive';

	/// en: 'Wallet Address'
	String get wallet_address => 'Wallet Address';

	/// en: 'Copy'
	String get copy_button => 'Copy';

	/// en: 'Address copied!'
	String get address_copied => 'Address copied!';
}

// Path: bottom_bar
class TranslationsBottomBarEn {
	TranslationsBottomBarEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Receive'
	String get receive => 'Receive';

	/// en: 'Send'
	String get send => 'Send';
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Total Amount'
	String get total_amount => 'Total Amount';
}

// Path: transactions
class TranslationsTransactionsEn {
	TranslationsTransactionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Received'
	String get received => 'Received';

	/// en: 'Sent'
	String get sent => 'Sent';

	/// en: 'Confirmed'
	String get confirmed => 'Confirmed';

	/// en: 'Pending'
	String get pending => 'Pending';

	late final TranslationsTransactionsTimeAgoEn time_ago = TranslationsTransactionsTimeAgoEn.internal(_root);
}

// Path: send.success
class TranslationsSendSuccessEn {
	TranslationsSendSuccessEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Success!'
	String get title => 'Success!';

	/// en: 'Transaction sent successfully'
	String get message => 'Transaction sent successfully';
}

// Path: send.errors
class TranslationsSendErrorsEn {
	TranslationsSendErrorsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Address cannot be empty'
	String get address_empty => 'Address cannot be empty';

	/// en: 'Invalid BTC address format'
	String get invalid_address => 'Invalid BTC address format';

	/// en: 'Cannot send to yourself'
	String get self_send => 'Cannot send to yourself';

	/// en: 'Amount cannot be empty'
	String get amount_empty => 'Amount cannot be empty';

	/// en: 'Enter a valid amount'
	String get invalid_amount => 'Enter a valid amount';

	/// en: 'Insufficient funds.'
	String get insufficient_funds => 'Insufficient funds.';
}

// Path: transactions.time_ago
class TranslationsTransactionsTimeAgoEn {
	TranslationsTransactionsTimeAgoEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '{days} days ago'
	String get days => '{days} days ago';

	/// en: '{hours} hours ago'
	String get hours => '{hours} hours ago';

	/// en: '{minutes} minutes ago'
	String get minutes => '{minutes} minutes ago';

	/// en: 'Just now'
	String get just_now => 'Just now';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'lang': return 'en';
			case 'languages.ru': return 'Russian';
			case 'languages.en': return 'English';
			case 'app.title': return 'Gomining Wallet';
			case 'send.title': return 'Send BTC';
			case 'send.recipient_address': return 'Recipient Address';
			case 'send.address_hint': return 'Enter BTC address';
			case 'send.amount': return 'Amount (BTC)';
			case 'send.amount_hint': return 'Amount';
			case 'send.available': return 'Available: {amount} BTC';
			case 'send.send_button': return 'Send';
			case 'send.success.title': return 'Success!';
			case 'send.success.message': return 'Transaction sent successfully';
			case 'send.errors.address_empty': return 'Address cannot be empty';
			case 'send.errors.invalid_address': return 'Invalid BTC address format';
			case 'send.errors.self_send': return 'Cannot send to yourself';
			case 'send.errors.amount_empty': return 'Amount cannot be empty';
			case 'send.errors.invalid_amount': return 'Enter a valid amount';
			case 'send.errors.insufficient_funds': return 'Insufficient funds.';
			case 'receive.title': return 'Receive BTC';
			case 'receive.scan_qr': return 'Scan QR code to receive';
			case 'receive.wallet_address': return 'Wallet Address';
			case 'receive.copy_button': return 'Copy';
			case 'receive.address_copied': return 'Address copied!';
			case 'bottom_bar.receive': return 'Receive';
			case 'bottom_bar.send': return 'Send';
			case 'home.total_amount': return 'Total Amount';
			case 'transactions.received': return 'Received';
			case 'transactions.sent': return 'Sent';
			case 'transactions.confirmed': return 'Confirmed';
			case 'transactions.pending': return 'Pending';
			case 'transactions.time_ago.days': return '{days} days ago';
			case 'transactions.time_ago.hours': return '{hours} hours ago';
			case 'transactions.time_ago.minutes': return '{minutes} minutes ago';
			case 'transactions.time_ago.just_now': return 'Just now';
			default: return null;
		}
	}
}

