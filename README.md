# TinyTeX releases for Windows, macOS, and Linux

[![Build status](https://ci.appveyor.com/api/projects/status/2ortb2mqkm2fjg4k/branch/master?svg=true)](https://ci.appveyor.com/project/yihui/tinytex-releases/branch/master)

<a href="https://yihui.org/tinytex/"><img src="https://yihui.org/images/logo-tinytex.png" alt="tinytex logo" align="right" width="200px" /></a>

TinyTeX is a lightweight, cross-platform, portable, and easy-to-maintain LaTeX distribution based on TeX Live. You may see the Github repo (https://github.com/yihui/tinytex) and project homepage (https://yihui.org/tinytex/) for more info.

## Releases

The binary packages of TinyTeX are published (monthly) to the Github Releases of this repository: https://github.com/yihui/tinytex-releases/releases Each release contains three versions of TinyTeX:

- `TinyTeX-0.*` contains the `infraonly` scheme of TeX Live, without any LaTeX packages.

- `TinyTeX-1.*` contains [about 90 LaTeX packages](https://github.com/yihui/tinytex/blob/master/tools/pkgs-custom.txt) enough to compile common R Markdown documents (which was the original motivation of the TinyTeX project).

- `TinyTeX.*` contains [more LaTeX packages](https://github.com/yihui/tinytex/blob/master/tools/pkgs-yihui.txt) requested by the community.

The `zip` packages are for Windows. The `tgz` packages are for macOS. The `tar.gz` packages are for Linux.

For those who are curious about how these packages are built, please read [the FAQ 3 of TinyTeX](https://yihui.org/tinytex/faq/).

## Chocolatey package

You may install TinyTeX as [a Chocolatey package](https://chocolatey.org/packages/tinytex). First, you would need to install the [Chocolatey Package Manager](https://chocolatey.org/install) if it has not already been installed. Next type in the following command to install TinyTeX:

```powershell
choco install tinytex
```

This will install TinyTeX and make the TeX Live package manager, `tlmgr` available on PATH.

To uninstall TinyTeX, use the command:

```powershell
choco uninstall tinytex
```

## Scoop package

Scoop is another package manager for Windows. You need to install [_scoop_](https://scoop-docs.now.sh/docs/getting-started/Quick-Start.html) first to use it from powershell.

Apps for _scoop_ are available through "buckets". For now, TinyTeX binary packages are not available in the default **main** or **extras** buckets that comes with a new installation of _scoop_, but through the scoop bucket **r-bucket** at https://github.com/cderv/r-bucket/ with other R-related tools.

You need first to add this bucket
```powershell 
scoop bucket add r-bucket https://github.com/cderv/r-bucket.git
```

Then type the following command to install TinyTeX: 

```powershell
scoop install tinytex
```

This will install TinyTeX and make the TeX Live package manager, `tlmgr` available on PATH.

To uninstall TinyTeX, use the command:

```powershell
scoop uninstall tinytex
```

For more information on this scoop package, please see https://github.com/cderv/r-bucket/.

## License

All code in this repository and TinyTeX are licensed under GPL-2. Per [copying conditions of TeX Live](https://tug.org/texlive/LICENSE.TL), we (TinyTeX authors) want to clarify that:

- We did not make changes to the TeX Live distribution, but basically packaged up a subset of its packages and redistributed them as TinyTeX.

- We do not claim copyright on TinyTeX. Again, TinyTeX is a subset of TeX Live (https://tug.org/texlive/), and TeX Live is developed as a joint effort by [all TeX user groups](https://tug.org/usergroups.html).
