#include <Foundation/Foundation.h>
#include <UIKit/UIKit.h>

@class GWAWalletClient;
@class GWAMaskedWalletRequest;

///
/// This class provides the Buy with Google button. On click,
/// the button automatically calls GWAWalletClient::loadMaskedWallet:.
///
@interface GWAWalletButton : UIButton

///
/// The designated initializer.
///
/// @param frame The desired size of the button. The button will only draw itself 38, 44 or 50
/// points high. The height will round down (for instance, a 46 point button will only draw in 44 pixels).
/// If the width is set too small, the button will underflow.
/// @param request The masked wallet request used for describing the payment.
///
- (id)initWithFrame:(CGRect)frame
    maskedWalletRequest:(GWAMaskedWalletRequest *)maskedWalletRequest;

///
/// Initializer for a Buy with Google button where the masked wallet request is
/// set to nil. If this initializer is used the maskedWalletRequest must be
/// set properly for the button to function.
///
/// @param frame the desired size of the button. The button will only draw itself 38, 44 or 50
/// points high. The height will round down (for instance, a 46 point button will only draw in 44 pixels).
/// If the width is set too small, the button will underflow.
///
- (id)initWithFrame:(CGRect)frame;

///
/// The masked wallet request associated with this button.
///
@property(nonatomic, strong) GWAMaskedWalletRequest *maskedWalletRequest;

@end
