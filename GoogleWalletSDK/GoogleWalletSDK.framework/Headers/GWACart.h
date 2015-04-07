#import "GWALineItemRole.h"

///
/// A shopping cart.
///
@interface GWACart : NSObject<NSCoding, NSCopying>

///
/// The ISO 4217 currency code of the transaction.
///
@property(nonatomic, copy) NSString *currencyCode;

///
/// The line items in the cart. Each item in the array should be of the type GWALineItem.
/// This property is optional.
///
@property(nonatomic, strong) NSArray *lineItems;

///
/// The total price.
///
@property(nonatomic, copy) NSString *totalPrice;

///
/// The designated initializer.
/// The lineItems parameter may be nil.
///
- (id)initWithCurrencyCode:(NSString *)currencyCode
                totalPrice:(NSString *)totalPrice
                 lineItems:(NSArray *)lineItems;

@end
