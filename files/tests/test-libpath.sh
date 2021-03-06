# $NetBSD: test-libpath.sh,v 1.1.2.3 2009/03/30 01:02:26 schmonz Exp $
#

atf_test_case libpath
libpath_head() {
    atf_set 'descr' 'XXX autoconverted from libpath.mk'
}
libpath_body() {
    input="${LOCALBASE}/lib/libfoo.la"
    echo "${BUILDLINK_DIR}/lib/libfoo.la" > expout
    atf-check -s eq:0 -o file:expout e ignore 'echowrapper ${input}'
}

atf_test_case libpath_in_define
libpath_in_define_head() {
    atf_set 'descr' 'XXX autoconverted from libpath-in-define.mk'
}
libpath_in_define_body() {
    input="-DFOO=\"${LOCALBASE}/lib/libfoo.la\""
    echo "-DFOO=\"${LOCALBASE}/lib/libfoo.la\"" > expout
    atf-check -s eq:0 -o file:expout e ignore 'echowrapper ${input}'
}

atf_test_case libpath_shlib
libpath_shlib_head() {
    atf_set 'descr' 'XXX autoconverted from libpath-shlib.mk'
}
libpath_shlib_body() {
    input="${LOCALBASE}/lib/libfoo.so"
    echo "-L${BUILDLINK_DIR}/lib -lfoo" > expout
    atf-check -s eq:0 -o file:expout e ignore 'echowrapper ${input}'
}

atf_test_case libpath_shmod
libpath_shmod_head() {
    atf_set 'descr' 'XXX autoconverted from libpath-shmod.mk'
}
libpath_shmod_body() {
    input="${LOCALBASE}/lib/module/foo.so"
    echo "${LOCALBASE}/lib/module/foo.so" > expout
    atf-check -s eq:0 -o file:expout e ignore 'echowrapper ${input}'
}

atf_init_test_cases() {
    atf_add_test_case libpath
    atf_add_test_case libpath_in_define
    atf_add_test_case libpath_shlib
    atf_add_test_case libpath_shmod
}
