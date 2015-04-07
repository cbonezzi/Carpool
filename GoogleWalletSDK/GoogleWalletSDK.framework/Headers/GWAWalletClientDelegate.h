@class GWAWalletClient;
@class GWAFullWallet;
@class GWAMaskedWallet;

///
/// The delegate protocol for GWAWalletClient.  You must provide
/// an object that conforms to this protocol to get responses from the SDK.
///
@protocol GWAWalletClientDelegate<NSObject>

///
/// The masked wallet was successfully loaded. This method may be called in
/// response to either GWAWalletClient:: GWAWalletClient::loadMaskedWallet:
/// or changeMaskedWallet:. In some circumstances
/// GWAWalletClient::loadFullWallet: may cause a new masked wallet to be created,
/// in which case this callback will be called.
///
/// @param walletClient The GWAWalletClient instance that invoked this delegate method.
/// @param maskedWallet The masked wallet response.
///
- (void)walletClient:(GWAWalletClient *)walletClient
    didLoadMaskedWallet:(GWAMaskedWallet *)maskedWallet;

///
/// There was an error during the request that prevented a masked wallet from
/// being returned.  The error parameter gives the error code, and any additional
/// details about the error.
///
/// @param walletClient The GWAWalletClient instance that invoked this delegate method.
/// @param error Details about the error that prevented a successful masked wallet response.
///
- (void)walletClient:(GWAWalletClient *)walletClient
    didFailToLoadMaskedWalletWithError:(NSError *)error;

///
/// The full wallet was successfully loaded, including a chargeable proxy card.
/// The integrator is responsible for handling the proxy card in a PCI compliant
/// manner.
///
/// @param walletClient The GWAWalletClient instance that invoked this delegate method.
/// @param fullWallet The full wallet response.
///
- (void)walletClient:(GWAWalletClient *)walletClient
    didLoadFullWallet:(GWAFullWallet *)fullWallet;

///
/// There was an error during the request that prevented a full wallet from being
/// returned.  The error parameter gives the error code, and any additional
/// details about the error.
///
/// @param walletClient The GWAWalletClient instance that invoked this delegate method.
/// @param error Details about the error that prevented a successful full wallet response.
///
- (void)walletClient:(GWAWalletClient *)walletClient
    didFailToLoadFullWalletWithError:(NSError *)error;

///
/// The response for |checkForPreauthorization|.
/// If the response parameter is YES, loadMaskedWallet: will usually return a response
/// via the delegate callback without showing the Google Wallet payment method chooser to the user.
/// If the vaalue is NO, then GWAWalletClient::loadMaskedWallet: will bring up the Google Wallet
/// payment method chooser.
///
/// @param walletClient The GWAWalletClient instance that invoked this delegate method.
/// @param userIsPreauthorized YES if the user is preauthorized.
///
- (void)walletClient:(GWAWalletClient *)walletClient userIsPreauthorized:(BOOL)userIsPreauthorized;

@end
