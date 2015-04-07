///
/// A country specification.  This is used for specifying allowed shipping addresses.
///
@interface GWACountrySpecification : NSObject<NSCoding, NSCopying>

///
/// The ISO-3166 alpha-2 country code.
///
@property(nonatomic, copy) NSString *countryCode;

///
/// The designated initializer.  Initialize an instance of GWACountrySpecification with an
/// ISO-3166-1 alpha-2 country code (e.g. "US", "CA", or "JP").  The value must be a non-empty
/// two character uppercase string that is the country code for a supported country.
///
- (id)initWithCountryCode:(NSString *)countryCode;

@end
