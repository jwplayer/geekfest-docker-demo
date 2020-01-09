"""
Sample python application
"""
import sys


def main():
    greeting = "Hello World of python {version}, where 7 divided by 5 yields {result}"
    version = sys.version.split()[0]
    division_result = 7/5
    print(greeting.format(version=version, result=division_result))


if __name__ == "__main__":
    main()
