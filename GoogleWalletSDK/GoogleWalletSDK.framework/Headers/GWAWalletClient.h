#import "GWAEnvironment.h"

@protocol GWAWalletClientDelegate;

@class GWAMaskedWalletRequest;
@class GWAFullWalletRequest;

typedef NS_ENUM(NSInteger, GWATransactionStatus) {
  kGWATransactionStatusSuccess,
  kGWATransactionStatusAVSDecline,
  kGWATransactionStatusBadCard,
  kGWATransactionStatusBadCvc,
  kGWATransactionStatusDeclined,
  kGWATransactionStatusFraudDecline,
  kGWATransactionStatusOther,
  kGWATransactionStatusUnknown,
};

///
/// The iOS Wallet client.  This class provides methods for the complete
/// Google Wallet transaction lifecycle.
///
@interface GWAWalletClient : NSObject

///
/// The object to handle callback results for GWAWalletClient::loadMaskedWallet:
/// and GWAWalletClient::loadFullWallet:. This property must be non-nil to receive results
/// from the SDK.
///
@property(weak, nonatomic) id<GWAWalletClientDelegate> delegate;

///
/// The environment to use.
/// This property defaults to kGWAEnvironmentSandbox.
///
@property(nonatomic, assign) GWAEnvironment environment;

///
/// The email address of the Google account to prefer for transactions.
/// If this property is nil, an appropriate default account will be used.
///
@property(nonatomic, copy) NSString *preferredAccount;

///
/// The OAuth Client ID from the Google Developer Console.
/// This property must be set in order to use preauthorization.
///
@property(nonatomic, copy) NSString *clientId;

///
/// The OAuth Client Secret from the Google Developer Console.
/// This property must be set in order to use preauthorization.
///
@property(nonatomic, copy) NSString *clientSecret;

///
/// Returns the singleton wallet client. Creates a new client with default values if necessary.
/// Remember to set the delegate and environment as necessary.
///
+ (GWAWalletClient *)sharedInstance;

///
/// Checks if a user on the device has authorized this app to use Google Wallet for
/// payments with a default instrument and shipping address.  A preauthorized user may
/// still need to see the Chooser to resolve conditions such as an expired card.  The
/// response will be returned via a delegate callback.
///
- (void)checkForPreauthorization;

///
/// Load a masked wallet for the user. GWAWalletButton calls this method
/// automatically on click; this the recommended way to load the masked
/// wallet. Only for special use cases should you use this method to load
/// a user's masked wallet.
///
/// When necessary, the Google Wallet selection interface will be shown to
/// the user. The response will be returned via the delegate.
///
- (void)loadMaskedWallet:(GWAMaskedWalletRequest *)maskedWalletRequest;

///
/// Load a full wallet for the user. When necessary, a Google Wallet UI may be
/// shown to the user to resolve issues to complete the transction. The response
/// will be returned via the delegate.  Note that in some cases where user action
/// was required to resolve isssues, a masked wallet response may be returned instead
/// of a full wallet response.
///
- (void)loadFullWallet:(GWAFullWalletRequest *)fullWalletRequest;

///
/// Brings up the Google Wallet selection interface.  After the initial masked
/// wallet was loaded, this method can be used to allow the user to change his
/// wallet selections for the current transaction. The response will be returned
/// via the delegate.
///
- (void)changeMaskedWalletWithGoogleTransactionId:(NSString *)googleTransactionId
                            merchantTransactionId:(NSString *)merchantTransactionId;

///
/// Reports success or failure status while processing the proxy card.  No
/// response is returned via the delegate.
///
- (void)notifyTransactionStatus:(GWATransactionStatus)transactionStatus;

///
/// This method must be called from within the merchant app UIApplicationDelegate
/// implementation of application:openURL:sourceApplication:annotation:.  If the
/// URL is intended for the Wallet SDK (and not for the merchant app itself),
/// this method will complete processing of the request and return YES.  If the
/// URL is not recognized by the SDK, this method will return NO.
///
+ (BOOL)handleOpenURL:(NSURL *)url
    sourceApplication:(NSString *)sourceApplication
           annotation:(id)annotation;

@end
