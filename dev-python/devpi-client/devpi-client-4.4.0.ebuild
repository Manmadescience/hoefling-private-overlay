# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="Commands for python packaging and testing"
HOMEPAGE="https://pypi.org/project/devpi-client/ https://github.com/devpi/devpi"
SRC_URI="
	mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
#	https://github.com/docopt/docopt/archive/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/devpi-common[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-flake8[${PYTHON_USEDEP}]
	)"

python_test() {
	 ${EPYTHON} -m pytest -vv || die
}
