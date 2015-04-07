///
/// A structured description of a payment instrument
///
@interface GWAInstrumentInfo : NSObject<NSCoding>

///
/// Describes the type of the instrument.  This is drawn from a small set of values.  Examples
/// include "VISA", "MASTERCARD", "AMEX", and "DISCOVER".  Once a value has been defined it will
/// not be changed, but new values may be added at any time.
///
@property(nonatomic, copy) NSString *instrumentType;

///
/// Instrument details.  The format of this string will be fixed for any given instrument type and
/// may be the empty string.  For "VISA", "MASTERCARD", "AMEX", and "DISCOVER", this field will be
/// four decimal digits representing the last four digits of the account number, i.e. "^[0-9]{4,4}$"
/// e.g. "1234" or "9999".
///
@property(nonatomic, copy) NSString *instrumentDetails;

@end
