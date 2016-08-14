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