Describe 'variable created in parent scope to "it" block' {
    # A variable set in a parent scope can be read...
    # but if you modify it a copy of that variable is
    # made in the local scope.
    $describe_var = 'original value'
    It 'can read variable from parent scope' {
        $describe_var | Should be 'original value'
    }
    It 'can modify that variable locally' {
        $describe_var = 'new value'
        $describe_var | Should be 'new value'
    }
    It 'modifying that variable locally does not change variable in parent scope' {
        $describe_var = 'new value'
        $r = Get-Variable describe_var -Scope 1 -ValueOnly
        $r | Should be 'original value'
    }
}