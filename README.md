# check_ram
Monitor RAM usage with ease & performance data support.

## Setup
You need to have free installed, on systems using apt, use:
```
apt install free
```

## Usage
```
Usage: check_ram [OPTIONS]
  [OPTIONS]:
  -w WARNING        Warning threshold in percent of used memory (default: 80%)
  -c CRITICAL       Critical threshold in percent of used memory (default: 90%)
```

## Example Output
```
OK: 34% used memory |used=34%;80;90;0;100
```

## Command Template
```
object CheckCommand "check-ram" {
  command = [ ConfigDir + "/scripts/check_ram.sh" ]
  arguments += {
    "-c" = "$cfr_critical$"
    "-w" = "$cfr_warning$"
  }
}
```

## Screenshot
![graph](https://i.imgur.com/SDIXisP.png)

