@class GWACart;

///
/// A full wallet request.
///
@interface GWAFullWalletRequest : NSObject<NSCoding, NSCopying>

///
/// The shopping cart.
///
@property(nonatomic, strong) GWACart *cart;

///
/// Google's unique identifier for this transaction.
///
@property(nonatomic, strong) NSString *googleTransactionId;

///
/// An optional merchant identifier for this transaction.
///
@property(nonatomic, strong) NSString *merchantTransactionId;

///
/// The designated initializer.
///
- (id)initWithGoogleTransactionId:(NSString *)googleTransactionId
                             cart:(GWACart *)cart
            merchantTransactionId:(NSString *)merchantTransactionId;

@end

