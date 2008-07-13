# $NetBSD: test-rpath_split.sh,v 1.1.2.1 2008/07/13 20:10:37 schmonz Exp $
#

atf_test_case rpath_split
rpath_split_head() {
    atf_set 'descr' 'XXX autoconverted from rpath-split.mk'
}
rpath_split_body() {
    input="${COMPILER_RPATH_FLAG}${LOCALBASE}/lib:${LOCALBASE}/lib/foo"
    case "${_USE_RPATH}" in
    [yY][eE][sS])
        echo "${COMPILER_RPATH_FLAG}${LOCALBASE}/lib ${COMPILER_RPATH_FLAG}${LOCALBASE}/lib/foo" > expout
        ;;
    *)
        echo > expout
        ;;
    esac
    atf_check 'echowrapper ${input}' 0 expout ignore
}

atf_init_test_cases() {
    atf_add_test_case rpath_split
}
