import NonFungibleToken from "./NonFungibleToken.cdc";

transaction {

	prepare(acct: AuthAccount) {
		acct.save(<- CryptoPoops.createCollection(), to : /storage/Collection)
		acct.link<&NonFungibleToken.CollectionPublic{NonFungibleToken.CollectionPublic, CryptoPoops.MyCollectionPublic}>(
			/public/Collection, target: /storage/Collection
		)
	}

	execute {
	}

}
