pub contract CryptoPoops {
	pub var totalSupply: UInt64

	pub resource NFT {
		pub let id: UInt64

		init() {
			self.id = CryptoPoops.totalSupply
			CryptoPoops.totalSupply = CryptoPoops.totalSupply + 1
		}
	}

	pub resource interface CollectionPublic {
		pub fun getIDs(): [UInt64]
	}

	pub resource Collection: CollectionPublic {
		pub var ownedNFTs: @{UInt64: NFT}

		pub fun deposit(token: @NFT) {
			self.ownedNFTs[token.id] <-! token
		}

		pub fun withdraw(id: UInt64): @NFT {
			let token <- self.ownedNFTs.remove(key: id)
				?? panic("Token not found")

			return <- token
		}

		pub fun getIDs(): [UInt64] {
			return self.ownedNFTs.keys
		}

		init() {
			self.ownedNFTs <- {}
		}

		destroy() {
			destroy self.ownedNFTs
		}
	}

	pub fun createCollection(): @Collection {
		return <- create Collection()
	}

	pub fun createNFT(): @NFT {
		return <- create NFT()
	}

	init() {
		self.totalSupply = 0
	}
}
