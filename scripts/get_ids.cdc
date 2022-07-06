import CryptoPoops from 0xf8d6e0586b0a20c7

pub fun main(account: Address): [UInt64] {
	let publicReference = getAccount(account).getCapability(/public/Collection)
				.borrow<&CryptoPoops.Collection{CryptoPoops.CollectionPublic}>()
				?? panic("Account has no public collection")

	return publicReference.getIDs()
}
