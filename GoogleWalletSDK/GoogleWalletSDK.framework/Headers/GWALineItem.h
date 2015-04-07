#import "GWALineItemRole.h"

///
/// A cart line item.
///
@interface GWALineItem : NSObject<NSCoding, NSCopying>

///
/// The description.  This value may be shown to users in their Google Wallet receipt.
///
@property(nonatomic, copy) NSString *itemDescription;

///
/// The quantity. This string must be a decimal number formatted as follows:  One or more decimal
/// digits [0-9], optionally followed by an ASCII period '.' and one decimal digits [0-9].
///
@property(nonatomic, copy) NSString *quantity;

/**
 * The role.  The default is kGWALineItemRoleRegular.
 */
@property(nonatomic) GWALineItemRole role;

///
/// The total price.  This string must be a decimal number formatted as follows:  One or more
/// decimal digits [0-9], optionally followed by an ASCII period '.' and two decimal digits [0-9].
///
@property(nonatomic, copy) NSString *totalPrice;

///
/// The unit price. This string must be a decimal number formatted as follows:  One or more
/// decimal digits [0-9], optionally followed by an ASCII period '.' and two decimal digits [0-9].
///
@property(nonatomic, copy) NSString *unitPrice;

///
/// This initializer creates a line item with item description, total price and role.
///
- (id)initWithItemDescription:(NSString *)itemDescription
                   totalPrice:(NSString *)totalPrice
                         role:(GWALineItemRole)role;

///
/// This initializer sets the role to a default value of kGWALineItemRoleRegular.
///
- (id)initWithItemDescription:(NSString *)itemDescription
                   totalPrice:(NSString *)totalPrice;

///
/// This initializer sets the role to a default value of kGWALineItemRoleRegular.
///
- (id)initWithItemDescription:(NSString *)itemDescription
                    unitPrice:(NSString *)unitPrice
                     quantity:(NSString *)quantity;
@end
