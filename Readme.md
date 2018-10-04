<p align="center" >
<img src="https://raw.githubusercontent.com/Mumble-SRL/MBurger-iOS/develop/Images/logo.png" alt="MBurger https://mumbleideas.it/wp-content/uploads/2017/12/Mumble-anim-300.gif Logo" title="Mumble Logo">
</p>

![Test Status](docs/badge.svg)
![License: MIT](https://img.shields.io/badge/pod-v1.0-blue.svg)
[![CocoaPods](https://img.shields.io/badge/License-Apache%202.0-yellow.svg)](LICENSE)

# MBPayments
MBPayments is a plugin libary for MBurger, written in Objective-C, that can be used to add the payment functionalyt to MBurger. The minimum deplaoyment target for the library is iOS 10.0. MBPayments,is based upon MBurger and Stripe so you have to configure both before using it on the client app.
> Even this is a library written in Objective-C it can be integrated and used also in Swift projects. The example code below will be in both languages.

# Installation

# Installation with CocoaPods

CocoaPods is a dependency manager for iOS, which automates and simplifies the process of using 3rd-party libraries in your projects. You can install CocoaPods with the following command:

```ruby
$ gem install cocoapods
```

To integrate the MBurger into your Xcode project using CocoaPods, specify it in your Podfile:

```ruby
platform :ios, '10.0'

target 'TargetName' do
    pod 'MBPayments', git: 'https://github.com/Mumble-SRL/MBPayments-iOS'
    pod 'MBurger', git: 'https://github.com/Mumble-SRL/MBurger-iOS'
end
```

If you use Swift rememember to add `use_frameworks!` before the pod declaration.


Then, run the following command:

```
$ pod install
```

CocoaPods is the preferred methot to install the library.

# Manual installation

To install the library manually drag and drop the folder `MBPayments` to your project structure in XCode. 

`MBPayments` is a plugin of [MBurger](https://nooko2.mumbleserver.it/) and it's based upon it so you have also to install it manually.

# Initialization

To initialize the SDK you have to add the `MBPayments` class to the array of plugins of `MBurger`.
If you want to add cards, payments and subscriptions you will have to create Stripe tokens so you have to configure its client SDK:

**Objective-C**:

```objective-c
#import "AppDelegate.h"
#import "MBurger.h"
#import "MPayments.h"
#import <Stripe/Stripe.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [MBManager sharedManager].apiToken = @"YOUR_API_TOKEN";
    [MBManager sharedManager].plugins = @[[MBPPayments new]];
    [STPPaymentConfiguration sharedInstance].publishableKey = @"YOUR_PUBLISHABLE_KEY";

    return YES;
}
```

**Swift**:

```swift
import MBurger
import MBPayments
import Stripe

...

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    MBManager.shared().apiToken = "YOUR_API_TOKEN"
    MBManager.shared().plugins = [MBPPayments()]
        
    STPPaymentConfiguration.shared().publishableKey = "YOUR_PUBLISHABLE_KEY"

    return true
}
```

# Create a customer

After setting up the SDK if you want to charge a user you have to create a customer for it:

**Objective-C**:

```objective-c
[MBPPayments createCustomerForCurrentUserWithSuccess:^{
        
} Failure:^(NSError *error) {
	NSLog(@"There was an error: %@", error.localizedDescription);
}];

```

**Swift**:

```swift
MBPPayments.createCustomerForCurrentUserWithSuccess({ in

}, failure: { (error) in

})
```


# User Settings

The user settings for the current authenticated user are in the `pluginsObjects` dictionary of a `MBUser` under the key `MBPaymentsUserKey`. It will return an instance of `MBPUserPaymentSettings`.


**Objective-C**:

```objective-c
MBPUserPaymentSettings *settings = (MBPUserPaymentSettings *) user.pluginsObjects[MBPaymentsUserKey]
```

**Swift**:

```swift
if let settings = user.pluginsObjects?[MBPaymentsUserKey] as? MBPUserPaymentSettings {
    // Do something with the settings.
}
```

# Charging a customer

To charge a customer with a single time payment you have to call the `createPayment` function:

**Objective-C**:

```objective-c
[MBPPayments createPayment:@"PAYMENT_ID"
                    Amount:AMOUNT_OF_PAYMENT
                  Quantity:1
                     Token:TOKEN_OF_THE_CARD
                      Meta:nil
                   Success:^{
                    
                   }
                   Failure:^(NSError * _Nonnull error) {
                    
                   }];
```

**Swift**:

```swift
MBPPayments.createPayment("PAYMENT_ID",
                          amount: AMOUNT_OF_PAYMENT,
                          quantity: 1,
                          token: TOKEN_OF_THE_CARD,
                          meta: nil,
                          success: {
                                    
        				 }) { error in
   				
   				         }
```

You can include metadata in the meta field and it will be returned in the purchase. If you don't add a token `MBPayments` will try to charge the customer with their default card.

# Subscriptions

You can handle also recurrent subscriptions with `MBPayments` with the functions `createSubscription:..`, `cancelSubscription:..` and `resumeSubscription:...`. They all have a parameter `subscription` wich is the name of the subscription created on the Stripe dashboard. 
If a subscription is cancelled and it's not expired yet it will go in the grace period. It will be valid until it's expired. 
A subscription can be resumed only if it's in the grace period, otherwise you have to create a new subscription for that customer. 

# Credit cards

You can create, retrieve and delete the cards of the user with the functions:
 `createCardWithToken:..`, `getCardsWithSuccess:` and `deleteCardWithCardId`.
 The card creation needs a Stripe token, that can be created with the Stripe SDK. You can also set a card of the user as default with `setDefaultCardWithCardId:` giving the id of the card.

# Documentation

For further information, you can check out the full SDK Reference in the [docs](docs) folder.


# Contacts

You can contuct us at [info@mumbleideas.it](mailto:info@mumbleideas.it).

# License

MBPayments is released under the Apache 2.0 license. See [LICENSE](LICENSE) for details.
