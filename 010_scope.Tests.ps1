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
Describe 'members of objects created in parent scope' {
    # The members of objects created in parent scope to it block...
    # can be modified in "it" block.
    # That way you can access data inside an "it" block
    # from code outside it.
    $describe_hashtable = @{
        Member = 'original value'
    }
    It 'can read a member of variable in parent scope' {
        $describe_hashtable.Member | Should be 'original value'
    }
    It 'can modify a member of a variable in parent scope' {
        $describe_hashtable.Member = 'new value'
        $describe_hashtable.Member | Should be 'new value'
    }
    It 'the modified value of that member is available in another "it" scope' {
        $describe_hashtable.Member | Should be 'new value'
    }
}