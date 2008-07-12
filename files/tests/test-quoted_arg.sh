atf_test_case quoted_arg
quoted_arg_head() {
    atf_set 'descr' 'Checks that quoted arguments pass unmolested'
}
quoted_arg_body() {
    input='-D"DEFAULT_MODULE_PATH=\"${LOCALBASE}/lib/security/\""'
    echo "${input}" > expout
    atf_check 'echowrapper ${input}' 0 expout ignore
}

atf_init_test_cases() {
    atf_add_test_case quoted_arg
}
