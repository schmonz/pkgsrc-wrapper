# $NetBSD: test-rpath_merge.sh,v 1.1.2.2 2009/03/30 01:02:26 schmonz Exp $
#

atf_test_case rpath_merge
rpath_merge_head() {
    atf_set 'descr' 'XXX autoconverted from rpath-merge.mk'
}
rpath_merge_body() {
    input="${COMPILER_RPATH_FLAG:S/,$//} -Wl,${LOCALBASE}/lib:${LOCALBASE}/lib/foo"
    case "${_USE_RPATH}" in
    [yY][eE][sS])
        echo "${COMPILER_RPATH_FLAG}${LOCALBASE}/lib ${COMPILER_RPATH_FLAG}${LOCALBASE}/lib/foo" > expout
        ;;
    *)
        echo > expout
        ;;
    esac
    atf-check -s eq:0 -o file:expout e ignore 'echowrapper ${input}'
}

atf_init_test_cases() {
    atf_add_test_case rpath_merge
}
