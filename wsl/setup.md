# WIP

Setup a fresh WSL installation for Scala/Spark development.

## Utilities

```bash
sudo apt-get update -y && sudo apt install git-all curl zip unzip jq -y && sudo curl -fsSL https://raw.githubusercontent.com/databricks/setup-cli/main/install.sh | sudo sh
```

## SDKMAN!

```bash
curl -s "https://get.sdkman.io" | bash && source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install java 8.0.372-tem && sdk install sbt
```
<!-- sdk install java $(sdk list java | grep -o "\b8\.[0-9]*\.[0-9]*\-tem" | head -1) -->

## Enable systemd

[Microsoft Docs](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#systemd-support)

1. Open C:\Users\username.wslconfig
2. Find the line: guiApplications=false and change it to guiApplications=true. If you can not find the line, add it in the file.
3. Restart your PC.
4. Execute `wsl --update`
5. Execute `sudo apt-get -y update && sudo apt-get -y upgrade snapd`

## More utilities

```bash
sudo snap install intellij-idea-community --classic
```

