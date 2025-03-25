# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9,10,11,12} )

inherit distutils-r1

DESCRIPTION="Screen capture using pygtk, inspired by scrot"
HOMEPAGE="https://github.com/Roger/escrotum"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
else
	SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pycairo[${PYTHON_USEDEP}]
	dev-python/pygobject:3[${PYTHON_USEDEP}]
	dev-python/xcffib[${PYTHON_USEDEP}]
	media-video/ffmpeg"
RDEPEND="${DEPEND}
"

src_install() {
	distutils-r1_src_install
	doman man/${PN}.1
}
