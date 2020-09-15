# TinyTeX for Windows

<a href="https://yihui.org/tinytex/"><img src="https://yihui.org/images/logo-tinytex.png" alt="tinytex logo" align="right" width="200px" /></a>

TinyTeX is a lightweight, cross-platform, portable, and easy-to-maintain LaTeX distribution based on TeX Live. You may see the Github repo (https://github.com/yihui/tinytex) and project homepage (https://yihui.org/tinytex/) for more info.

## Windows binaries

The Windows binaries of TinyTeX are published (monthly) to the Github Releases of this repository: https://github.com/yihui/tinytex-releases/releases Each release contains three versions of TinyTeX:

- `TinyTeX-0.zip` contains the `infraonly` scheme of TeX Live, without any LaTeX packages.

- `TinyTeX-1.zip` contains [about 60 LaTeX packages](https://github.com/yihui/tinytex/blob/master/tools/pkgs-custom.txt) enough to compile common R Markdown documents (which was the original motivation of the TinyTeX project).

- `TinyTeX.zip` contains [more LaTeX packages](https://github.com/yihui/tinytex/blob/master/tools/pkgs-yihui.txt) requested by the community.

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

Coming...
