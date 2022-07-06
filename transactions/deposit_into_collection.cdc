import CryptoPoops from 0xf8d6e0586b0a20c7

transaction {

	prepare(acct: AuthAccount) {
    let aReferenceToCollection = acct.borrow<&CryptoPoops.Collection>(from: /storage/Collection)
					?? panic("No CryptoPoops found")
	aReferenceToCollection.deposit(token: <- CryptoPoops.CreateNFT())
	}

	execute {
	}

}
