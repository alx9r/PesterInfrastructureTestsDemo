Describe 'variable created inside it block' {
    # A variable created inside one It block isn't
    # accessible inside another It block.
    It 'create variable in "it" block' {
        $it_var = 'original value'
        $r = Get-Variable it_var -ValueOnly
        $r | Should be 'original value'
    }
    It 'variable does not exist in this "it" block' {
        { Get-Variable it_var -ea Stop } |
            Should throw 'Cannot find a variable'
    }
}