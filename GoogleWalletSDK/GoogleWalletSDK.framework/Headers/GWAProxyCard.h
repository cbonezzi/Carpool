///
/// A virtual proxy credit card.
///
@interface GWAProxyCard : NSObject

///
/// The primary account number.
///
@property(nonatomic, copy) NSString *pan;

///
/// The card verification number;
///
@property(nonatomic, copy) NSString *cvn;

///
/// The expiration date.  Only the month and year properties are set.
///
@property(nonatomic, strong) NSDateComponents *expirationDate;

@end
