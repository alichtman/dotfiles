#!/bin/env python3

import subprocess
from shutil import which
from json import loads

def main():
    wego = which('wego')
    if wego is None:
        return "Missing wego"

    cmd = [wego, '-l', 'Seattle', '-f', 'json']
    output = subprocess.check_output(cmd).decode('utf-8').strip()
    try:
        data = loads(output)
    except ValueError:
        return "Invalid JSON"

    current_data = data['Current']
    current_condition = current_data['Desc'].strip().capitalize()

    current_temp_celcius = float(current_data['TempC'])
    current_temp_fahrenheit = 1.8 * current_temp_celcius + 32

    output = current_condition + ' - {:.0f}F'.format(current_temp_fahrenheit)
    #  print(output, end='')
    print("fix this")
    return "fix this"
    #  return output

if __name__ == '__main__':
    main()
