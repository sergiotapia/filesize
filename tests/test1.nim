# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

import filesize

# Small to large units.
test "convert#string in bytes to bytes":
  check convert("1024 B", "B") == "1024 B"

test "convert#string in bytes to kilobytes":
  check convert("1024 B", "KB") == "1.02 KB"

test "convert#string in bytes to megabytes":
  check convert("1024 B", "MB") == "0.00 MB"

test "convert#string in bytes to gigabytes":
  check convert("1024 B", "GB") == "0.00 GB"

test "convert#string in bytes to terabytes":
  check convert("1024 B", "TB") == "0.00 TB"

test "convert#string in bytes to petabytes":
  check convert("1024 B", "PB") == "0.00 PB"

# Large to small units.
test "convert#string in terabytes to gigabytes":
  check convert("8 TB", "GB") == "8000.00 GB"

test "convert#string in gigabytes to megabytes":
  check convert("2.048 GB", "MB") == "2048.00 MB"

test "convert#string in terabytes to bytes":
  check convert("2 TB", "B") == "2000000000000.00 B"

# Some real examples.

test "convert#string in megabytes to gigabytes":
  check convert("211.1 MB", "GB") == "0.21 GB"
