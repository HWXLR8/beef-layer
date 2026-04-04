# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit desktop xdg

DESCRIPTION="3D printer slicing software for QIDI printers"
HOMEPAGE="https://github.com/QIDITECH/QIDIStudio"

MY_PV="v0${PV}"

SRC_URI="
	${HOMEPAGE}/releases/download/v${PV}/QIDIStudio_${MY_PV}_Ubuntu24.AppImage -> ${P}.AppImage
	${HOMEPAGE}/raw/v${PV}/resources/images/QIDIStudio.png -> ${PN}-icon.png
"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

RESTRICT="bindist mirror strip"

RDEPEND="
	net-libs/webkit-gtk:4.1
	sys-fs/fuse:0
"

QA_PREBUILT="*"
S="${DISTDIR}"

src_install() {
	exeinto "/opt/${PN}"
	doexe "${P}.AppImage"
	dosym "/opt/${PN}/${P}.AppImage" "/usr/bin/${PN}" || die "dosym failed"
	doicon -s 128 "${PN}-icon.png" || die "doicon failed"
}