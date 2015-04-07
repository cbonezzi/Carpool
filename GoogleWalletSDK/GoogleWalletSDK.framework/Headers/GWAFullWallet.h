@class GWAAddress;
@class GWAProxyCard;

///
/// A full wallet response.
///
@interface GWAFullWallet : NSObject

///
/// The proxy credit card to use for payment processing.
///
@property(nonatomic, strong) GWAProxyCard *proxyCard;

///
/// The billing address associated with the payment instrument.
///
@property(nonatomic, strong) GWAAddress *billingAddress;

///
/// The buyer's shipping address.
///
@property(nonatomic, strong) GWAAddress *shippingAddress;

///
/// The buyer's email address.
///
@property(nonatomic, copy) NSString *email;

///
/// Google's unique identifier for this transaction. This is identical to the
/// value passed in FullWalletRequest.
///
@property(nonatomic, copy) NSString *googleTransactionId;

///
/// An optional merchant identifier for this transaction. This is identical to
/// the value passed in FullWalletRequest.
///
@property(nonatomic, copy) NSString *merchantTransactionId;

///
/// An array of user-facing messages, each of the type NSString, describing the funding
/// sources used to fund this Google Wallet transaction.  All strings in this list should
/// be displayed to the user in the order they appear in this list.  Do not attempt to parse
/// the contents of this array, as the format and contents may change at any time.
///
@property(nonatomic, strong) NSArray *paymentDescriptions; // of NSString *

///
/// Structured details about payment instruments used to fund this transaction.  The length and
/// order of elements may be different from paymentDecriptions.
///
@property(nonatomic, strong) NSArray *instrumentInfo;
    // of GWAInstrumentInfo;

@end

