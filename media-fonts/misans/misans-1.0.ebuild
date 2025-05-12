EAPI=8

DESCRIPTION="MiSans - Xiaomi's main global typeface"
HOMEPAGE="https://font.mi.com/"
SRC_URI="https://hyperos.mi.com/font-download/MiSans_Global_ALL.zip"
LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}"

src_prepare() {
	default
	# unzip only MiSans.zip
	cd "${S}/MiSans Global _ALL" || die
	unzip -o "MiSans.zip" -d "${S}/misans" || die
}

src_install() {
	insinto /usr/share/fonts/misans

	# TTF
	if compgen -G "${S}/misans/MiSans/ttf/*.ttf" > /dev/null; then
		doins "${S}/misans/MiSans/ttf/"*.ttf || die
	fi

	# OTF
	if compgen -G "${S}/misans/MiSans/otf/*.otf" > /dev/null; then
		doins "${S}/misans/MiSans/otf/"*.otf || die
	fi

	# WOFF
	if compgen -G "${S}/misans/MiSans/woff/*.woff" > /dev/null; then
		doins "${S}/misans/MiSans/woff/"*.woff || die
	fi

	# WOFF2
	if compgen -G "${S}/misans/MiSans/woff2/*.woff2" > /dev/null; then
		doins "${S}/misans/MiSans/woff2/"*.woff2 || die
	fi
}
