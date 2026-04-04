EAPI=8

inherit cargo git-r3

DESCRIPTION="A modern rewrite of Iso2God in Rust for Linux"
HOMEPAGE="https://github.com/iliazeus/iso2god-rs"
EGIT_REPO_URI="https://github.com/iliazeus/iso2god-rs.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# Dependencies for building
BDEPEND="dev-lang/rust"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_compile() {
	cargo_src_compile
}

src_install() {
	# Installs the binary from target/release/iso2god to /usr/bin/
	cargo_src_install
}