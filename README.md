#Merlin

A custom shell configuration/toolset for internal checks, includes all software in Jinsku "tools" repo as well as helpful bash functions, which are documented below.


##Installing

Add the following to your .bashrc or .bash_profile

```bash
source ~/houdini/.hsh_local
```


##Built-in Functions

###conncheck

Check connections on specified port using Netstat (requires root for full info)

Example usage:
```bash
conncheck 22
    2 0.0.0.0
```


###suptime

Returns uptime statistics for LAMP stacks (requires root)

Example usage:
```bash
suptime
Server uptime:  13:23:44 up 7 days   5:53
MySQL uptime: 5 minutes, 14 hours
Apache uptime: 7 days, 14 hours
```


###ds{,n}

Return A-records and Name servers for specified hostname only

Example usage:

```bash
ds google.com
216.58.219.238
```

```bash
dsn google.com
ns4.google.com.
ns3.google.com.
ns2.google.com.
ns1.google.com.
```


###timestamp

Returns human readable format for many timestamp formats (epoch timestamps not yet supported because bash is a fickle mistress)

Example usage:

```bash
timestamp "October 19, 6969"
Thu Oct 19 00:00:00 EDT 6969
```

###rpeaks

Returns peak sar -r usage in human-readable format

Example usage:

```bash
rpeaks 
FREE   TIME
1.93G  16:48
1.93G  16:42
1.93G  16:38
1.93G  16:36
1.93G  16:32
1.93G  16:24
1.93G  16:22
1.93G  16:14
1.93G  01:42
1.93G  00:42
```
