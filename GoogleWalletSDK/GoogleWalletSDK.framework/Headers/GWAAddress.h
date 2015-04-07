///
/// A postal address.
///
@interface GWAAddress : NSObject<NSCoding>

///
/// Name of the person at this address. This is the name on the credit card for a
/// billing address or a recipient for a shipping address.
///
@property(nonatomic, copy) NSString *name;

///
/// The company name of the address.
///
@property(nonatomic, copy) NSString *companyName;

///
/// The address lines. Each line is an NSString. The maximum length is five lines.
///
@property(nonatomic, copy) NSArray *addressLines;

///
/// Whether the address is a post box or not.
///
@property(nonatomic, assign) BOOL isPostBox;

///
/// The city or other locality.
///
@property(nonatomic, copy) NSString *locality;

///
/// An area of a town (a neighborhood/suburb) used for addresses in Korea and China, or a district
/// of a country such as Nauru.  This property will not be set for countries that do not use
/// dependent localities.
///
@property(nonatomic, copy) NSString *dependentLocality;

///
/// The state, province, prefecture, or other sub-national administrative unit.
///
@property(nonatomic, copy) NSString *administrativeArea;

///
/// Sorting code designed for recipients of large volumes of mail.  This is used mostly in France.
/// This property will not be set for countries that do not use sorting codes.
///
@property(nonatomic, copy) NSString *sortingCode;

///
/// The postal code.
///
@property(nonatomic, copy) NSString *postalCode;

///
/// The ISO-3166-1 alpha-2 country code.
///
@property(nonatomic, copy) NSString *countryCode;

///
/// The phone number associated with the address. Will only be returned
/// if requested in the GWAMaskedWalletRequest. Note: This could be an
/// international phone number.
///
@property(nonatomic, copy) NSString *phoneNumber;

@end

