# fprettify

fprettify is an auto-formatter for modern Fortran code that imposes strict whitespace formatting, written in Python.

This fork of fprettify changes a number of settings from the original repository, [which can be found here](https://github.com/fortran-lang/fprettify).

> Please note that use of the original fprettify will produce code that does not comply with GITM standards.

## Limitations

- Works only for modern Fortran (Fortran 90 upwards, not `*.f`).

## Requirements

- Python 3 (Python 2.7 no longer supported)
- [ConfigArgParse](https://pypi.org/project/ConfigArgParse), enables use of config files. Installed automatically with the below procedure.

## Installation

The GITM version of fprettify **cannot** be installed with `pip` or `conda`. Instead, this version must be built from source.

First, ensure you have a working python 3 distribution. It is recommended to use a clean environment, but not required.

> When contributing to GITM, we recommend placing the `fprettify` repository into the `srcPython` folder. This will help the bundled scripts find the necessary dependencies, but is of course not required.

Clone this repository & `cd` into it.

```sh
git clone git@github.com:GITMCode/fprettify.git
cd fprettify
```

Then install with:

```sh
pip install .
```

Or `python setup.py install`

Following this procedure should allow the use of fprettify from the command line in any directory. To enable fprettify to always find the GITM configuration file, it is recommended to copy it to your home directory:

```sh
cp .fprettify.rc ~/
```

Otherwise the flag `-c` can be used to specify the path to the config file. `fprettify` will print a warning that no configuration file was found but will not error.

## Usage

Using fprettify to format files can be done in a number of ways. From the command line, as long as the `.fprettify.rc` file is in your home directory or its path specified with `-c`, no other settings need to be changed.

### GITM Python File

A python file is included in the `GITM/srcPython` directory which will perform the necessary formatting.

The script can automatically check line length, find necessary config files, perform formatting in-place, show the formatting `diff`, etc. As an example, from GITM's root directory, to check if all files pass formatting checks:

```sh
python srcPython/format_GITM.py -f .
```

This will check line lengths, then call `fprettify` in diff mode. If anything is output from fprettify (so changes are recommended), the "formatting test" has failed.

Use `-a` to format in-place automatically, or `-h` to see all other available options.

### Command line tool

Autoformat file1, file2, ... inplace by

```sh
fprettify file1, file2, ...
```

The default indent is 2. If you prefer something else during development, use `-i n` argument. Just remember to change back to defaults before submitting a pull request.

In order to apply fprettify recursively to an entire Fortran project, use the `-r` option.

For more options, read

```sh
fprettify -h
```

## Examples

Compare `examples/*before.f90` (original Fortran files) with `examples/*after.f90` (reformatted Fortran files) to see what fprettify does. A quick demonstration:

```Fortran
program demo
integer :: endif,if,elseif
integer,DIMENSION(2) :: function
endif=3;if=2
if(endif==2)then
endif=5
elseif=if+4*(endif+&
2**10)
elseif(endif==3)then
function(if)=endif/elseif
print*,endif
endif
end program
```

⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩ `fprettify` ⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩

```Fortran
program demo
  integer :: endif, if, elseif
  integer, DIMENSION(2) :: function
  endif = 3; if = 2
  if (endif == 2) then
      endif = 5
      elseif = if + 4*(endif + &
                      2**10)
  elseif (endif == 3) then
    function(if) = endif/elseif
    print *, endif
  endif
end program
```
