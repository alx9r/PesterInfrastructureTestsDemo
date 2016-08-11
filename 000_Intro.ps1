$myName =         ''
$githubUsername = 'alx9r'

# the demo code is available in my github repo
$democodeRepo = 'https://github.com/alx9r/PesterInfrastructureTestsDemo.git'

# Here's a taste of what I'm testing in my infrastructure
$myInfrastructureTests = @(
    'HyperV - VM and switch configuration complies with policy'
    'HyperVReplication - correct configuration, replication occuring and healthy'
    'Bitlocker - enabled, encrypted'
    'PERC - maintenance jobs happening, parse logs for disk health, RAID config matches policy'
    'TimeZones - all servers on the right timezone'
)
$totalNumberOfTestsToday = 1700

# Here are the things I'm going to demonstrate to you.
$todaysDemos = @(
    'super-basic Pester Infrastructure test'
    'make that test breakpoint-friendly'
    'apply the test to multiple computers'
    'break the test into finer constituent parts'
    'rapidly iterate on test development and debugging'
)