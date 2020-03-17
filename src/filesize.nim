# This is just an example to get you started. A typical library package
# exports the main API in this file. Note that you cannot rename this file
# but you can remove it if you wish.

import strutils
import strformat
import math
import unicode

const units = ["b", "kb", "mb", "gb", "tb", "pb", "eb", "zb", "yb"]

proc convert*(size, unit: string): string =
  let originalSize = size.split(" ")[0].toLowerAscii()
  let originalUnit = size.split(" ")[1].toLowerAscii()
  var toUnit = unit.toLowerAscii()

  var fromIndex = units.find(originalUnit)
  var toIndex = units.find(toUnit)

  var digits = float(fromIndex - toIndex)
  var newSize = 0.0

  if digits == 0.0:
    result = &"{originalSize} {originalUnit.toUpper()}"
  elif digits < 0.0:
    digits = digits * -1
    newSize = parseFloat(originalSize) / (pow(1000.0, digits))
    let newSizeString = newSize.formatFloat(ffDecimal, 2)
    result = &"{newSizeString} {toUnit.toUpper()}"
  elif digits > 0.0:
    digits = digits
    newSize = parseFloat(originalSize) * (pow(1000.0, digits))
    let newSizeString = newSize.formatFloat(ffDecimal, 2)
    result = &"{newSizeString} {toUnit.toUpper()}"
  else:
    echo "Something went wrong lol..."
