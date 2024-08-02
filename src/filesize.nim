import strutils, strformat, math

const Units = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"]

type
  ConversionError* = object of CatchableError

proc findUnitIndex(unit: string): int =
  result = Units.find(unit.toUpperAscii())
  if result == -1:
    raise newException(ConversionError, fmt"Invalid unit: {unit}")

proc parseSize(size: string): float =
  try:
    result = parseFloat(size)
  except ValueError:
    raise newException(ConversionError, fmt"Invalid size format: {size}")

proc formatSize(size: float): string =
  if size.abs() < 0.01:
    result = fmt"{size:.2f}"
  elif size.abs() >= 1e15:
    result = fmt"{size:.0f}"
  else:
    result = fmt"{size:.2f}"
  
  if result.endsWith(".00"):
    result = result[0..^4]  # Remove the ".00" suffix
  
  return result

proc convert*(size, unit: string): string =
  let parts = size.strip().split(maxsplit=1)
  if parts.len != 2:
    raise newException(ConversionError, fmt"Invalid input format: {size}")

  let 
    originalSize = parseSize(parts[0])
    fromIndex = findUnitIndex(parts[1])
    toIndex = findUnitIndex(unit)
    conversionFactor = pow(1000.0, float(fromIndex - toIndex))
  
  let newSize = originalSize * conversionFactor
  
  result = formatSize(newSize) & " " & Units[toIndex]