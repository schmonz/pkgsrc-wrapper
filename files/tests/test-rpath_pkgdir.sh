# $NetBSD: test-rpath_pkgdir.sh,v 1.1.2.3 2009/03/30 01:02:26 schmonz Exp $
#

atf_test_case rpath_pkgdir
rpath_pkgdir_head() {
    atf_set 'descr' 'XXX autoconverted from rpath-pkgdir.mk'
}
rpath_pkgdir_body() {
    input="${COMPILER_RPATH_FLAG}${LOCALBASE}/lib"
    case "${_USE_RPATH}" in
    [yY][eE][sS])
        echo "${COMPILER_RPATH_FLAG}${LOCALBASE}/lib" > expout
        ;;
    *)
        echo > expout
        ;;
    esac
    atf-check -s eq:0 -o file:expout e ignore 'echowrapper ${input}'
}

atf_test_case rpath_pkgdir_slashdot
rpath_pkgdir_slashdot_head() {
    atf_set 'descr' 'XXX autoconverted from rpath-pkgdir-slashdot.mk'
}
rpath_pkgdir_slashdot_body() {
    input="${COMPILER_RPATH_FLAG}${LOCALBASE}/lib/."
    case "${_USE_RPATH}" in
    [yY][eE][sS])
        echo "${COMPILER_RPATH_FLAG}${LOCALBASE}/lib" > expout
        ;;
    *)
        echo > expout
        ;;
    esac
    atf-check -s eq:0 -o file:expout e ignore 'echowrapper ${input}'
}

atf_test_case rpath_pkgsubdir
rpath_pkgsubdir_head() {
    atf_set 'descr' 'XXX autoconverted from rpath-pkgsubdir.mk'
}
rpath_pkgsubdir_body() {
    input="${COMPILER_RPATH_FLAG}${LOCALBASE}/lib/mysql"
    case "${_USE_RPATH}" in
    [yY][eE][sS])
        echo "${COMPILER_RPATH_FLAG}${LOCALBASE}/lib/mysql" > expout
        ;;
    *)
        echo > expout
        ;;
    esac
    atf-check -s eq:0 -o file:expout e ignore 'echowrapper ${input}'
}

atf_init_test_cases() {
    atf_add_test_case rpath_pkgdir
    atf_add_test_case rpath_pkgdir_slashdot
    atf_add_test_case rpath_pkgsubdir
}
