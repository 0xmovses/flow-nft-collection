import CryptoPoops from 0xf8d6e0586b0a20c7

transaction(recipient: Address) {

	//the NFT Minter will sign this tx
	prepare(acct: AuthAccount) {
		let nftMinter = acct.borrow<&CryptoPoops.NFTMinter>(from: /storage/Minter)!
		
		let publicReference = getAccount(recipient).getCapability(/public/Collection)
							.borrow<&CryptoPoops.Collection{CryptoPoops.CollectionPublic}>()
								?? panic("This account does not have a collection")

		publicReference.deposit(token: <- nftMinter.createNFT())

	}

	execute {
	}

}
