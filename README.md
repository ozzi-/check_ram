# check_ram
Monitor RAM usage with ease & performance data support.

## Setup
You need to have free installed, on systems using apt, use:
```
apt install free
```

## Usage
```
Usage: check_curl [OPTIONS]
  [OPTIONS]:
  -w WARNING        Warning threshold in percent of free memory (default: 15%)
  -c CRITICAL       Critical threshold in percent of free memory (default: 10%)
```

## Example Output
```
OK: 34% free memory |free=34%;15;10;0;100
```