import CryptoPoops from 0xf8d6e0586b0a20c7

transaction(recipient: Address, id: UInt64) {

	//the giver of the NFT
	prepare(acct: AuthAccount) {
		let collection = acct.borrow<&CryptoPoops.Collection>(from: /storage/Collection)!

		let publicReference = getAccount(recipient).getCapability(/public/Collection)
							.borrow<&CryptoPoops.Collection{CryptoPoops.CollectionPublic}>()
							?? panic("This account does not have a collection")

		publicReference.deposit(token: <- collection.withdraw(id: id))


	}

	execute {
	}
}
