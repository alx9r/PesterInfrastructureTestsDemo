﻿Describe 'Operating System Version' {
    It 'is Windows 8.1 or Server 2012R2' {
        # Assign the subject of your test to a variable...
        $r = Get-WmiObject Win32_OperatingSystem |
            % Version
        # ...that way you can set a breakpoint to debug it.
        $r | Should match '$6\.3\.'
    }
}