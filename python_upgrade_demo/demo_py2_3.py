"""
Sample python application
"""
import sys


def test_version():
    assert type(7/5) == int


def greet():
    greeting = "Hello World of python {version}"
    version = sys.version.split()[0]
    print(greeting.format(version=version))


def main():
    greet()
    test_version()


if __name__ == "__main__":
    main()
