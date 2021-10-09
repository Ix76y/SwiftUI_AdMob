# SwiftUI_AdMob
AdMob implementations for SwiftUI

## Ads
Currently this repo contains:
### RewardedAds
Usage in SwiftUI:
```Swift
init(){
  self.rewardAd = RewardedAd()
  rewardAd.load()
}

var body: some View {
  self.rewardAd.showAd(rewardFunction: { // TODO }
}
```

### BannerAds
Usage in SwiftUI:
```Swift
BannerAd()
```

## How to integrate this into your own project
1. Add the AdMob SDK to your `Podfile`, you can copy the `Podfile` of this project
2. Install the pods and update your `info.plsit` and add your own Ad ID. Check out the official AdMob documentation for an example
3. Copy the ad file from this repository into your own project and replace the AdIds
4. Initialize the Ad framework in your app file
4. Add the Ads in your SwiftUI code and you are ready to go

### Troubleshooting
I sometime run into very strange and unexpected errors when I integrate AdMob into my app, which is why I usually add it when the project is nearly finished. If you run into some issues, a lot of times I just run `pod install --repo-update` again, which solves most of the problems.
You can also check out my [Medium Article](https://ix76y.medium.com/3d6c2325c1c4?source=friends_link&sk=ca82c890ffff0a1f048f02d6efcbd97b) for more help on how to set up AdMob in XCode 13. 
