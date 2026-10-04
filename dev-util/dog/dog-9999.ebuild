# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 toolchain-funcs

DESCRIPTION="Minimal terminal coding agent"
HOMEPAGE="https://github.com/HWXLR8/dog"
EGIT_REPO_URI="https://github.com/HWXLR8/dog.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-cpp/nlohmann_json
	net-misc/curl
"
DEPEND="${RDEPEND}"

src_compile() {
	addflag -Isrc
	emake
}

src_install() {
	dobin dog
}
