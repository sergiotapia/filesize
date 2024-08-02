# To run these tests, simply execute `nimble test`.

import unittest
import filesize

suite "convert":
  test "same unit":
    check convert("1024 B", "B") == "1024 B"
  
  test "bytes to larger units":
    check convert("1024 B", "KB") == "1.02 KB"
    check convert("1024 B", "MB") == "0 MB"
    check convert("1024 B", "GB") == "0 GB"
  
  test "larger units to bytes":
    check convert("1 KB", "B") == "1000 B"
    check convert("1 MB", "B") == "1000000 B"      
  
  test "between larger units":
    check convert("1 GB", "MB") == "1000 MB"
    check convert("1.5 TB", "GB") == "1500 GB"
    check convert("1.78 PB", "GB") == "1780000 GB"
  
  test "very small results":
    check convert("1 B", "YB") == "0 YB"
  
  test "very large results":
    check convert("1 YB", "B") == "999999999999999983222784. B"
  
  test "invalid input":
    expect ConversionError:
      discard convert("invalid", "B")
    expect ConversionError:
      discard convert("100", "B")
    expect ConversionError:
      discard convert("100 X", "B")
    expect ConversionError:
      discard convert("100 B", "X")