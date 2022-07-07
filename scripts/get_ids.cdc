import CryptoPoops from 0xf8d6e0586b0a20c7
import NonFungibleToken from 0xf8d6e0586b0a20c7

pub fun main(account: Address): [UInt64] {
	let publicReference = getAccount(account).getCapability(/public/Collection)
				.borrow<&NonFungibleToken.CollectionPublic{NonFungibleToken.CollectionPublic}>()
				?? panic("Account has no public collection")

	return publicReference.getIDs()
}
