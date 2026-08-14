# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 toolchain-funcs

DESCRIPTION="Minimal Wayland image cropper"
HOMEPAGE="https://github.com/HWXLR8/bcrop"
EGIT_REPO_URI="https://github.com/HWXLR8/bcrop.git"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	dev-libs/wayland
	media-libs/libjpeg-turbo:=
	media-libs/libpng:=
	media-libs/libwebp:=
	x11-libs/libxkbcommon
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
	dobin bcrop
	dodoc README.md
}
