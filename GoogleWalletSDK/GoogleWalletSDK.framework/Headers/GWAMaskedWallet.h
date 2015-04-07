@class GWAAddress;

///
/// A masked wallet response.
///
@interface GWAMaskedWallet : NSObject<NSCoding>

///
/// The billing address associated with the payment instrument.
///
@property(nonatomic, strong) GWAAddress *billingAddress;

///
/// The buyer's email address.
///
@property(nonatomic, copy) NSString *email;

///
/// Google's unique identifier for this transaction. Store this identifier in your
/// application. Its value is required in the googleTransactionId field on
/// all subsequent requests pertaining to this transaction, such as
/// change masked wallet and full wallet requests.
///
@property(nonatomic, copy) NSString *googleTransactionId;

///
/// The merchant transaction id specified in the MaskedWalletRequest.
///
@property(nonatomic, copy) NSString *merchantTransactionId;

///
/// An array of user-facing messages, each of the type NSString, describing the funding
/// sources used to fund this Google Wallet transaction.  All strings in this list should
/// be displayed to the user in the order they appear in this list.  Do not attempt to parse
/// the contents of this array, as the format and contents may change at any time.
///
@property(nonatomic, strong) NSArray *paymentDescriptions;

///
/// The buyer's shipping address.
///
@property(nonatomic, strong) GWAAddress *shippingAddress;

@end

