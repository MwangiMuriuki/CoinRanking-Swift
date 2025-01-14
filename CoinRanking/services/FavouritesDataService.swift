//
//  FavouritesDataService.swift
//  CoinRanking
//
//  Created by Ernest Mwangi on 14/01/2025.
//

import Foundation
import CoreData

class FavouritesDataService: ObservableObject {
    private let container : NSPersistentContainer
    private let containerName = "FavouritesContainer"
    private let entityName = "FavouritesEntity"

    @Published var savedEntities = [FavouritesEntity]()

    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                print("Error Loading Your Favourites: \(error)")
            }
        }
        self.getFavourites()
    }

    func addCoinHandler(coin: CoinData){
        if let entity = savedEntities.first(where: {$0.coinUUID == coin.uuid}) {
            print("Item Exists")
        }
        else {
            addToFavourites(coin: coin)
        }
    }

  

    private func getFavourites() {
        let request = NSFetchRequest<FavouritesEntity>(entityName: entityName)

        do{
            savedEntities = try container.viewContext.fetch(request)

        } catch let error {
            print("Error Fetching Your Favourites: \(error)")
        }
    }

    private func addToFavourites(coin: CoinData) {
        let newFavourite = FavouritesEntity(context: container.viewContext)
        newFavourite.coinUUID = coin.uuid
        newFavourite.coinName = coin.name
        newFavourite.coinSymbol = coin.symbol
        newFavourite.coinRanking = coin.rank?.description
        newFavourite.coinIconUrl = coin.iconURL
        newFavourite.coinPrice = coin.price
        newFavourite.coinChange = coin.change
        applyChanges()
    }

    private func saveData() {
        do {
            try container.viewContext.save()
        }
        catch let error {
            print("Error Saving Your Favourites: \(error)")
        }
    }

    func deleteData(entity: FavouritesEntity){
        container.viewContext.delete(entity)
        applyChanges()
    }

    private func applyChanges() {
        saveData()
        getFavourites()
        print("Success Handling Favourites")
    }

}
