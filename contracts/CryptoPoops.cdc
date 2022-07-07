import NonFungibleToken from "./NonFungibleToken.cdc" 

pub contract CryptoPoops: NonFungibleToken {
	pub var totalSupply: UInt64

	pub event ContractInitialized()

	pub event Withdraw(id: UInt64, from: Address?)

	pub event Deposit(id: UInt64, to: Address?)

	pub resource NFT: NonFungibleToken.INFT {
		pub let id: UInt64
		pub let name : String

		init() {
			self.id = CryptoPoops.totalSupply
			CryptoPoops.totalSupply = CryptoPoops.totalSupply + 1
			self.name = "CryptoPoops"
		}
	}


	pub resource Collection: NonFungibleToken.Provider, NonFungibleToken.Receiver, NonFungibleToken.CollectionPublic {
		pub var ownedNFTs: @{UInt64: NonFungibleToken.NFT}

		pub fun deposit(token: @NonFungibleToken.NFT) {
			self.ownedNFTs[token.id] <-! token
		}

		pub fun withdraw(withdrawID: UInt64): @NonFungibleToken.NFT {
			let token <- self.ownedNFTs.remove(key: withdrawID)
				?? panic("Token not found")

			return <- token
		}

		pub fun getIDs(): [UInt64] {
			return self.ownedNFTs.keys
		}

		pub fun borrowNFT(id: UInt64): &NonFungibleToken.NFT {
			return &self.ownedNFTs[id] as &NonFungibleToken.NFT
		}

		init() {
			self.ownedNFTs <- {}
		}

		destroy() {
			destroy self.ownedNFTs
		}
	}

	pub fun createEmptyCollection(): @Collection {
		return <- create Collection()
	}

	

	pub resource NFTMinter {
		pub fun createNFT(): @NFT {
			return <- create NFT()
		}

		init() {

		}
	}

	init() {
		self.totalSupply = 0
		emit ContractInitialized()
		self.account.save(<- create NFTMinter(), to:/storage/Minter)
	}
}
