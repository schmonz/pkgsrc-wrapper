# $NetBSD: test-prepend_path.sh,v 1.1.2.2 2008/07/13 18:36:31 schmonz Exp $
#

# PATH=${WRAPPER_BINDIR}:${BUILDLINK_BINDIR}:${TOOLS_DIR}/bin:regularstuff
# 
# slicing wrapper off the front would leave buildlink:tools:more, and slicing buildlink off the front of that would leave tools:more, and slicing tools off the front of that would leave more. this is a fine test but too big for wrapper.
# 
# calling an unqualified "gcc" (or any other wrappers that can be generated) should be finding ours first. that's the point. test this.

atf_test_case prepend_path
prepend_path_head() {
    atf_set 'descr' 'Checks that wrappers are prepended to PATH'
}
prepend_path_body() {
    #echo "-ledit -ltermcap -lm" > expout
    #atf_check 'echowrapper ${input}' 0 expout ignore
    atf_fail "WRAPPER_BINDIR: ${WRAPPER_BINDIR} and PATH: ${PATH}"
}

atf_init_test_cases() {
    atf_add_test_case prepend_path
}
