# TinyTeX releases for Windows, macOS, and Linux

[![Publish Monthly
Release](https://github.com/rstudio/tinytex-releases/actions/workflows/monthly-release.yaml/badge.svg)](https://github.com/rstudio/tinytex-releases/actions/workflows/monthly-release.yaml)

<a href="https://yihui.org/tinytex/"><img src="https://yihui.org/images/logo-tinytex.png" alt="tinytex logo" align="right" width="200px"/></a>

TinyTeX is a lightweight, cross-platform, portable, and easy-to-maintain LaTeX
distribution based on TeX Live. You may see the Github repo
(<https://github.com/rstudio/tinytex>) and project homepage
(<https://yihui.org/tinytex/>) for more info.

## Releases

The pre-built binary packages of TinyTeX are published (usually monthly but also
daily) to the Github Releases of this repository:
<https://github.com/rstudio/tinytex-releases/releases> Each release contains the
following variations that bundle different numbers of LaTeX packages:

-   `TinyTeX-0` contains the `infraonly` scheme of TeX Live, without any LaTeX
    packages. This is the smallest bundle. If you install this bundle, you may
    install any other packages via `tlmgr` (which is a utility included in this
    variation), e.g., `tlmgr install latex-bin framed`.

-   `TinyTeX-1` contains [about 90 LaTeX
    packages](https://github.com/rstudio/tinytex/blob/master/tools/pkgs-custom.txt)
    enough to compile common R Markdown documents (which was the original
    motivation of the TinyTeX project).

-   `TinyTeX` contains [more LaTeX
    packages](https://github.com/rstudio/tinytex/blob/master/tools/pkgs-yihui.txt)
    requested by the community. The list of packages may grow as time goes by,
    and the size of this bundle will grow correspondingly.

-   `TinyTeX-2` contains the `scheme-full` scheme of TeX Live, which means all
    LaTeX packages that you could possibly install from CTAN. This is the
    largest bundle, and only available in the [daily
    release](https://github.com/rstudio/tinytex-releases/releases/daily).

The `zip` packages are for Windows. The `tgz` packages are for macOS. The
`tar.gz` packages are for Linux. If you prefer using the daily build instead of
monthly releases, you may also download them from URLs of the form
`https://yihui.org/tinytex/BUNDLE.EXT`, where `BUNDLE` can be `TinyTeX-0`,
`TinyTeX-1`, or `TinyTeX`, and `EXT` can be `zip`, `tgz`, or `tar.gz`, e.g.,
<https://yihui.org/tinytex/TinyTeX.zip>.

| bundle                        | Windows                                                           | macOS                                                             | Linux                                                                   |
|-------------------------------|-------------------------------------------------------------------|-------------------------------------------------------------------|-------------------------------------------------------------------------|
| TinyTeX-0                     | [TinyTeX-0.zip](https://yihui.org/tinytex/TinyTeX-0.zip) (27 MB)  | [TinyTeX-0.tgz](https://yihui.org/tinytex/TinyTeX-0.tgz) (1.1 MB) | [TinyTeX-0.tar.gz](https://yihui.org/tinytex/TinyTeX-0.tar.gz) (800 KB) |
| TinyTeX-1                     | [TinyTeX-1.zip](https://yihui.org/tinytex/TinyTeX-1.zip) (99 MB)  | [TinyTeX-1.tgz](https://yihui.org/tinytex/TinyTeX-1.tgz) (84 MB)  | [TinyTeX-1.tar.gz](https://yihui.org/tinytex/TinyTeX-1.tar.gz) (66 MB)  |
| TinyTeX                       | [TinyTeX.zip](https://yihui.org/tinytex/TinyTeX.zip) (225+ MB)    | [TinyTeX.tgz](https://yihui.org/tinytex/TinyTeX.tgz) (217+ MB)    | [TinyTeX.tar.gz](https://yihui.org/tinytex/TinyTeX.tar.gz) (188+ MB)    |
| TinyTeX-2                     | [TinyTeX-2.zip](https://yihui.org/tinytex/TinyTeX-2.zip) (1.8 GB) | [TinyTeX-2.tgz](https://yihui.org/tinytex/TinyTeX-2.tgz) (1.8 GB) | [TinyTeX-2.tar.gz](https://yihui.org/tinytex/TinyTeX-2.tar.gz) (1.7 GB) |
| tinitex binary (experimental) | [tinitex.zip](https://yihui.org/tinytex/tinitex.zip) (25 MB)      | [tinitex.tgz](https://yihui.org/tinytex/tinitex.tgz) (30 MB)      | [tinitex.tar.gz](https://yihui.org/tinytex/tinitex.tar.gz) (33 MB)      |

For those who are curious about how these packages are built, please read [the
FAQ 4 of TinyTeX](https://yihui.org/tinytex/faq/).

## Installation

TinyTeX can be installed in a variety of ways. You may use R, shell/batch
scripts, Chocolatey, or Scoop to install it.

### R

You may use the R package [**tinytex**](https://github.com/rstudio/tinytex) to
install TinyTeX. By default, [the function
`tinytex::install_tinytex()`](https://yihui.org/tinytex/#for-r-users) installs
the latest daily build of TinyTeX. If you want to install a specific version in
this repo, you may use the `version` argument, e.g.,

``` r
tinytex::install_tinytex(version = "2020.10")
# use version = "latest" if you want to install the latest release
```

Note that `install_tinytex()` installs the bundle `TinyTeX-1` by default. If you
want to install other bundles, you can use the `bundle` argument, e.g.,

``` r
# the `bundle` argument requires a recent version of tinytex
if (packageVersion('tinytex') <= '0.39') remotes::install_github('rstudio/tinytex')

tinytex::install_tinytex(bundle = 'TinyTeX')
# You can also specify the version, e.g,
# tinytex::install_tinytex(bundle = 'TinyTeX', version = '2020.10')
```

### Shell/Batch scripts

Please see <https://yihui.org/tinytex/#installation> for how to install TinyTeX
via a Unix Shell or Windows Batch script. They also install the latest daily
build by default, and you may specify the TinyTeX version via an environment
variable `TINYTEX_VERSION` before running the installation script, e.g.,
`TINYTEX_VERSION=2020.10`. You may also specify other bundles of TinyTeX via the
environment variable `TINYTEX_INSTALLER`, e.g., `TINYTEX_INSTALLER=TinyTeX` (the
default is `TinyTeX-1`).

### Chocolatey

You may install TinyTeX as [a Chocolatey
package](https://chocolatey.org/packages/tinytex). First, you would need to
install the [Chocolatey Package Manager](https://chocolatey.org/install) if it
has not already been installed. Next type in the following command to install
TinyTeX:

``` powershell
choco install tinytex
```

This will install TinyTeX and make the TeX Live package manager, `tlmgr`
available on user PATH.

``` powershell
choco install tinytex -params "/AddToSystemPath"
```
This will install TinyTeX and make the TeX Live package manager, `tlmgr`
available on System PATH.

To uninstall TinyTeX, use the command:

``` powershell
choco uninstall tinytex
```

### Scoop

Scoop is another package manager for Windows. You need to install
[*scoop*](https://scoop-docs.now.sh/docs/getting-started/Quick-Start.html) first
to use it from powershell.

Apps for *scoop* are available through "buckets". For now, TinyTeX binary
packages are not available in the default **main** or **extras** buckets that
comes with a new installation of *scoop*, but through the scoop bucket
[**r-bucket**](https://github.com/cderv/r-bucket/). You need first to add this
bucket:

``` powershell
scoop bucket add r-bucket https://github.com/cderv/r-bucket.git
```

Then type the following command to install TinyTeX:

``` powershell
scoop install tinytex
```

This will install TinyTeX and make the TeX Live package manager, `tlmgr`
available on PATH. To uninstall TinyTeX, use the command:

``` powershell
scoop uninstall tinytex
```

For more information on this scoop package, please see
<https://github.com/cderv/r-bucket/>.

## License

All code in this repository and TinyTeX are licensed under GPL-2. Per [copying
conditions of TeX Live](https://tug.org/texlive/LICENSE.TL), we (TinyTeX
authors) want to clarify that:

-   We did not make changes to the TeX Live distribution, but basically packaged
    up a subset of its packages and redistributed them as TinyTeX.

-   We do not claim copyright on TinyTeX. Again, TinyTeX is a subset of TeX Live
    (<https://tug.org/texlive/>), and TeX Live is developed as a joint effort by
    [all TeX user groups](https://tug.org/usergroups.html).

Note that TinyTeX does not bundle the source code of LaTeX packages (to keep the
size small). If you do want to obtain the source, you may find them [on
CTAN](https://ctan.org). Alternatively, you can reinstall a package with the
command `tlmgr install --reinstall --with-src <PKG>` to obtain the source.
