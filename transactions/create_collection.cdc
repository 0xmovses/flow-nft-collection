import CryptoPoops from 0xf8d6e0586b0a20c7

transaction {

	prepare(acct: AuthAccount) {
		acct.save(<- CryptoPoops.createCollection(), to : /storage/Collection)
		acct.link<&CryptoPoops.Collection{CryptoPoops.CollectionPublic}>(
			/public/Collection, target: /storage/Collection
		)
	}

	execute {
	}

}
