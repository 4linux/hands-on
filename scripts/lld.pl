#!/usr/bin/perl
$output = `which ss` ? `ss -Hnltup` : `netstat -nltup | tail -n +3`;

for (split("\n", $output)) {
    ($proto, $port, $process) = $_ =~ m/([tu]cp).*:([0-9]+) [\w:.*()\[\]çÇ ]+"?\/?([\w\-.]*)"?/g;
        $pp = $port.'/'.$proto;
    ($service_name, $service_pp) = split(/\s+/, `getent services $pp`);
    $services{$pp} = '{"{#SERVICE}" : "'.$service_name.'", "{#PROCESS}" : "'.$process.'", "{#PORT}" : "'.$port.'", "{#PROTOCOL}" : "'.$proto.'"}';
}

print '{"data":['. join(',', values(%services)) .']}';
