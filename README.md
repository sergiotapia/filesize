# Filesize

A Nim package to convert filesizes into other units, and turns filesizes into human readable strings.

**Warning:** this package is still a WIP as I iron out the kinks and add better test coverage, use at your
own peril. It is not even published on https://nimble.directory yet.

## Examples:

```
test "convert#string in bytes to bytes":
  check convert("1024 B", "B") == "1024 B"

test "convert#string in bytes to kilobytes":
  check convert("1024 B", "KB") == "1.024 KB"

test "convert#string in bytes to megabytes":
  check convert("1024 B", "MB") == "0.001024 MB"

test "convert#string in bytes to gigabytes":
  check convert("1024 B", "GB") == "0.000001024 GB"

test "convert#string in bytes to terabytes":
  check convert("1024 B", "TB") == "0.000000001024 TB"

test "convert#string in bytes to petabytes":
  check convert("1024 B", "PB") == "0.000000000001024 PB"

# Large to small units.
test "convert#string in terabytes to gigabytes":
  check convert("8 TB", "GB") == "8000 GB"

test "convert#string in gigabytes to megabytes":
  check convert("2.048 GB", "MB") == "2048 MB"

test "convert#string in terabytes to bytes":
  check convert("2 TB", "B") == "2000000000000 B"
```