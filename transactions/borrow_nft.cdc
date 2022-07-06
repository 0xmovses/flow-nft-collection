import CryptoPoops from 0xf8d6e0586b0a20c7

transaction {

	prepare(acct: AuthAccount) {
    let aReference = acct.borrow<&CryptoPoops.NFT>(from: /storage/MyCryptoPoops)
					?? panic("No CryptoPoops found")
	}

	execute {
	}

}
