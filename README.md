# Coin Ranking App
## About The App
The app shows a list of cryptocurrency coins, obtained by making data calls from the [CoinRankingAPI](https://api.coinranking.com/v2). 
Users can view coin details and add/remove coins from a favorites list.

## Built With
### Tech Stack
* App has been built using [Swift 5](https://www.swift.org/ "Swift's Homepage"), with the main framework being SwiftUI. Some views have been built using UIKit
* CoreData has been used to persist data(Favourite Coins) on the device

### APIs & Documentation
* [CoinRankingAPI](https://api.coinranking.com/v2)

## Requirements
* iOS 16.6+

## Technical Challenges
### Image Format Compatibility:
Most of the coin URL images fetched from the API endpoint were in '.svg' format, which Swift does not support out of the box. 

One solution for this challenge would be to use a 'WKWebView' to load the images but the drawback with this approach is that it takes too long to load data into the ImageView,
hence directly affecting app performance, especially on the TableView.

Another solution would be to use an external library. The Library of choice for the project is [SDWebImageSwiftUI](https://github.com/SDWebImage/SDWebImageSwiftUI).
This library also has the same major drawback as the solution listed above, where the performance of the TableView is directly impacted. With this in mind, I used the library to load the single images
in the CoinDetails page, but I did not have a solution to efficiently load '.svg' images on the TableView.
  
