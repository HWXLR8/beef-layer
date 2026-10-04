# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 toolchain-funcs

DESCRIPTION="Minimal Wayland image viewer with crop support"
HOMEPAGE="https://github.com/HWXLR8/bimg"
EGIT_REPO_URI="https://github.com/HWXLR8/bimg.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-libs/wayland
	media-libs/libglvnd
	media-libs/libjpeg-turbo:=
	media-libs/libpng:=
	media-libs/libwebp:=
	virtual/opengl
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-libs/wayland-protocols
	dev-util/wayland-scanner
	virtual/pkgconfig
"

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	dobin bimg
}
