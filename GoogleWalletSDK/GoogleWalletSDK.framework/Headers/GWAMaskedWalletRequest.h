@class GWACart;

///
/// A masked wallet request.
///
@interface GWAMaskedWalletRequest : NSObject<NSCoding, NSCopying>

///
/// The ISO 4217 currency code of the transaction
///
@property(nonatomic, copy) NSString *currencyCode;

///
/// The estimated total price of the shopping cart.
/// This must be a decimal number formatted as follows:  One or more decimal digits [0-9],
/// optionally followed by an ASCII period '.' and two decimal digits [0-9].  Permissable
/// strings include "12", "0.34", or "12.34", but NOT ".34" or "12,34".
///
@property(nonatomic, copy) NSString *estimatedTotalPrice;

///
/// The cart.
///
@property(nonatomic, strong) GWACart *cart;

///
/// Your unique identifier for the transaction.
///
@property(nonatomic, copy) NSString *merchantTransactionId;

///
/// Whether a user phone number is required.  The default is NO.
///
@property(nonatomic, assign, getter=isPhoneNumberRequired) BOOL phoneNumberRequired;

///
/// Whether a user shipping address is required.  The default is NO.
/// If shipping address is required then useMinimalBillingAddress must be NO.
///
@property(nonatomic, assign, getter=isShippingAddressRequired) BOOL shippingAddressRequired;

///
/// Indicates that only a minimal billing address associated with the
/// user's payment instrument is desired.  The default is NO.
/// When this is YES, shippingAddressRequired must be NO.
///
@property(nonatomic, assign) BOOL useMinimalBillingAddress;

///
/// Whether a debit card may be used as the backing card for this transaction.  Default is YES.
///
@property(nonatomic, assign) BOOL allowDebitCard;

///
/// Whether a prepaid card may be used as the backing card for this transaction.  Default is YES.
///
@property(nonatomic, assign) BOOL allowPrepaidCard;

///
/// An array of country specifications that list the allowed countries for shipping addresses.
/// If this is not specified, the default is shipping addresses in the US only.
///
@property(nonatomic, copy) NSArray *allowedShippingCountrySpecifications;
    // of GWACountrySpecification *

///
/// The desiginated initializer that sets the minimal required fields and
/// initializes other fields to their default values.
///
/// @param currencyCode The ISO 4217 currency code of the request.
/// @param estimatedTotalPrice The estimated total price of the request.
///
- (id)initWithCurrencyCode:(NSString *)currencyCode
       estimatedTotalPrice:(NSString *)estimatedTotalPrice;

@end
